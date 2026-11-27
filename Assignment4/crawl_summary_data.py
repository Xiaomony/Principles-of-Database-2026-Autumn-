import csv
from concurrent.futures import ThreadPoolExecutor

import httpx
import psycopg
from correct_title import correct_title
from tqdm import tqdm

TABLE_NAME = "movie_summary"
MAX_THREADS = 20
URL = "https://api.themoviedb.org/3/search/movie"


def http_get(client: httpx.Client, title: str, region: str, year: int | None):
    resp = client.get(
        URL,
        params={"query": title, "year": year, "region": region},
    )
    resp.raise_for_status()
    return resp.json()["results"]


def query_movies_from_web(
    client: httpx.Client, movieid: int, title: str, region: str, year: int
) -> dict | None:
    # first attempt
    results = http_get(client, title, region, year)
    if len(results) > 0:
        return results[0]
    # second attempt: query without release year
    results = http_get(client, title, region, None)
    if len(results) > 0:
        min_release_year_diff = 10000
        target_movie = results[0]
        for x in results:
            if len(x["release_date"]) < 4:
                continue
            release_year = int(x["release_date"][:4])
            if min_release_year_diff > abs(release_year - year):
                min_release_year_diff = abs(release_year - year)
                target_movie = x
        return target_movie
    # third attempt: using corrected title
    corrected_title = correct_title(movieid)
    if corrected_title is not None:
        results = http_get(client, corrected_title, region, None)
        if len(results) > 0:
            return results[0]
    return None


def crawl_and_insert(
    client: httpx.Client, select_cursor: psycopg.Cursor, insert_cursor: psycopg.Cursor
):
    movie_count_query = select_cursor.execute("SELECT count(*) from movies;").fetchone()
    if movie_count_query is None:
        return
    QUERY_LIMIT = movie_count_query[0]
    BATCH_SIZE = 500
    select_cursor.execute(
        "SELECT movieid, title, country, year_released FROM movies LIMIT %s;",
        (QUERY_LIMIT,),
    )
    not_found_movies = []
    found_movies_count = 0
    batch = []

    def insert(batch: list):
        insert_cmd = f"INSERT INTO {TABLE_NAME} (movieid, summary) VALUES (%s, %s);"
        insert_cursor.executemany(
            insert_cmd,
            batch,
        )
        batch.clear()

    # multi-thread crawling
    def worker(record):
        return record, query_movies_from_web(
            client, record[0], record[1], record[2], record[3]
        )

    with ThreadPoolExecutor(max_workers=MAX_THREADS) as executor:
        results = executor.map(worker, select_cursor, buffersize=MAX_THREADS * 3)
        for record, target_movie in tqdm(
            results, desc="Crawling movies", total=QUERY_LIMIT
        ):
            if target_movie is None:
                not_found_movies.append(record)
                continue
            batch.append((record[0], target_movie["overview"]))
            if len(batch) >= BATCH_SIZE:
                insert(batch)
            found_movies_count += 1

        if batch:
            insert(batch)

        print(
            f"\n{found_movies_count} movies were found and inserted into database\n{len(not_found_movies)} movies were not found"
        )
        with open("not_found_movies.csv", "w", encoding="utf-8-sig", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["movieid", "title", "country", "year_released"])
            writer.writerows(not_found_movies)


def main():
    with (
        psycopg.connect("dbname=db_principles_assignment4 user=admin") as con,
        con.cursor() as select_cur,
        con.cursor() as insert_cur,
        open("./TMDB_api_token.txt") as api_token_file,
    ):
        # read API token from file
        TMDB_TOKEN = api_token_file.read().strip()
        headers = {
            "accept": "application/json",
            "Authorization": f"Bearer {TMDB_TOKEN}",
        }

        # drop privious table and create new one
        select_cur.execute(
            "SELECT NULL FROM information_schema.tables WHERE table_name = %s;",
            (TABLE_NAME,),
        )
        if select_cur.fetchone() is not None:
            select_cur.execute(f"DROP TABLE {TABLE_NAME};")
            print("DROPED the privious movie summary table")
        select_cur.execute(
            f"CREATE TABLE {TABLE_NAME}(movieid int PRIMARY KEY, summary varchar);"
        )
        print("CREATED a new movie summary table")

        # start to crawl data
        with httpx.Client(headers=headers, timeout=15) as client:
            crawl_and_insert(client, select_cur, insert_cur)


if __name__ == "__main__":
    main()

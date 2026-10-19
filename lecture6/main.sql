-- 1
SELECT
    c.country_name,
    m.title,
    m.latest_year
FROM
    (
        SELECT
            m.country,
            m.title,
            m.year_released,
            max(m.year_released) OVER (PARTITION BY country) AS latest_year
        FROM
            movies AS m
    )
    AS m
    INNER JOIN
        countries AS c
    ON m.country = c.country_code
WHERE
    m.year_released = m.latest_year AND c.continent = 'ASIA'
ORDER BY c.country_code;

-- 2
-- common table expression
SELECT
    x.country_name,
    x.cnt
FROM
    (
        SELECT
            c.country_name,
            count(*) AS cnt
        FROM
            movies AS m INNER JOIN countries AS c ON m.country = c.country_code
        GROUP BY c.country_name
    )
    AS x
WHERE
    cnt > (SELECT count(*) FROM movies) / (SELECT count(DISTINCT country) FROM movies)
ORDER BY cnt DESC;
-- window function
SELECT
    x.country_name,
    x.cnt
FROM
    (
        SELECT DISTINCT
            c.country_name,
            count(*) OVER (PARTITION BY m.country) AS cnt
        FROM
            movies AS m INNER JOIN countries AS c ON m.country = c.country_code
    )
    AS x
WHERE
    cnt > (SELECT count(*) FROM movies) / (SELECT count(DISTINCT country) FROM movies)
ORDER BY cnt DESC;

-- 3
SELECT DISTINCT
    c.country_name,
    round(100.0 * count(*) OVER (PARTITION BY country) / (SELECT count(*) FROM movies), 2)
    AS percentage
FROM
    movies AS m INNER JOIN countries AS c ON c.country_code = m.country
ORDER BY percentage;

-- 4
SELECT
    title,
    year_released
FROM
    (
        SELECT
            title,
            year_released,
            rank() OVER (ORDER BY year_released DESC) AS rnk
        FROM
            movies
        WHERE
            country = 'cn'
    )
WHERE
    rnk <= 10;

-- 5
SELECT
    continent,
    country_name,
    cnt
FROM
    (
        SELECT
            continent,
            country_name,
            cnt,
            rank() OVER (PARTITION BY continent ORDER BY cnt DESC) AS rnk
        FROM
            (
                SELECT
                    country_name,
                    continent,
                    count(*) AS cnt
                FROM
                    movies AS m INNER JOIN countries AS c ON m.country = c.country_code
                GROUP BY country_name,
                    continent
            )
    )
WHERE
    rnk = 1;

-- 6
SELECT
    country_name,
    first_name,
    surname,
    appearance
FROM
    (
        SELECT
            *,
            rank() OVER (PARTITION BY country_name ORDER BY appearance DESC) AS rnk
        FROM
            (
                SELECT
                    country_name,
                    peopleid,
                    count(*) AS appearance
                FROM
                    credits AS c INNER JOIN movies AS m ON c.movieid = m.movieid
                    INNER JOIN
                        countries
                    ON countries.country_code = m.country
                WHERE
                    countries.country_name
                    IN (
                        'China', 'United States', 'France', 'Italy', 'India'
                    ) AND
                    c.credited_as = 'A'
                GROUP BY country_name,
                    peopleid
            )
    )
    AS x
    INNER JOIN
        people AS p
    ON p.peopleid = x.peopleid
WHERE
    rnk <= 3;

-- 7
SELECT
    country_name,
    first_name,
    surname,
    appearance
FROM
    (
        SELECT
            *,
            rank() OVER (PARTITION BY country_name ORDER BY appearance DESC) AS rnk
        FROM
            (
                SELECT
                    country_name,
                    peopleid,
                    count(*) AS appearance
                FROM
                    credits AS c INNER JOIN movies AS m ON c.movieid = m.movieid
                    INNER JOIN
                        countries
                    ON countries.country_code = m.country
                WHERE
                    countries.country_name
                    IN (
                        'China', 'United States', 'France', 'Italy', 'India'
                    ) AND
                    c.credited_as = 'A' AND
                    year_released >= 2010
                GROUP BY country_name,
                    peopleid
            )
        WHERE
            appearance >= 3
    )
    AS x
    INNER JOIN
        people AS p
    ON p.peopleid = x.peopleid
WHERE
    rnk <= 3
ORDER BY country_name,
    appearance DESC;

-- 8
SELECT
    country_name,
    year_released,
    year_count,
    CASE
        WHEN lag(country_name, 1) OVER () = country_name
        THEN concat(
            round(
                (year_count - lag(year_count, 1) OVER ()) * 100.0 / lag(year_count, 1) OVER (),
                2
            ),
            '%'
        )
        ELSE NULL
    END
FROM
    (
        SELECT
            *,
            sum(year_count) OVER (PARTITION BY country_name) AS total_count_from_2010
        FROM
            (
                SELECT
                    c.country_name,
                    m.year_released,
                    count(*) AS year_count
                FROM
                    movies AS m INNER JOIN countries AS c ON m.country = c.country_code
                WHERE
                    m.year_released >= 2010
                GROUP BY c.country_name,
                    m.year_released
            )
        ORDER BY country_name,
            year_released
    )
WHERE
    total_count_from_2010 >= 20;

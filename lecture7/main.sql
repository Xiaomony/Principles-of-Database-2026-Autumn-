-- 1
SELECT
    title,
    country,
    year_released
FROM
    (
        SELECT
            m.title,
            m.country,
            m.year_released,
            count(*) AS cnt
        FROM
            movies AS m INNER JOIN credits AS c ON m.movieid = c.movieid
            INNER JOIN
                people AS p
            ON p.peopleid = c.peopleid
        WHERE
            c.credited_as = 'A' AND
            (
                (p.first_name = 'Humphrey' AND p.surname = 'Bogart') OR
                (p.first_name = 'Lauren' AND p.surname = 'Bacall')
            )
        GROUP BY m.title,
            m.country,
            m.year_released
    )
WHERE
    cnt = 2;

-- 2
SELECT
    count(*)
FROM
    (
        SELECT
            m.title,
            m.country,
            m.year_released,
            count(*) AS cnt
        FROM
            movies AS m INNER JOIN credits AS c ON m.movieid = c.movieid
            INNER JOIN
                people AS p
            ON p.peopleid = c.peopleid
        WHERE
            (c.credited_as = 'A' AND p.first_name = 'John' AND p.surname = 'Wayne') OR
            (c.credited_as = 'D' AND p.first_name = 'John' AND p.surname = 'Ford')
        GROUP BY m.title,
            m.country,
            m.year_released
    )
WHERE
    cnt = 2;

-- 3
SELECT
    p1.peopleid,
    p2.peopleid,
    p1.first_name,
    p1.surname,
    p1.born,
    p1.died
FROM
    people AS p1
    INNER JOIN
        people AS p2
    ON p1.first_name = p2.surname AND
        p1.surname = p2.first_name AND
        p1.born IS NOT DISTINCT FROM p2.born AND
        p1.died IS NOT DISTINCT FROM p2.died AND
        p2.peopleid > p1.peopleid;

-- 4
SELECT
    p.first_name,
    p.surname,
    x.last_film,
    p.died
FROM
    (
        SELECT
            c.peopleid,
            max(m.year_released) AS last_film
        FROM
            movies AS m INNER JOIN credits AS c ON c.movieid = m.movieid
        WHERE
            credited_as = 'A'
        GROUP BY c.peopleid
    )
    AS x
    INNER JOIN
        people AS p
    ON p.peopleid = x.peopleid
WHERE
    p.died IS NOT NULL AND p.died - x.last_film > 20;

-- 5
SELECT
    title,
    year_released,
    country
FROM
    (
        SELECT
            m.title,
            m.year_released,
            m.country,
            min(m.year_released) OVER () AS first_movie
        FROM
            credits AS c INNER JOIN movies AS m ON c.movieid = m.movieid
        WHERE
            c.peopleid =
            (SELECT peopleid FROM people WHERE first_name = 'Jackie' AND surname = 'Chan') AND
            c.credited_as = 'A'
    )
WHERE
    first_movie = year_released;

-- 6
SELECT
    p.first_name,
    p.surname,
    count(*) AS cnt
FROM
    credits AS c
    INNER JOIN
        (
            SELECT
                m.movieid
            FROM
                credits AS c INNER JOIN movies AS m ON c.movieid = m.movieid
            WHERE
                c.credited_as = 'D' AND
                c.peopleid =
                (SELECT peopleid FROM people WHERE first_name = 'Orson' AND surname = 'Welles')
        )
        AS x
    ON c.movieid = x.movieid
    INNER JOIN
        people AS p
    ON c.peopleid = p.peopleid
WHERE
    p.first_name <> 'Orson' OR p.surname <> 'Welles'
GROUP BY p.first_name,
    p.surname;

-- 7
SELECT
    year_released AS year,
    concat(title, ' (', c.country_name, ') was year_released') AS event
FROM
    movies AS m INNER JOIN countries AS c ON m.country = c.country_code
WHERE
    year_released BETWEEN 1930 AND 1935
UNION
SELECT
    born AS year,
    TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' was born')) AS event
FROM
    people AS p
WHERE
    born BETWEEN 1930 AND 1935
UNION
SELECT
    died AS year,
    TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' died')) AS event
FROM
    people AS p
WHERE
    died IS NOT NULL AND died BETWEEN 1930 AND 1935
ORDER BY year;

-- 8
SELECT
    year,
    event
FROM
    (
        SELECT
            year_released AS year,
            concat(title, ' (', c.country_name, ') was year_released') AS event,
            title AS sort_key
        FROM
            movies AS m INNER JOIN countries AS c ON m.country = c.country_code
        WHERE
            year_released BETWEEN 1930 AND 1935
        UNION
        SELECT
            born AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' was born')) AS event,
            p.surname AS sort_key
        FROM
            people AS p
        WHERE
            born BETWEEN 1930 AND 1935
        UNION
        SELECT
            died AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' died')) AS event,
            p.surname AS sort_key
        FROM
            people AS p
        WHERE
            died IS NOT NULL AND died BETWEEN 1930 AND 1935
    )
ORDER BY year,
    sort_key;

-- 9
SELECT
    year,
    event
FROM
    (
        SELECT
            year_released AS year,
            concat(title, ' (', c.country_name, ') was year_released') AS event,
            TRIM(replace(m.title, 'The', '')) AS sort_key
        FROM
            movies AS m INNER JOIN countries AS c ON m.country = c.country_code
        WHERE
            year_released BETWEEN 1930 AND 1935
        UNION
        SELECT
            born AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' was born')) AS event,
            p.surname AS sort_key
        FROM
            people AS p
        WHERE
            born BETWEEN 1930 AND 1935
        UNION
        SELECT
            died AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' died')) AS event,
            p.surname AS sort_key
        FROM
            people AS p
        WHERE
            died IS NOT NULL AND died BETWEEN 1930 AND 1935
    )
ORDER BY year,
    sort_key;

-- 10
SELECT
    year,
    event
FROM
    (
        SELECT
            year_released AS year,
            concat(title, ' (', c.country_name, ') was year_released') AS event
        FROM
            movies AS m INNER JOIN countries AS c ON m.country = c.country_code
        WHERE
            year_released BETWEEN 1930 AND 1935
        UNION
        SELECT
            born AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' was born')) AS event
        FROM
            people AS p
        WHERE
            born BETWEEN 1930 AND 1935
        UNION
        SELECT
            died AS year,
            TRIM(concat(COALESCE(p.first_name, ''), ' ', surname, ' died')) AS event
        FROM
            people AS p
        WHERE
            died IS NOT NULL AND died BETWEEN 1930 AND 1935
    )
WHERE
    year = (SELECT min(year_released) FROM movies WHERE title = 'Devdas');

-- 11
SELECT
    m.title,
    m.country,
    m.year_released
FROM
    (
        SELECT
            c.movieid,
            count(*) AS cnt,
            min(c.peopleid) AS min_people
        FROM
            credits AS c
        WHERE
            c.credited_as = 'A' AND
            (
                c.peopleid =
                (SELECT peopleid FROM people WHERE first_name = 'Qi' AND surname = 'Shu') OR
                c.peopleid =
                (SELECT peopleid FROM people WHERE first_name = 'You' AND surname = 'Ge')
            )
        GROUP BY c.movieid
    )
    AS x
    INNER JOIN
        movies AS m
    ON m.movieid = x.movieid
WHERE
    x.cnt = 1 AND
    min_people = (SELECT peopleid FROM people WHERE first_name = 'Qi' AND surname = 'Shu');

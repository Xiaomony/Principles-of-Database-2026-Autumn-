\timing on
\echo '=================A================='
\o /dev/null
SELECT
    m.title,
    m.year_released,
    (
        SELECT
            c.country_name
        FROM
            countries AS c
        WHERE
            c.country_code = m.country
    )
    AS country_name
FROM
    movies AS m
WHERE
    m.country <> 'us';

\o
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    m.title,
    m.year_released,
    (
        SELECT
            c.country_name
        FROM
            countries AS c
        WHERE
            c.country_code = m.country
    )
    AS country_name
FROM
    movies AS m
WHERE
    m.country <> 'us';

\echo '=================B================='
\o /dev/null
SELECT
    m.title,
    m.year_released,
    c.country_name
FROM
    movies AS m
    LEFT OUTER JOIN
        countries AS c
    ON c.country_code = m.country
WHERE
    m.country <> 'us';

\o
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    m.title,
    m.year_released,
    c.country_name
FROM
    movies AS m
    LEFT OUTER JOIN
        countries AS c
    ON c.country_code = m.country
WHERE
    m.country <> 'us';

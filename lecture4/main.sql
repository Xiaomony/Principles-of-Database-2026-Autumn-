-- 1
SELECT * FROM movies WHERE country IN ('pt', 'br');
-- 2
SELECT * FROM movies WHERE country = 'us' AND year_released = 2007;
-- 3
SELECT
    *
FROM
    movies
WHERE
    country = 'sp' AND
    title NOT LIKE '%o%' AND
    title NOT LIKE '%O%' AND
    title NOT LIKE '%a%' AND
    title NOT LIKE '%A%';
-- 4
SELECT
    *
FROM
    movies
WHERE
    country IN ('cn', 'hk', 'tw', 'mo') AND
    year_released BETWEEN 1940 AND 1949;
-- 5
SELECT * FROM people WHERE born <= 1920 AND died IS NULL;
-- 6
SELECT * FROM alt_titles WHERE title LIKE '%山%';
-- 7
SELECT
    *
FROM
    movies
WHERE
    upper(title) LIKE 'MAN %' OR
    upper(title) LIKE 'MAN''%' OR
    upper(title) LIKE '% MAN %' OR
    upper(title) LIKE '% MAN''%' OR
    upper(title) LIKE '% MAN';
-- 8
SELECT first_name, surname FROM people WHERE died >= born + 100;
-- 9
SELECT first_name, surname FROM people WHERE died IS NULL AND 1926 >= born OR died >= born + 100;
-- 10
SELECT * FROM people WHERE surname LIKE '%"%';
-- 11
SELECT * FROM countries WHERE continent = 'EUROPE' AND country_code LIKE 'c%';
-- 12
SELECT * FROM people WHERE left(first_name, 1) = left(surname, 1);


-- 13
SELECT MIN(2026 - born) FROM people;
-- 14
SELECT country, COUNT(*) AS movie_count FROM movies WHERE country LIKE 'm%' GROUP BY country;
-- 15
SELECT COUNT(DISTINCT country) FROM movies;
-- 16
SELECT MIN(year_released) FROM movies WHERE country IN ('cn', 'tw', 'hk');
-- 17
SELECT COUNT(*) FROM movies WHERE year_released = 2010;
-- 18
SELECT
    year_released,
    COUNT(*) AS films_per_year
FROM
    movies
WHERE
    year_released >= 1960
GROUP BY year_released;
-- 19
SELECT COUNT(*) FROM movies WHERE country = 'gb' AND year_released = 1965;
-- 20
SELECT
    director_num,
    COUNT(*) AS movie_num
FROM
    (
        SELECT
            movieid,
            COUNT(*) AS director_num
        FROM
            credits
        WHERE
            credited_as = 'D'
        GROUP BY movieid
    )
GROUP BY director_num;
-- 21
SELECT COUNT(*) AS recorded, COUNT(died) AS dead, COUNT(*) - COUNT(died) AS alive FROM people;
-- 22
SELECT MAX(surname_count) FROM (SELECT COUNT(*) AS surname_count FROM people GROUP BY surname);
-- 23
SELECT
    COUNT(*)
FROM
    (
        SELECT
            peopleid
        FROM
            credits
        WHERE
            credited_as IN ('A', 'D')
        GROUP BY movieid,
            peopleid
        HAVING
            COUNT(*) = 2
    );
-- 24
SELECT round(100 * COUNT(CASE WHEN gender = 'F' THEN 1 END) / COUNT(*), 1) FROM people;
-- 25
SELECT
    country,
    COUNT(*) AS movies_more_than_3_hours
FROM
    movies
WHERE
    runtime >= 180
GROUP BY country
HAVING
    COUNT(*) > 0;

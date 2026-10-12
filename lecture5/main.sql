-- 1
SELECT
    m.*
FROM
    movies AS m
    INNER JOIN
        credits AS c
    ON c.movieid = m.movieid
WHERE
    c.credited_as = 'D' AND
    c.peopleid =
    (
        SELECT
            peopleid
        FROM
            people
        WHERE
            first_name = 'John' AND surname = 'Woo'
    );

-- 2
SELECT
    p.first_name,
    p.surname,
    CASE credited_as
        WHEN 'A' THEN 'Actor'
        WHEN 'D' THEN 'Director'
    END
    AS credited_as
FROM
    credits AS c
    INNER JOIN
        people AS p
    ON p.peopleid = c.peopleid
WHERE
    c.movieid =
    (
        SELECT
            movieid
        FROM
            movies
        WHERE
            title = 'Treasure Island' AND
            country = 'us' AND
            year_released = 1950
    );

-- 3
SELECT
    COUNT(*)
FROM
    movies AS m
    INNER JOIN
        credits AS c
    ON m.movieid = c.movieid
WHERE
    m.year_released = 1952 AND
    c.peopleid =
    (
        SELECT
            peopleid
        FROM
            people
        WHERE
            first_name = 'Marilyn' AND surname = 'Monroe'
    );

-- 4
SELECT
    p.first_name,
    p.surname,
    p.peopleid
FROM
    (
        SELECT
            c.peopleid
        FROM
            movies AS m
            INNER JOIN
                credits AS c
            ON m.movieid = c.movieid
        WHERE
            c.credited_as = 'D'
        GROUP BY c.peopleid
        HAVING
            COUNT(DISTINCT m.country) > 1
    )
    AS x
    INNER JOIN
        people AS p
    ON x.peopleid = p.peopleid;

-- 5
SELECT DISTINCT
    m.title,
    m.year_released,
    m.country,
    m.movieid
FROM
    movies AS m
    LEFT OUTER JOIN
        credits AS c
    ON c.movieid = m.movieid AND c.credited_as = 'D'
WHERE
    m.year_released >= 2010 AND c.credited_as IS NULL;

-- 6
SELECT DISTINCT
    a.title,
    a.country,
    a.year_released
FROM
    movies AS a
    INNER JOIN
        movies AS b
    ON a.title = b.title
WHERE
    a.year_released > b.year_released;

-- 7
SELECT
    CASE m.country
        WHEN 'cn'
        THEN surname || COALESCE(' ' || surname, '')
        WHEN 'jp'
        THEN surname || COALESCE(' ' || surname, '')
        WHEN 'kr'
        THEN surname || COALESCE(' ' || surname, '')
        WHEN 'tw'
        THEN surname || COALESCE(' ' || surname, '')
        WHEN 'hk'
        THEN surname || COALESCE(' ' || surname, '')
        ELSE COALESCE(first_name || ' ', '') || surname
    END
    AS director
FROM
    movies AS m
    INNER JOIN
        credits AS c
    ON m.movieid = c.movieid
    INNER JOIN
        people AS p
    ON p.peopleid = c.peopleid
WHERE
    c.credited_as = 'D' AND m.year_released = 2015;

-- 8
SELECT DISTINCT
    m.*
FROM
    movies AS m
    INNER JOIN
        credits AS c
    ON c.movieid = m.movieid
    INNER JOIN
        people AS p
    ON p.peopleid = c.peopleid
WHERE
    p.gender = 'F' AND
    c.credited_as = 'D' AND
    m.runtime =
    (
        SELECT
            MAX(m2.runtime)
        FROM
            movies AS m2
            INNER JOIN
                credits AS c2
            ON c2.movieid = m2.movieid
            INNER JOIN
                people AS p2
            ON p2.peopleid = c2.peopleid
        WHERE
            p2.gender = 'F' AND c2.credited_as = 'D'
    );

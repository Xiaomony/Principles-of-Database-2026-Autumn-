CREATE OR REPLACE FUNCTION add_em(x int, y int)
RETURNS int
LANGUAGE sql
AS $$
    SELECT x + y;
$$;

SELECT add_em(1, 2) AS answer;

CREATE OR REPLACE FUNCTION add_em2(int, int)
RETURNS int
LANGUAGE sql
AS $$
    SELECT $1 + $2;
$$;

SELECT add_em2(1, 2) AS answer;

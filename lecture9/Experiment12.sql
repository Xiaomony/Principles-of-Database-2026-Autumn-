CREATE OR REPLACE FUNCTION test_overload(int, int)
RETURNS int
LANGUAGE sql
AS $$
SELECT $1 + $2;
$$;

SELECT test_overload(1, 2);

CREATE FUNCTION test_overload(x int, y int DEFAULT 3)
RETURNS int
LANGUAGE sql
AS $$
SELECT $1 + $2;
$$;

CREATE FUNCTION test_overload(int, int)
RETURNS text
LANGUAGE sql
AS $$
SELECT $1 + $2;
$$;

CREATE OR REPLACE FUNCTION test_overload(x int, y int, z varchar(10))
RETURNS text
LANGUAGE sql
AS $$
SELECT $1 + $2 || z;
$$;

SELECT test_overload(1, 2, ' kids');

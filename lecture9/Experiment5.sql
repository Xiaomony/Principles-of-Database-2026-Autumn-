CREATE OR REPLACE FUNCTION test_default(a int, b int DEFAULT 2, c int DEFAULT 3)
RETURNS int
LANGUAGE sql
AS $$
    SELECT a + b + c;
$$;

SELECT test_default(10, 20, 30);
SELECT test_default(10, 20);
SELECT test_default(10);
SELECT test_default();

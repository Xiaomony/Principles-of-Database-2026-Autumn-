-- sub1
CREATE OR REPLACE FUNCTION add_em(IN x int, IN y int, OUT sum int)
LANGUAGE sql
AS $$
    SELECT x + y;
$$;

SELECT add_em(3, 7);

-- sub2
CREATE OR REPLACE FUNCTION sum_n_product(x int, y int, OUT sum int, OUT product int)
LANGUAGE sql
AS $$
    SELECT x + y, x * y;
$$;

SELECT * FROM sum_n_product(11, 42);

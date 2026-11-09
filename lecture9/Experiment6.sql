CREATE OR REPLACE FUNCTION sum_func(a int, b int)
RETURNS int
LANGUAGE plpgsql
AS $$
begin
    return a+b;
end;
$$;

SELECT sum_func(3, 4);

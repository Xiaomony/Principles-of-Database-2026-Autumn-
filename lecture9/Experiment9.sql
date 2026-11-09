CREATE OR REPLACE FUNCTION factorial(number int)
RETURNS int
LANGUAGE plpgsql
AS $$
declare
    result int;
begin
    result = 1;
    for i in 1..number
    loop
        result = result * i;
    end loop;
    return result;
end;
$$;

CREATE OR REPLACE FUNCTION factorial2(number int)
RETURNS int
LANGUAGE plpgsql
AS $$
declare
result int;
i int;
begin
    result = 1;
    i = 1;
    while i <= number
    loop
        result = result * i;
        i = i + 1;
    end loop;
    return result;
end;
$$;

SELECT factorial(5);
SELECT factorial2(5);

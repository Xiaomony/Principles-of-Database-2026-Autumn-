CREATE OR REPLACE FUNCTION fullname(firstname varchar, secondname varchar)
RETURNS varchar
LANGUAGE plpgsql
AS $$
declare
    name varchar := null;
begin
    name := firstname || ' ' || secondname;
    return name;
end;
$$;

SELECT fullname('Zhang', 'San');

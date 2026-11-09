CREATE OR REPLACE FUNCTION character_table(pattern varchar)
RETURNS TABLE (
    chr char(1),
    ascii int
)
LANGUAGE plpgsql
AS $$
begin
    return query
        select distinct cast(substr(t1.title, t2, 1) as char) chr,
            ascii(substring(t1.title, t2, 1)) ascii
            from (select pattern as title) t1
            cross join generate_series(1, length(pattern)) t2
            order by ascii;
end;
$$;

SELECT * FROM character_table('I love database!');

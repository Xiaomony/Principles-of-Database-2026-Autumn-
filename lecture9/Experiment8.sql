CREATE OR REPLACE FUNCTION full_name(fn varchar, sn varchar, style char(1))
RETURNS varchar
LANGUAGE plpgsql
AS $$
begin
    if upper(style) = 'W'
    then
        return trim(coalesce(fn, '')||' '||sn);
    elseif upper(style) = 'E'
    then
        return trim(sn||' '||coalesce(fn, ''));
    else
        raise exception 'Style must be W or E';
    end if;
end;
$$;

SELECT
    full_name(p.first_name, p.surname, 'E')
FROM
    people AS p INNER JOIN credits AS c ON p.peopleid = c.peopleid AND c.credited_as = 'D'
    INNER JOIN
        movies AS m
    ON m.movieid = c.movieid
WHERE
    m.country = 'cn';

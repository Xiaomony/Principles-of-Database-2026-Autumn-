CREATE OR REPLACE FUNCTION script(fm varchar)
RETURNS varchar
LANGUAGE plpgsql
AS $$
declare
    ascii_max int;
    ascii_min int;
    value varchar;
begin
    SELECT
        max(x.a)
    INTO ascii_max
    FROM
    (
        SELECT DISTINCT
            ascii(substr(t.title, n, 1)) AS a,
            substr(t.title, n, 1)
        FROM
        (SELECT fm AS title) AS t INNER JOIN generate_series(1, length(t.title)) AS n ON TRUE
    )
    AS x;

    SELECT
        min(x.a)
    INTO ascii_min
    FROM
    (
        SELECT DISTINCT
            ascii(substr(t.title, n, 1)) AS a,
            substr(t.title, n, 1)
        FROM
        (SELECT fm AS title) AS t INNER JOIN generate_series(1, length(t.title)) AS n ON TRUE
    )
    AS x WHERE a>127;

    if ((ascii_max <= 740 and ascii_max >= 0) or (ascii_max >= 7424 and ascii_max <=
    8594) or
    (ascii_max >= 11360 and ascii_max <= 11391) or (ascii_max >= 42786 and ascii_max
    <= 43876))
    then
    value = 'Latin';
    elseif ((ascii_min >= 880 and ascii_min <= 1023) or (ascii_min >= 7462 and ascii_min
    <= 8446))
    then
    value = 'Greek';
    elseif ((ascii_min >= 1024 and ascii_min <= 1327) or (ascii_min >= 7296 and
    ascii_min
    <= 7544) or
    (ascii_min >= 42560 and ascii_min <= 42655))
    then
    value = 'Cyrillic';
    elseif ((ascii_min >= 1536 and ascii_min <= 2303) or (ascii_min >= 64336 and
    ascii_min <= 69246) or
    (ascii_min >= 124464 and ascii_min <= 126705))
    then
    value = 'Arabic';
    elseif (ascii_min >= 2304 and ascii_min <= 3572)
    then
    value = 'Indian';
    elseif (ascii_min >= 3585 and ascii_min <= 3675)
    then
    value = 'Thai';
    elseif (ascii_min >= 4096 and ascii_min <= 4255)
    then
    value = 'Burmese';
    elseif ((ascii_min >= 4352 and ascii_min <= 4607) or (ascii_min >= 12593 and
    ascii_min <= 12686) or
    (ascii_min >= 12800 and ascii_min <= 12926) or (ascii_min >= 43360 and
    ascii_min <= 55203) or
    (ascii_min >= 43360 and ascii_min <= 55291) or (ascii_min >= 65440 and
    ascii_min <= 65500))
    then
    value = 'Korean';
    elseif (ascii_min >= 6016 and ascii_min <= 6137)
    then
    value = 'Khmer';
    elseif ((ascii_min >= 11904 and ascii_min <= 12333) or (ascii_min >= 12344 and
    ascii_min <= 12347) or
    (ascii_min >= 13312 and ascii_min <= 42182))
    then
    value = 'Chinese';
    elseif ((ascii_min >= 12353 and ascii_min <= 12543) or (ascii_min >= 12784 and
    ascii_min <= 12799) or
    (ascii_min >= 13008 and ascii_min <= 13143))
    then
    value = 'Japanese';
    else
    value = 'Other';
    end if;
    return value;
end;
$$;

SELECT script('All''s Well, Ends Well 1997');
SELECT script('99 Francs');
SELECT script('Days of Being Wild');

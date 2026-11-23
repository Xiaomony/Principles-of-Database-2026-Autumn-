CREATE ROLE usrtest;

CREATE USER usr_test2;

SELECT
    rolname
FROM
    pg_roles;

DROP ROLE usrtest;

DROP ROLE usr_test2;

CREATE USER usrtest3;

DROP ROLE usrtest3;

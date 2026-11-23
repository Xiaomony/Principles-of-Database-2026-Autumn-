CREATE TABLE t_privilege (
    num int,
    prvl varchar(20),
    field varchar(50)
);

INSERT INTO t_privilege
VALUES
    (1, 'SELECT', 'table'),
    (2, 'INSERT', 'table,table column'),
    (3, 'UPDATE', 'LARGE OBJECT, SEQUENCE, TABLE, table column'),
    (4, 'DELETE', 'table'),
    (5, 'TRUNCATE', 'table'),
    (6, 'REFERENCES', 'table'),
    (7, 'TRIGGER', 'table');


DROP TABLE emp_new;

CREATE TABLE emp_new (
    id int PRIMARY KEY,
    name varchar(30),
    age int,
    dept_id int,
    salary numeric DEFAULT 0.0
);

INSERT INTO emp_new VALUES (1, 'Zhang San', 23, 1, 5000);

CREATE FUNCTION double_salary(emp_new)
RETURNS numeric
LANGUAGE sql
AS $$
    SELECT $1.salary * 2 AS salary;
$$;

SELECT name, double_salary(emp_new.*) AS dream FROM emp_new WHERE emp_new.id = 1;

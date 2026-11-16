CREATE TRIGGER check_before_statement
BEFORE INSERT OR DELETE OR UPDATE
ON emp
FOR EACH STATEMENT
EXECUTE FUNCTION process_emp_check();

--test
INSERT INTO emp VALUES (17, '贺小山', 7000, 1);

UPDATE emp SET salary = 8000 WHERE id = 17;

DELETE FROM emp WHERE id = 17;

UPDATE emp SET salary = salary * 0.95;

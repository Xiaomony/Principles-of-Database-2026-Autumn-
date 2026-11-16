CREATE TRIGGER check_before_insert
BEFORE INSERT
ON emp
FOR EACH ROW
EXECUTE FUNCTION process_emp_check();

CREATE TRIGGER check_before_update
BEFORE UPDATE
ON emp
FOR EACH ROW
EXECUTE FUNCTION process_emp_check();

CREATE TRIGGER check_before_delete
BEFORE DELETE
ON emp
FOR EACH ROW
EXECUTE FUNCTION process_emp_check();

INSERT INTO emp VALUES (17, '贺小山', 7000, 1);

UPDATE emp SET salary = 8000 WHERE id = 17;

DELETE FROM emp WHERE id = 17;

UPDATE emp SET salary = salary * 1.2;

DELETE FROM emp WHERE id = 13;

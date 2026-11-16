CREATE TRIGGER check_update_col
AFTER UPDATE OF salary
ON emp
--WHEN (OLD.salary IS DISTINCT FROM NEW.salary)
FOR EACH ROW
EXECUTE FUNCTION process_emp_check();

--test
UPDATE emp SET deptid = 1 WHERE id = 12;

UPDATE emp SET salary = salary * 1.2 WHERE id = 13;

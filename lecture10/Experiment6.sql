CREATE TRIGGER check_update_col_when
AFTER UPDATE OF salary
ON emp
FOR EACH ROW
WHEN (old.salary IS DISTINCT FROM new.salary)
EXECUTE FUNCTION process_emp_check();

--test
UPDATE emp SET deptid = 6 WHERE id = 12;

UPDATE emp SET salary = salary * 0.9 WHERE id = 13;

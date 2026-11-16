CREATE TRIGGER check_update_col_when
AFTER UPDATE
ON emp
FOR EACH ROW
WHEN (old.* IS DISTINCT FROM new.*)
EXECUTE FUNCTION process_emp_check();

UPDATE emp SET salary = 6000, deptid = 6 WHERE id = 4;

UPDATE emp SET salary = 7000 WHERE id = 4;

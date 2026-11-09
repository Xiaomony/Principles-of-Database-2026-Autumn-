BEGIN;
    DELETE FROM emp WHERE age < 17;
    UPDATE emp SET salary = salary + 1000 WHERE id = 5;
    SELECT * FROM emp;
COMMIT;

SELECT * FROM emp;

BEGIN;
    DELETE FROM emp WHERE name = '张三';
    UPDATE emp SET salary = salary - 1000 WHERE id = 6;
    SELECT * FROM emp;
ROLLBACK;

SELECT * FROM emp;

BEGIN;
    UPDATE emp SET salary = salary + 1000 WHERE id = 5;
    SAVEPOINT sp01;
    UPDATE emp SET salary = salary - 1000 WHERE id = 6;
    SELECT * FROM emp;
ROLLBACK TO SAVEPOINT sp01;
    SELECT * FROM emp;
    UPDATE emp SET salary = salary - 1000 WHERE id = 7;
    SELECT * FROM emp;
COMMIT;

SELECT * FROM emp;
-- all above transactions, each alone as a whole

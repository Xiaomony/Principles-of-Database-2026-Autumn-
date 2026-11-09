-- check the original data in database
SELECT * FROM emp;

BEGIN;
    UPDATE emp SET salary = salary + 1000 WHERE id = 5;
    SAVEPOINT sp01;
    UPDATE emp SET salary = salary - 1000 WHERE id = 6;
    SELECT * FROM emp;
ROLLBACK TO SAVEPOINT sp01;

-- check the data in database, the result is corresponds to the transaction operation
SELECT * FROM emp;

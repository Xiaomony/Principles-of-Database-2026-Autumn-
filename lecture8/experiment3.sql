SELECT * FROM emp;

BEGIN;
    TRUNCATE emp;
COMMIT;

SELECT * FROM emp;--empty table

ROLLBACK;

SELECT * FROM emp;--still

DROP TABLE emp_log;

CREATE TABLE emp_log (
    operation char(1) NOT NULL,
    stamp timestamp NOT NULL,
    userid text NOT NULL,
    level text NOT NULL,
    when_trigger text NOT NULL,
    id int,
    name varchar(10),
    salary numeric
);

CREATE OR REPLACE FUNCTION process_emp_check()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO emp_log
        SELECT 'D',
            now(),
            USER,
            TG_LEVEL,
            TG_WHEN,
            OLD.id,
            OLD.name,
            OLD.salary;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO emp_log
        SELECT
            'U',
            now(),
            USER,
            TG_LEVEL,
            TG_WHEN,
            NEW.id,
            NEW.name,
            NEW.salary;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO emp_log
        SELECT
            'I',
            now(),
            USER,
            TG_LEVEL,
            TG_WHEN,
            NEW.id,
            NEW.name,
            NEW.salary;
    END IF;
    RETURN NULL;
END;
$$;

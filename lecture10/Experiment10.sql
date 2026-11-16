CREATE OR REPLACE FUNCTION event_tr()
RETURNS event_trigger
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Operation here: % %', tg_event, tg_tag;
END;
$$;

CREATE EVENT TRIGGER tr_fun_event ON ddl_command_start EXECUTE FUNCTION event_tr();

CREATE TABLE test (
    test1 int,
    test2 int
);

DROP TABLE test;

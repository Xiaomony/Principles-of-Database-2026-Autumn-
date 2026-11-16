DROP TABLE emp;

DROP TABLE dept;

CREATE OR REPLACE FUNCTION emp_stamp()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.name IS NULL THEN
        RAISE EXCEPTION 'emp_name can not be empty';
    END IF;
    IF NEW.salary IS NULL THEN
        RAISE EXCEPTION '% can not have null salary', NEW.name;
    END IF;
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION '% cannot have a negative salary', NEW.name;
    END IF;
END;
$$;

CREATE TABLE dept (
    id int PRIMARY KEY,
    name varchar(40),
    office varchar(40) DEFAULT 'Nanshan'
);

INSERT INTO dept VALUES (1, '开发部', 'Bao''an');

INSERT INTO dept VALUES (2, '测试部', 'Bao''an');

INSERT INTO dept VALUES (3, '财务部');

INSERT INTO dept VALUES (4, '市场部', 'Bao''an');

INSERT INTO dept VALUES (5, '总经办');

INSERT INTO dept VALUES (6, '生产部', 'Bao''an');

CREATE TABLE emp (
    id int PRIMARY KEY,
    name varchar(10),
    salary numeric(7, 2) DEFAULT 0.0,
    deptid int,
    CONSTRAINT fk_emp3_dept FOREIGN KEY (deptid) REFERENCES dept (id)
);

INSERT INTO emp
VALUES
    (1, '张三', 15000, 1),
    (2, '李四', 25000, 1),
    (3, '王五', 10000, 2),
    (4, '赵六', 6000, 6),
    (5, '庄七', 5000, 6),
    (6, '郝八', 12000, 3),
    (7, '段九', 7500, 3),
    (8, '殷十', 15000, 4),
    (9, '周一', 15000, 4),
    (10, '范二', 25000, 5),
    (11, '何玲', 15000, 5),
    (12, '李雷', 7000, 6),
    (13, '刘小毛', 4500, 6),
    (14, '张大壮', 6000, 6);

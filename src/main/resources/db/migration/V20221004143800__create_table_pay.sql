CREATE TABLE pay
(
    card_nr        NUMBER(16)   NOT NULL,
    salary         NUMBER(8, 2) NOT NULL,
    commission_pct NUMBER(2, 2),
    employee_id    NUMBER(6)    NOT NULL,
    CONSTRAINT pay_c_card_nr_PK PRIMARY KEY (card_nr),
    CONSTRAINT pay_c_salary_min CHECK (salary > 0),
    CONSTRAINT pay_c_emp_FK FOREIGN KEY (employee_id) REFERENCES EMPLOYEES
);

CREATE SEQUENCE pay_sequence
    INCREMENT BY 10
    START WITH 1000200030004000
    NOCACHE;

ALTER TABLE pay
    MODIFY card_nr
        DEFAULT pay_sequence.nextval;

INSERT INTO pay (salary, commission_pct, employee_id)
SELECT salary, commission_pct, employee_id
FROM EMPLOYEES;

COMMENT ON TABLE pay
    IS 'Pay table that contains card number and remuneration information for employees. Contains 4 rows. References with Employees table';
COMMENT ON COLUMN pay.card_nr
    IS 'Primary key for pay table. Unique card number of an employee.';
COMMENT ON COLUMN pay.salary
    IS q'[Employee's salary.]';
COMMENT ON COLUMN pay.commission_pct
    IS q'[Employee's commission percent.]';
COMMENT ON COLUMN pay.employee_id
    IS 'Unique employee identification number'





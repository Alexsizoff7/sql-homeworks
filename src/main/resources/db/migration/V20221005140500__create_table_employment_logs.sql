CREATE TABLE employment_logs
(
    employment_log_id              NUMBER(10)   NOT NULL,
    first_name                     VARCHAR2(20),
    last_name                      VARCHAR2(25) NOT NULL,
    employment_action              VARCHAR2(5)  NOT NULL,
    employment_status_updtd_tmstmp TIMESTAMP    NOT NULL,
    CONSTRAINT emp_logs_c_emp_log_id_PK PRIMARY KEY (employment_log_id),
    CONSTRAINT emp_logs_c_emp_action_eq CHECK (employment_action IN ('HIRED', 'FIRED'))
);

CREATE SEQUENCE emp_logs_sequence
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

ALTER TABLE employment_logs
    MODIFY employment_log_id
        DEFAULT emp_logs_sequence.nextval;
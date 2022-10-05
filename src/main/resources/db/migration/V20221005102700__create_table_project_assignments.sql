CREATE TABLE project_assignments
(
    assignment_id NUMBER(6) NOT NULL,
    project_id    NUMBER(6) NOT NULL,
    employee_id   NUMBER(6) NOT NULL,
    hours_worked  NUMBER(6),
    CONSTRAINT prassign_c_assign_id_PK PRIMARY KEY (assignment_id),
    CONSTRAINT prassign_c_proj_id_FK FOREIGN KEY (project_id) REFERENCES PROJECTS,
    CONSTRAINT prassign_c_emp_id_FK FOREIGN KEY (employee_id) REFERENCES EMPLOYEES,
    CONSTRAINT prassign_c_hours_positive CHECK (hours_worked >= 0)
);

CREATE SEQUENCE assignment_sequence
    INCREMENT BY 1
    START WITH 50000
    NOCACHE;

ALTER TABLE project_assignments
    MODIFY assignment_id
        DEFAULT assignment_sequence.nextval;
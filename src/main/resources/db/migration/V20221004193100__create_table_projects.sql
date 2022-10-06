CREATE TABLE projects
(
    project_id          NUMBER(6) NOT NULL,
    project_description VARCHAR(255),
    project_investments NUMBER(10, -3),
    project_revenue     NUMBER(10),
    CONSTRAINT prjct_c_id_PK PRIMARY KEY (project_id),
    CONSTRAINT prjct_c_desc_len CHECK (LENGTH(project_description) > 10),
    CONSTRAINT prjct_c_invest_positive CHECK (project_investments > 0)
);

CREATE SEQUENCE project_sequence
    INCREMENT BY 1
    START WITH 100000
    NOCACHE;

ALTER TABLE projects
    MODIFY project_id
        DEFAULT project_sequence.nextval;

COMMENT ON TABLE projects IS '';
COMMENT ON COLUMN projects.project_id IS '';
COMMENT ON COLUMN projects.project_description IS '';
COMMENT ON COLUMN projects.project_investments IS '';
COMMENT ON COLUMN projects.project_revenue IS '';
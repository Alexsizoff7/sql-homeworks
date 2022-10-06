ALTER TABLE LOCATIONS
    ADD department_amount NUMBER(6)
        DEFAULT 0
        CHECK (department_amount >= 0);

COMMENT ON COLUMN LOCATIONS.department_amount
    IS 'Contains the amount of departments in the location';
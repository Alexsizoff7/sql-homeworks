CREATE OR REPLACE TRIGGER update_employment_logs
    AFTER INSERT OR DELETE
    ON EMPLOYEES
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_employment_logs_procedure(:new.first_name, :new.last_name, 'HIRED');
    ELSE
        insert_employment_logs_procedure(:old.first_name, :old.last_name, 'FIRED');
    END IF;
END;
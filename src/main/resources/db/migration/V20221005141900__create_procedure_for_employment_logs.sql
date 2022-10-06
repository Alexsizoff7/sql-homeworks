CREATE OR REPLACE PROCEDURE insert_employment_logs_procedure
    (pr_first_name IN varchar2, pr_last_name IN varchar2, pr_employment_action IN varchar2)
IS
BEGIN
    INSERT INTO employment_logs (FIRST_NAME, LAST_NAME, EMPLOYMENT_ACTION, EMPLOYMENT_STATUS_UPDTD_TMSTMP)
    VALUES (pr_first_name, pr_last_name, pr_employment_action, CURRENT_TIMESTAMP);
END;
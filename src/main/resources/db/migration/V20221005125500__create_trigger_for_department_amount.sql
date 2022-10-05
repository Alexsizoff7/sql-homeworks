CREATE OR REPLACE TRIGGER update_department_amount
    AFTER INSERT OR DELETE
    ON DEPARTMENTS
    FOR EACH ROW
DECLARE
    counter    NUMBER;
    locationID NUMBER;
    diff       NUMBER;
BEGIN
    IF INSERTING THEN
        locationID := :new.LOCATION_ID;
        diff := 1;
    ELSE
        locationID := :old.LOCATION_ID;
        diff := -1;
    END IF;

    SELECT department_amount
    INTO counter
    FROM LOCATIONS
    WHERE LOCATIONS.LOCATION_ID = locationID;
    counter := counter + diff;

    UPDATE LOCATIONS
    SET LOCATIONS.department_amount = counter
    WHERE location_id = locationID;
END;
-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0008                         ***
-- *** Purpose: Create case type column     ***
-- ***          and set to HH for existing  ***
-- ***          cases.                      ***
-- *** Author: R Weeks                      ***
-- ********************************************

ALTER TABLE casev2.cases
ADD COLUMN case_type varchar(255);

UPDATE casev2.cases
SET case_type = 'HH'
WHERE case_type is null;

ALTER TABLE actionv2.cases
ADD COLUMN case_type varchar(255);

UPDATE actionv2.cases
SET case_type = 'HH'
WHERE case_type is null;






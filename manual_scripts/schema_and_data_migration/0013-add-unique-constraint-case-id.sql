-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0013                         ***
-- *** Purpose: Create unique constraint    ***
-- *** on case_id. NOTE: This will also     ***
-- *** create a unique index with the same  ***
-- *** name                                 ***
-- ***                                      ***
-- *** Author: Liam Toozer                  ***
-- ********************************************

ALTER TABLE actionv2.cases
    ADD CONSTRAINT case_id UNIQUE (case_id);

ALTER TABLE casev2.cases
    ADD CONSTRAINT case_id UNIQUE (case_id);
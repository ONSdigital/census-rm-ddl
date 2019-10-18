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

-- Drop our existing (non-unique) constraints & indexes first
ALTER TABLE actionv2.cases DROP CONSTRAINT IF EXISTS case_id_idx;
DROP INDEX IF EXISTS casev2.case_id_idx;

ALTER TABLE actionv2.cases
    ADD CONSTRAINT case_id UNIQUE (case_id);

ALTER TABLE casev2.cases
    ADD CONSTRAINT case_id UNIQUE (case_id);
-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0004                         ***
-- *** Purpose: Change case ref type in     ***
-- ***          Action Processor.           ***
-- *** Author: R Weeks                      ***
-- ********************************************

-- Updates to Action Scheduler

ALTER TABLE actionv2.cases
ALTER COLUMN case_ref TYPE integer;


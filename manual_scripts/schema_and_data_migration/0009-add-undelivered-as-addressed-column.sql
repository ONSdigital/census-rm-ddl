-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0009                                                         ***
-- *** Purpose: Add new case column 'undelivered_as_addressed' in actionv2  ***
-- ***          & casev2 schemas set to be not null and default to false    ***
-- *** Author: Nick Grant                                                   ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS undelivered_as_addressed BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE actionv2.cases
    ADD COLUMN IF NOT EXISTS undelivered_as_addressed BOOLEAN NOT NULL DEFAULT false;

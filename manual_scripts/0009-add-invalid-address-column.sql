-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0009                                                         ***
-- *** Purpose: Add new case column 'address_invalid' in actionv2           ***
-- ***          & casev2 schemas set to be not null and default to false    ***
-- *** Author: Nick Grant                                                   ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS address_invalid BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE actionv2.cases
    ADD COLUMN IF NOT EXISTS address_invalid BOOLEAN NOT NULL DEFAULT false;

-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0006                                                         ***
-- *** Purpose: Add new case column 'refusal_received' in actionv2          ***
-- ***          & casev2 schemas set to be not null and default to false    ***
-- *** Author: Liam Toozer, Hugh Brace, Ade                                 ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS refusal_received BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE actionv2.cases
    ADD COLUMN IF NOT EXISTS refusal_received BOOLEAN NOT NULL DEFAULT false;

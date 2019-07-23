-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0003                                                         ***
-- *** Purpose: Add new column 'refusal_received' in actionv2 & casev2      ***
-- ***          cases tables to record refusals                             ***
-- *** Author: Liam Toozer & Hugh Brace                                     ***
-- ****************************************************************************

ALTER TABLE casev2.cases
ADD COLUMN IF NOT EXISTS refusal_received BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE actionv2.cases
ADD COLUMN IF NOT EXISTS refusal_received BOOLEAN NOT NULL DEFAULT false;

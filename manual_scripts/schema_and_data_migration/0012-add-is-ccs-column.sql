-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0012                                                         ***
-- *** Purpose: Add new case & uac_qid_link column 'ccs_case' in casev2     ***
-- ***          schema set to be not null and default to false              ***
-- *** Author: Liam Toozer, Ade                                             ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS ccs_case BOOLEAN NOT NULL DEFAULT false;

ALTER TABLE casev2.uac_qid_link
    ADD COLUMN IF NOT EXISTS ccs_case BOOLEAN NOT NULL DEFAULT false;

-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 600                                                          ***
-- *** Purpose: Add new "hand_delivery" table to the casev2 schema   ***
-- *** Author: Ryan Grundy                                                  ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS hand_delivery boolean NOT NULL DEFAULT FALSE;
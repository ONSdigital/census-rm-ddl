-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0010                                                         ***
-- *** Purpose: Add new case column 'last_updated' in casev2 schema         ***
-- *** Author: Hugh Brace                                                   ***
-- ****************************************************************************

ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS last_updated timestamp with time zone;
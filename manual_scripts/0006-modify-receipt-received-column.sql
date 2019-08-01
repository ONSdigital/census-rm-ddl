-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 0006                                                         ***
-- *** Purpose: Modified case columum 'receipt_received' in actionv2        ***
-- ***          & casev2 schemas to be not null and default to false.       ***
-- ***          Existing data is set to false if null                       ***
-- *** Author: Liam Toozer, Hugh Brace, Ade                                 ***
-- ****************************************************************************

UPDATE casev2.cases
SET receipt_received = false
WHERE receipt_received ISNULL;

ALTER TABLE casev2.cases
    ALTER COLUMN receipt_received SET NOT NULL;
ALTER TABLE casev2.cases
    ALTER COLUMN receipt_received SET DEFAULT false;

UPDATE actionv2.cases
SET receipt_received = false
WHERE receipt_received ISNULL;

ALTER TABLE actionv2.cases
    ALTER COLUMN receipt_received SET NOT NULL;
ALTER TABLE actionv2.cases
    ALTER COLUMN receipt_received SET DEFAULT false;

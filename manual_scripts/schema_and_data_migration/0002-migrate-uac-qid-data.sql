-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0002                         ***
-- *** Purpose: Move UAC/QID pair data out  ***
-- ***          of the Case Processor and   ***
-- ***          into the UAC-QID-Service.   ***
-- *** Author: Nick Grant / R Weeks         ***
-- ********************************************

-- Move UAC/QID Pair data

INSERT INTO uacqid.uac_qid (uac, qid, unique_number)
SELECT uac, qid, unique_number from casev2.uac_qid_link;

SELECT setval('uacqid.uac_qid_unique_number_seq', COALESCE((SELECT last_value FROM casev2.uac_qid_link_unique_number_seq), 1), false);

DROP SCHEMA iac CASCADE;

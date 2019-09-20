-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0011                         ***
-- *** Purpose: Create indexes              ***
-- ***                                      ***
-- *** Author: Richard Weeks                ***
-- ********************************************

CREATE INDEX event_processed_idx
    ON casev2.event (rm_event_processed);

CREATE INDEX case_type_idx
    ON casev2.event (event_type);

CREATE INDEX case_id_idx
    ON casev2.cases (case_id);

CREATE INDEX case_id_idx
    ON actionv2.cases (case_id);

CREATE INDEX lsoa_idx
    ON casev2.cases (lsoa);

CREATE INDEX lsoa_idx
    ON actionv2.cases (lsoa);

CREATE INDEX qid_idx
    ON casev2.uac_qid_link (qid);

CREATE INDEX qid_idx
    ON actionv2.uac_qid_link (qid);
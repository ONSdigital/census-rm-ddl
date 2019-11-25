// change cases primary key
ALTER TABLE casev2.cases DROP CONSTRAINT cases_pkey CASCADE;
ALTER TABLE casev2.cases ADD PRIMARY KEY (case_id);
ALTER TABLE casev2.cases ADD secret_sequence_number SERIAL NOT NULL;
ALTER TABLE casev2.cases ALTER COLUMN case_ref DROP NOT NULL;

// change case key
ALTER TABLE casev2.event DROP COLUMN caze_case_ref;
ALTER TABLE casev2.event ADD COLUMN caze_case_id UUID;

// change case key
ALTER TABLE casev2.uac_qid_link DROP COLUMN caze_case_ref;
ALTER TABLE casev2.uac_qid_link ADD COLUMN caze_case_id UUID;

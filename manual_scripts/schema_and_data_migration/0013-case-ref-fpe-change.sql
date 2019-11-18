// change cases primary key
ALTER TABLE casev2.cases DROP CONSTRAINT cases_pkey;
ALTER TABLE casev2.cases ADD PRIMARY KEY (id);
ALTER TABLE casev2.cases ADD secret_sequence_number SERIAL NOT NULL;

// change case key
ALTER TABLE casesv2.event DROP COLUMN caze_case_ref;
ALTER TABLE casesv2.event ADD COLUMN caze_case_id UUID;

// change case key
ALTER TABLE casesv2.uac_qid_link DROP COLUMN caze_case_ref;
ALTER TABLE casesv2.uac_qid_link ADD COLUMN caze_case_id UUID;

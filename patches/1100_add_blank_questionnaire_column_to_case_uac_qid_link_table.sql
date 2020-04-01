ALTER TABLE casev2.uac_qid_link
    ADD COLUMN IF NOT EXISTS blank_questionnaire BOOLEAN DEFAULT false not null;
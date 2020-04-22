ALTER TABLE casev2.uac_qid_link
    ADD COLUMN IF NOT EXISTS last_updated timestamp with time zone;

ALTER TABLE casev2.uac_qid_link
    ADD COLUMN IF NOT EXISTS created_date_time timestamp with time zone;

UPDATE casev2.uac_qid_link
SET last_updated = current_timestamp
WHERE last_updated IS NULL;

UPDATE casev2.uac_qid_link
SET created_date_time = current_timestamp
WHERE last_updated IS NULL;
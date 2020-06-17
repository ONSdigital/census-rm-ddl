ALTER TABLE actionv2.cases ADD COLUMN IF NOT EXISTS created_date_time timestamp with time zone;

ALTER TABLE actionv2.cases ADD COLUMN IF NOT EXISTS last_updated timestamp with time zone;

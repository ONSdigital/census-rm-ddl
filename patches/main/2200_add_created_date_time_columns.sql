ALTER TABLE actionv2.cases ADD COLUMN IF NOT EXISTS created_date_time timestamp with time zone;

ALTER TABLE actionv2.cases ADD COLUMN IF NOT EXISTS last_updated timestamp with time zone;

UPDATE actionv2.cases AC SET created_date_time = CC.created_date_time FROM casev2.cases CC WHERE CC.case_id = AC.case_id AND AC.created_date_time is null;

UPDATE actionv2.cases AC SET last_updated = CC.last_updated FROM casev2.cases CC WHERE CC.case_id = AC.case_id AND AC.last_updated is null;
ALTER TABLE actionv2.cases ADD COLUMN IF NOT EXISTS metadata jsonb;

ALTER TABLE casev2.cases ADD COLUMN IF NOT EXISTS metadata jsonb;

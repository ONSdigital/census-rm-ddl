ALTER TABLE actionv2.cases
    ADD COLUMN IF NOT EXISTS hand_delivery boolean NOT NULL DEFAULT FALSE;
ALTER TABLE casev2.cases
    ADD COLUMN IF NOT EXISTS survey_launched BOOLEAN DEFAULT false not null;

ALTER TABLE actionv2.cases
    ADD COLUMN IF NOT EXISTS survey_launched BOOLEAN DEFAULT false not null;
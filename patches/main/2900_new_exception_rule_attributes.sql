ALTER TABLE exceptionmanager.auto_quarantine_rule
    ADD COLUMN IF NOT EXISTS quarantine BOOLEAN DEFAULT false not null;

ALTER TABLE exceptionmanager.auto_quarantine_rule
    ADD COLUMN IF NOT EXISTS suppress_logging BOOLEAN DEFAULT false not null;

ALTER TABLE exceptionmanager.auto_quarantine_rule
    ADD COLUMN IF NOT EXISTS throw_away BOOLEAN DEFAULT false not null;

ALTER TABLE exceptionmanager.auto_quarantine_rule
    ADD COLUMN IF NOT EXISTS rule_expiry_date_time timestamp with time zone;

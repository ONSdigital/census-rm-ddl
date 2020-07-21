
TRUNCATE actionv2.action_rule CASCADE;
ALTER TABLE actionv2.action_rule DROP COLUMN classifiers;
ALTER TABLE actionv2.action_rule ADD COLUMN IF NOT EXISTS classifiers_clause TEXT NOT NULL;

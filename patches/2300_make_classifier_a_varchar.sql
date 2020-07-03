
TRUNCATE actionv2.action_rule CASCADE;

ALTER TABLE actionv2.action_rule
    DROP COLUMN classifiers;

ALTER TABLE actionv2.action_rule
    ADD COLUMN IF NOT EXISTS user_defined_where_clause VARCHAR(100000) NOT NULL;

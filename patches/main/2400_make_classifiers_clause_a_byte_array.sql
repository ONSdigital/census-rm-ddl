
TRUNCATE actionv2.action_rule CASCADE;
ALTER TABLE actionv2.action_rule ALTER COLUMN classifiers_clause TYPE BYTEA USING classifiers_clause::BYTEA;

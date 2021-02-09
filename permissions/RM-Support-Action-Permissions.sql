CREATE ROLE rm_support;

GRANT CONNECT ON DATABASE rm TO rm_support;

GRANT USAGE ON SCHEMA actionv2 TO rm_support;
GRANT USAGE ON SCHEMA ddl_version TO rm_support;

GRANT SELECT ON ALL TABLES IN SCHEMA actionv2 TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA actionv2 TO rm_support;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_support;

ALTER DEFAULT PRIVILEGES IN SCHEMA actionv2 GRANT SELECT ON TABLES TO rm_support;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_support;

-- For run-booked insertion and amendments to action rules
GRANT SELECT, UPDATE, INSERT, DELETE ON actionv2.action_rule TO rm_support;

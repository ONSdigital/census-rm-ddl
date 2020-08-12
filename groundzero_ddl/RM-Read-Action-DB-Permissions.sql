-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0001                         ***
-- *** Purpose: Create and grant            ***
-- *** permissions on rm Action DB          ***
-- *** read only access role                ***
-- ***                                      ***
-- *** Author: Leo Howard                   ***
-- ********************************************

CREATE ROLE rm_read_access;

GRANT CONNECT ON DATABASE rm TO rm_read_access;

GRANT USAGE ON SCHEMA actionv2 TO rm_read_access;
GRANT USAGE ON SCHEMA ddl_version TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA actionv2 TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA actionv2 TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA actionv2 GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_read_access;

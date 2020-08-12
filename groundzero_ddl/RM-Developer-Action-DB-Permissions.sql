-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0001                         ***
-- *** Purpose: Create and grant            ***
-- *** permissions on rm Action DB          ***
-- *** dev group role                       ***
-- ***                                      ***
-- *** Author: Leo Howard                   ***
-- ********************************************

CREATE ROLE rm_developer;

GRANT CONNECT ON DATABASE rm TO rm_developer;

GRANT USAGE ON SCHEMA actionv2 TO rm_developer;
GRANT USAGE ON SCHEMA ddl_version TO rm_developer;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA actionv2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA actionv2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ddl_version TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_developer;
GRANT ALL PRIVILEGES ON DATABASE rm TO rm_developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA actionv2 GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT ALL PRIVILEGES ON TABLES TO rm_developer;



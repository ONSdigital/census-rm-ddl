-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 400                                                          ***
-- *** Purpose: Add RM Dev permissions for DDL Version schema               ***
-- *** Author: Leo Howard                                                   ***
-- ****************************************************************************

GRANT USAGE ON SCHEMA ddl_version TO rm_developer;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ddl_version TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
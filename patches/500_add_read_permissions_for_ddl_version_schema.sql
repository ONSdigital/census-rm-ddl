-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 500                                                          ***
-- *** Purpose: Add RM Read permissions for DDL Version schema              ***
-- *** Author: Leo Howard                                                   ***
-- ****************************************************************************

GRANT USAGE ON SCHEMA ddl_version TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_read_access;

-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 2700                                                         ***
-- *** Purpose: Add RM Read permissions for Exception Manager schema        ***
-- *** and separate from Action DB                                          ***
-- *** Author: Leo Howard                                                   ***
-- ****************************************************************************

GRANT USAGE ON SCHEMA exceptionmanager TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA exceptionmanager TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT SELECT ON TABLES TO rm_read_access;
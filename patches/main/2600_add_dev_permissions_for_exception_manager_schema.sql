-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 2600                                                         ***
-- *** Purpose: Add RM Dev permissions for Exception Manager schema         ***
-- *** and separate from Action DB                                          ***
-- *** Author: Leo Howard                                                   ***
-- ****************************************************************************

GRANT USAGE ON SCHEMA exceptionmanager TO rm_developer;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA exceptionmanager TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT ALL PRIVILEGES ON TABLES TO rm_developer;

-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0012                         ***
-- *** Purpose: Create and grant            *** 
-- *** permissions on rm dev group role     ***
-- ***                                      ***
-- *** Author: Adam Hawtin                  ***
-- ********************************************

CREATE ROLE rm_developer;

GRANT CONNECT ON DATABASE rm TO rm_developer;

GRANT USAGE ON SCHEMA casev2 TO rm_developer;
GRANT USAGE ON SCHEMA actionv2 TO rm_developer;
GRANT USAGE ON SCHEMA uacqid TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA casev2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA casev2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA actionv2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA actionv2 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA uacqid TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA uacqid TO rm_developer;
GRANT ALL PRIVILEGES ON DATABASE rm TO rm_developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev2 GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA actionv2 GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT ALL PRIVILEGES ON TABLES TO rm_developer;

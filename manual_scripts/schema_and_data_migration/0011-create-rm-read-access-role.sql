-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0011                         ***
-- *** Purpose: Create and grant            *** 
-- *** permissions on rm read only access   ***
-- *** role                                 ***
-- *** Author: Adam Hawtin                  ***
-- ********************************************

CREATE ROLE rm_read_access;

GRANT CONNECT ON DATABASE rm TO rm_read_access;

GRANT USAGE ON SCHEMA casev2 TO rm_read_access;
GRANT USAGE ON SCHEMA actionv2 TO rm_read_access;
GRANT USAGE ON SCHEMA uacqid TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA casev2 TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA casev2 TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA actionv2 TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA actionv2 TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA uacqid TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA uacqid TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev2 GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA actionv2 GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT SELECT ON TABLES TO rm_read_access;

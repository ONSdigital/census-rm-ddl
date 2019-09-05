-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0001                         ***
-- *** Purpose: Create uacqid schema and    ***
-- ***          table.                      ***
-- *** Author: R Weeks                      ***
-- ********************************************

-- Create tables for UAC-QID Service

create schema uacqid;

create table if not exists uacqid.uac_qid
(
	uac varchar(255) not null
		constraint uac_qid_pkey
			primary key,
	qid varchar(255),
	unique_number serial not null
);

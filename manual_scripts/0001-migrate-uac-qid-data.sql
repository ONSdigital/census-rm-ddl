-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0001                         ***
-- *** Purpose: Move UAC/QID pair data out  ***
-- ***          of the Case Processor and   ***
-- ***          into the UAC-QID-Service.   ***
-- *** Author: Nick Grant / R Weeks         ***
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

-- Move UAC/QID Pair data

INSERT INTO uacqid.uac_qid (uac, qid, unique_number)
SELECT uac, qid, unique_number from casev2.uac_qid_link;

SELECT setval('uacqid.uac_qid_unique_number_seq', COALESCE((SELECT last_value FROM casev2.uac_qid_link_unique_number_seq), 1), false);

DROP SCHEMA iac CASCADE;

-- Updates to Case Processor

ALTER TABLE casev2.event
ADD COLUMN case_id uuid,
ADD COLUMN event_channel varchar(255),
ADD COLUMN event_payload jsonb,
ADD COLUMN event_source varchar(255),
ADD COLUMN event_transaction_id uuid,
ADD COLUMN caze_case_ref integer;

ALTER TABLE casev2.cases
ALTER COLUMN case_ref TYPE integer;

ALTER TABLE casev2.uac_qid_link
ALTER COLUMN caze_case_ref TYPE integer;

ALTER TABLE casev2.event
ADD CONSTRAINT fk_uac_qid_link FOREIGN KEY (uac_qid_link_id) REFERENCES casev2.uac_qid_link (id);

DROP SEQUENCE IF EXISTS casev2.case_ref_generator;

ALTER TABLE casev2.uac_qid_link
DROP COLUMN unique_number;

-- Must be done after Case Processor updates

UPDATE casev2.event SET event_channel = 'RM', event_source = 'CASE_SERVICE', event_transaction_id = (SELECT uuid_in(md5(random()::text || clock_timestamp()::text)::cstring)), event_payload = '{}' WHERE 1=1;

-- Updates to Action Scheduler

ALTER TABLE actionv2.cases
ALTER COLUMN case_ref TYPE integer;


--**************************************************************************************************
-- This script is intended to be run in the event of something going wrong during sample load of CE
-- address frame (a.k.a. sample "frame"). NOTE: this cannot be used again in future, after the CE
-- samples have been loaded, and we are running subsequent sample: that script would have to be
-- MUCH more complicated.
--
-- How to run: manually copy the SQL and run it with a user who has correct permissions to do so.
--**************************************************************************************************

begin transaction;

-- Cascade is present because of foreign key in case_to_process and fulfilment_to_process tables
truncate table actionv2.cases cascade;

-- If a uac_qid_link has a null case_id, then it was created as part of an unaddressed batch
delete from actionv2.uac_qid_link where case_id is not null;

commit transaction;
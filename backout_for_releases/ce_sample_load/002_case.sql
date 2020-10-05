--**************************************************************************************************
-- This script is intended to be run in the event of something going wrong during sample load of CE
-- address frame (a.k.a. sample "frame"). NOTE: this cannot be used again in future, after the CE
-- samples have been loaded, and we are running subsequent sample: that script would have to be
-- MUCH more complicated.
--
-- How to run: manually copy the SQL and run it with a user who has correct permissions to do so.
--**************************************************************************************************

begin transaction;

-- This will delete events which are not linked to cases
delete from casev2.event where caze_case_id is not null;

-- This will delete UAC-QID pairs which were NOT created as part of the unaddressed batch
delete from casev2.uac_qid_link where batch_id is null;

-- This will delete the cases, which shouldn't be linked to ANYTHING now
delete from casev2.cases;

commit transaction;
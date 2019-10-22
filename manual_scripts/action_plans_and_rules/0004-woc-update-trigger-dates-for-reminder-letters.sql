-- *********************************************
-- *** MANUAL RM SQL DATABASE ACTION RULES   ***
-- *** SCRIPT                                ***
-- *********************************************
-- *** Number: 0004                          ***
-- *** Purpose: Update incorrect trigger     ***
-- *** dates for woc reminders               ***
-- *** Author: G Edwards                     ***
-- *********************************************


UPDATE actionv2.action_rule
SET trigger_date_time = '2019-10-28 06:00:00.0000'
WHERE action_plan_id='432f0597-0076-4adb-834b-bf249dc06ded'
AND action_type  in ('P_QU_H1', 'P_QU_H2','P_QU_H4');
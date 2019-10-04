-- ********************************************
-- *** MANUAL RM SQL DATABASE ACTION RULES  ***
-- *** SCRIPT                               ***
-- ********************************************
-- *** Number: 0002                         ***
-- *** Purpose: Create action plans and     ***
-- *** rules for woc reminders              ***
-- *** Author: L Loze                       ***
-- ********************************************

-- RL 1
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('4656993a-49fe-479c-8246-fde27b9c51f7', 'P_RL_1RL1_1',
        '{"treatmentCode": ["HH_LF2R1E", "HH_LF3R1E", "HH_LFNR1E", "HH_QF2R1E", "HH_QF3R1E", "HH_QFNR1E"]}',
        '2019-10-14 05:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('c74ef330-f634-4bb3-a3ad-540fd5eddf0f', 'P_RL_1RL2B_1',
        '{"treatmentCode": ["HH_LF2R1W", "HH_LF3R1W", "HH_LFNR1W", "HH_QF2R1W", "HH_QF3R1W", "HH_QFNR1W"]}',
        '2019-10-14 05:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('5555a4ae-15a9-41b6-a0d5-59ae2b7239f2', 'P_RL_1RL4',
        '{"treatmentCode": ["HH_2LEFN", "HH_1LSFN", "HH_3QSFN"]}',
        '2019-10-17 05:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

--RL 2
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('eed6deb9-7dfd-44b8-882b-43e89a40f478', 'P_RL_1RL1_2',
        '{"treatmentCode": ["HH_LF2R2E", "HH_LF3R2E", "HH_LFNR2E", "HH_QF2R2E", "HH_QF3R2E", "HH_QFNR2E"]}',
        '2019-10-21 05:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('c4e2fcbe-bfdd-4624-88c3-39145b7ae82b', 'P_RL_1RL2B_2',
        '{"treatmentCode": ["HH_LF2R2W", "HH_LF3R2W", "HH_LFNR2W", "HH_QF2R2W", "HH_QF3R2W", "HH_QFNR2W"]}',
        '2019-10-21 05:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('61e573aa-5ccf-4f5e-874e-fbe856506426', 'P_QU_H4',
        '{"treatmentCode": ["HH_2LEFN", "HH_1LSFN", "HH_3QSFN"]}',
        '2019-10-31 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

-- RL 3a
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('d50f628f-4fa3-4541-a5f3-8087b0b74ff8', 'P_RL_2RL1_3a',
        '{"treatmentCode": ["HH_LF2R3AE", "HH_LF3R3AE", "HH_LFNR3AE", "HH_QF2R3AE", "HH_QF3R3AE", "HH_QFNR3AE"]}',
        '2019-10-29 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('600fa014-8c17-49df-813a-1625f802c6fd', 'P_RL_2RL2B_3a',
        '{"treatmentCode": ["HH_LF2R3AW", "HH_LF3R3AW", "HH_LFNR3AW", "HH_QF2R3AW", "HH_QF3R3AW", "HH_QFNR3AW"]}',
        '2019-10-29 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('464f9e4d-1682-4fdf-b09d-8d41c3f6f771', 'P_QU_H1',
        '{"treatmentCode": ["HH_LF2R3BE", "HH_LF3R3BE", "HH_LFNR3BE"]}',
        '2019-10-29 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('8df621ae-9f7a-4902-b3b5-7207e822ec82', 'P_QU_H2',
        '{"treatmentCode": ["HH_LF2R3BW", "HH_LF3R3BW", "HH_LFNR3BW"]}',
        '2019-10-29 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded', 'f');

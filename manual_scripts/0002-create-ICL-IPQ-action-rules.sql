-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0002                         ***
-- *** Purpose: Create Action Rules for     ***
-- ***          Initial contact letters     ***
-- ***          and Initial contact PQs.    ***
-- *** Author: R Weeks                      ***
-- ********************************************

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('f827ab9b-9d57-4acf-aba8-abf6e9ce8bd2', 'P_IC_H1',
        '{"treatmentCode": ["HH_QF2R1E", "HH_QF2R2E", "HH_QF2R3AE", "HH_QF3R1E", "HH_QF3R2E", "HH_QF3R3AE", "HH_QFNR1E", "HH_QFNR2E", "HH_QFNR3AE"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('66e3c71b-e324-4420-9ba9-21f75070e8ec', 'P_IC_H2',
        '{"treatmentCode": ["HH_QF2R1W", "HH_QF2R2W", "HH_QF2R3AW", "HH_QF3R1W", "HH_QF3R2W", "HH_QF3R3AW", "HH_QFNR1W", "HH_QFNR2W", "HH_QFNR3AW"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('439c5e3c-2682-4a77-b21f-3c7dc335ef2e', 'P_IC_H4',
        '{"treatmentCode": ["HH_3QSFN"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('7e2c33b8-ed6c-4eec-b30c-bbd61f4acc7f', 'P_IC_ICL1',
        '{"treatmentCode": ["HH_LFNR1E", "HH_LFNR2E", "HH_LFNR3AE", "HH_LF2R1E", "HH_LF2R2E", "HH_LF2R3AE", "HH_LF2R3BE", "HH_LF3R1E", "HH_LF3R2E", "HH_LF3R3AE", "HH_LF3R3BE", "HH_LFNR3BE"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('b32b9df2-6c5a-43b6-87e9-b4f22e18bb75', 'P_IC_ICL2B',
        '{"treatmentCode": ["HH_LFNR1W", "HH_LFNR2W", "HH_LFNR3AW", "HH_LF2R1W", "HH_LF2R2W", "HH_LF2R3AW", "HH_LF2R3BW", "HH_LF3R1W", "HH_LF3R2W", "HH_LF3R3AW", "HH_LF3R3BW", "HH_LFNR3BW"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id)
VALUES ('525d44e8-39b2-43c2-8321-df5d8e42d4dd', 'P_IC_ICL4',
        '{"treatmentCode": ["HH_1LSFN",  "HH_2LEFN"]}',
        '2019-08-14 06:00:00.0000', '432f0597-0076-4adb-834b-bf249dc06ded'
        );










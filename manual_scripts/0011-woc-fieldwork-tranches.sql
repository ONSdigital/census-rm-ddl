-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0010                         ***
-- *** Purpose: Create action plans and     ***
-- *** rules for woc field tranches         ***
-- *** Author: L Loze                       ***
-- ********************************************

INSERT INTO actionv2.action_plan (id, description, name)
VALUES ('8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'Census rehearsal 2019 WOC Field Action Plan', 'Census rehearsal 2019 WOC Field tranches');

-- Tranche 1
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('bb5dffb2-8148-400f-b2b8-16600141b707', 'FIELD',
        '{"treatmentCode": ["HH_2LEFN"]}',
        '2019-10-16 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('bd14f0c1-15c1-4385-b1f8-33deaf0ec840', 'FIELD',
        '{"treatmentCode": ["HH_1LSFN", "HH_3QSFN"]}',
        '2019-10-25 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

-- Tranche 2
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('037a3e0c-42b3-4b95-8b90-79e3344b0a97', 'FIELD',
        '{"treatmentCode": ["HH_LF2R1E", "HH_LF2R1W", "HH_LF2R2E", "HH_LF2R2W", "HH_LF2R3AE", "HH_LF2R3AW", "HH_LF2R3BE", "HH_LF2R3BW", "HH_QF2R1E", "HH_QF2R1W", "HH_QF2R2E", "HH_QF2R2W", "HH_QF2R3AE", "HH_QF2R3AW"]}',
        '2019-10-14 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('4aba93cb-794d-4268-88e1-216e42df3097', 'FIELD',
        '{"treatmentCode": ["HH_2LEFN"]}',
        '2019-10-25 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('9ed3846b-bd31-4cc3-8ae7-68b8e6945936', 'FIELD',
        '{"treatmentCode": ["HH_1LSFN", "HH_3QSFN"]}',
        '2019-10-30 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

-- Tranche 3
INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('074cf6e4-13be-43b2-bf0d-2c6b8ab0a873', 'FIELD',
        '{"treatmentCode": ["HH_LF3R1E", "HH_LF3R1W", "HH_LF3R2E", "HH_LF3R2W", "HH_LF3R3AE", "HH_LF3R3AW", "HH_LF3R3BE", "HH_LF3R3BW", "HH_QF3R1E", "HH_QF3R1W", "HH_QF3R2E", "HH_QF3R2W", "HH_QF3R3AE", "HH_QF3R3AW"]}',
        '2019-10-21 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('5e32f081-56bf-4a59-9b84-aede58d65943', 'FIELD',
        '{"treatmentCode": ["HH_2LEFN"]}',
        '2019-10-30 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('415d2e39-5df7-497c-9611-e90ac44fb100', 'FIELD',
        '{"treatmentCode": ["HH_1LSFN", "HH_3QSFN"]}',
         '2019-11-06 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

INSERT INTO actionv2.action_rule (id, action_type, classifiers, trigger_date_time, action_plan_id, has_triggered)
VALUES ('f259b941-75f5-42e8-9ea9-ac816c1003f9', 'FIELD',
        '{"treatmentCode": ["HH_2LEFN"]}',
        '2019-11-06 12:00:00.0000', '8de26ab4-3e8c-4532-bbd1-f2ceb4ad5c02', 'f');

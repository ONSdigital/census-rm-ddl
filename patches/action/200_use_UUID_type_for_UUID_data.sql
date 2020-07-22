ALTER TABLE actionv2.uac_qid_link ALTER COLUMN case_id TYPE uuid USING case_id::uuid;

ALTER TABLE actionv2.cases ALTER COLUMN action_plan_id TYPE uuid USING action_plan_id::uuid;
ALTER TABLE actionv2.cases ALTER COLUMN collection_exercise_id TYPE uuid USING collection_exercise_id::uuid;
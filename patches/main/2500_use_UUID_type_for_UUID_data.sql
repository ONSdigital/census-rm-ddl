ALTER TABLE casev2.cases ALTER COLUMN action_plan_id TYPE uuid USING action_plan_id::uuid;
ALTER TABLE casev2.cases ALTER COLUMN collection_exercise_id TYPE uuid USING collection_exercise_id::uuid;
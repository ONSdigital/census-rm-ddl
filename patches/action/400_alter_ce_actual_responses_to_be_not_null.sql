UPDATE actionv2.cases SET ce_actual_responses = 0 WHERE ce_actual_responses IS NULL;

ALTER TABLE actionv2.cases ALTER COLUMN ce_actual_responses SET NOT NULL;


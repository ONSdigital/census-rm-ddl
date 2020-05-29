ALTER TABLE casev2.cases ALTER COLUMN refusal_received TYPE varchar(255);
ALTER TABLE casev2.cases ALTER COLUMN refusal_received DROP NOT NULL;
ALTER TABLE casev2.cases ALTER COLUMN refusal_received DROP DEFAULT;
UPDATE casev2.cases SET refusal_received = null WHERE refusal_received = 'false';
UPDATE casev2.cases SET refusal_received = 'HARD_REFUSAL' WHERE refusal_received = 'true';

ALTER TABLE actionv2.cases ALTER COLUMN refusal_received TYPE varchar(255);
ALTER TABLE actionv2.cases ALTER COLUMN refusal_received  DROP NOT NULL;
ALTER TABLE actionv2.cases ALTER COLUMN refusal_received DROP DEFAULT;
UPDATE actionv2.cases SET refusal_received = null WHERE refusal_received = 'false';
UPDATE actionv2.cases SET refusal_received = 'HARD_REFUSAL' WHERE refusal_received = 'true';
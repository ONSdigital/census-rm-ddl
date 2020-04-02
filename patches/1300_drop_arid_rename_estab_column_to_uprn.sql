ALTER table actionv2.cases
DROP COLUMN arid;

ALTER TABLE casev2.cases
DROP COLUMN arid;

ALTER table actionv2.cases
DROP COLUMN estab_arid;

ALTER TABLE casev2.cases
DROP COLUMN estab_arid;

ALTER TABLE actionv2.cases
ADD COLUMN estab_uprn varchar(255);

ALTER TABLE casev2.cases
ADD COLUMN estab_uprn varchar(255);

ALTER TABLE actionv2.cases
ADD COLUMN print_batch varchar(255);

ALTER TABLE casev2.cases
ADD COLUMN print_batch varchar(255);

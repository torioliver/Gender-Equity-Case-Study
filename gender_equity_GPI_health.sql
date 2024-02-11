-- Creating a column for GPI indicators
USE gender_db;
ALTER TABLE health
ADD COLUMN `comm_dis_GPI` double;
UPDATE health 
SET comm_dis_GPI = comm_dis_f/comm_dis_m;

ALTER TABLE health
ADD COLUMN `injur_GPI` double;
UPDATE health 
SET injur_GPI = injur_f/injur_m;

ALTER TABLE health
ADD COLUMN `noncomm_GPI` double;
UPDATE health 
SET noncomm_GPI = noncomm_f/noncomm_m;

ALTER TABLE health
ADD COLUMN `survival_5_GPI` double;
UPDATE health 
SET survival_5_GPI = survival_5_f/survival_5_m;

ALTER TABLE health
ADD COLUMN `survival_60_GPI` double;
UPDATE health 
SET survival_60_GPI = survival_60_f/survival_60_m;

-- Dropping columns not needed
ALTER TABLE health
DROP COLUMN comm_dis_f;
ALTER TABLE health
DROP COLUMN comm_dis_m;
ALTER TABLE health
DROP COLUMN injur_f;
ALTER TABLE health
DROP COLUMN injur_m;
ALTER TABLE health
DROP COLUMN noncomm_f;
ALTER TABLE health
DROP COLUMN noncomm_m;
ALTER TABLE health
DROP COLUMN survival_5_f;
ALTER TABLE health
DROP COLUMN survival_5_m;
ALTER TABLE health
DROP COLUMN survival_60_f;
ALTER TABLE health
DROP COLUMN survival_60_m;


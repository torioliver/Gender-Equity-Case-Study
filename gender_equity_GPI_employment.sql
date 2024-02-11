-- Creating a column for GPI indicators and dropping columns no longer needed

ALTER TABLE employment
ADD COLUMN employers_GPI double;
UPDATE employment
SET employers_GPI = employers_f/employers_m;

ALTER TABLE employment
ADD COLUMN labor_partic_GPI double;
UPDATE employment
SET labor_partic_GPI = labor_partic_f/labor_partic_m;

ALTER TABLE employment
ADD COLUMN business_start_time_GPI double;
UPDATE employment
SET business_start_time_GPI = business_start_time_f/business_start_time_m;

ALTER TABLE employment
ADD COLUMN youth_unemploy_GPI double;
UPDATE employment
SET youth_unemploy_GPI = youth_unemploy_f/youth_unemploy_m;

ALTER TABLE employment
ADD COLUMN vulnerable_employment_GPI double;
UPDATE employment
SET vulnerable_employment_GPI = vulnerable_employment_f/vulnerable_employment_m;


-- Dropping columns not needed
ALTER TABLE employment
DROP COLUMN employers_f;
ALTER TABLE employment
DROP COLUMN employers_m;

ALTER TABLE employment
DROP COLUMN labor_partic_f;
ALTER TABLE employment
DROP COLUMN labor_partic_m;

ALTER TABLE employment
DROP COLUMN business_start_time_f;
ALTER TABLE employment
DROP COLUMN business_start_time_m;

ALTER TABLE employment
DROP COLUMN youth_unemploy_f;
ALTER TABLE employment
DROP COLUMN youth_unemploy_m;

ALTER TABLE employment
DROP COLUMN vulnerable_employment_f;
ALTER TABLE employment
DROP COLUMN vulnerable_employment_m;
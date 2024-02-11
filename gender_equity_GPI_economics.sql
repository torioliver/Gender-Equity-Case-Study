-- Creating a column for GPI indicators
ALTER TABLE economics
ADD COLUMN funds_7_GPI double;
UPDATE economics
SET funds_7_GPI = funds_7_f/funds_7_m;

ALTER TABLE economics
ADD COLUMN debit_or_credit_GPI double;
UPDATE economics
SET debit_or_credit_GPI= debit_or_credit_f/debit_or_credit_m;

ALTER TABLE economics
ADD COLUMN debit_or_credit_GPI double;
UPDATE economics
SET debit_or_credit_GPI = debit_or_credit_f/debit_or_credit_m;

ALTER TABLE economics
ADD COLUMN pension_GPI double;
UPDATE economics
SET pension_GPI = pension_f/pension_m;

ALTER TABLE economics
ADD COLUMN saved_GPI double;
UPDATE economics
SET saved_GPI = saved_f/saved_m;

ALTER TABLE economics
ADD COLUMN worry_bills_GPI double;
UPDATE economics
SET worry_bills_GPI = worry_bills_f/worry_bills_m;


-- Dropping columns not needed
ALTER TABLE economics
DROP COLUMN funds_7_f;
ALTER TABLE economics
DROP COLUMN funds_7_m;

ALTER TABLE economics
DROP COLUMN debit_or_credit_f;
ALTER TABLE economics
DROP COLUMN debit_or_credit_m;

ALTER TABLE economics
DROP COLUMN pension_f;
ALTER TABLE economics
DROP COLUMN pension_m;

ALTER TABLE economics
DROP COLUMN saved_f;
ALTER TABLE economics
DROP COLUMN saved_m;

ALTER TABLE economics
DROP COLUMN worry_bills_f;
ALTER TABLE economics
DROP COLUMN worry_bills_m;


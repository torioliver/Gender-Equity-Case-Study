-- Creating a column for GPI indicators
-- Note: secondary enrolment and primary enrolment were GPI indicators in the original dataset

ALTER TABLE education
ADD COLUMN test_score_GPI double;
UPDATE education
SET test_score_GPI = test_score_f/test_score_m;

ALTER TABLE education
ADD COLUMN years_school_GPI double;
UPDATE education
SET years_school_GPI = years_school_f/years_school_m;

ALTER TABLE education
ADD COLUMN preprim_enrol_GPI double;
UPDATE education
SET preprim_enrol_GPI = preprim_enrol_f/preprim_enrol_m;



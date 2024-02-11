-- Convert 0 entries to NULL. Required for data visualisation in Tableau
-- Economics table
UPDATE economics
SET funds_7_f=NULL WHERE funds_7_f=0;
UPDATE economics
SET funds_7_m=NULL WHERE funds_7_m=0;

UPDATE economics
SET debit_or_credit_f=NULL WHERE debit_or_credit_f=0;
UPDATE economics 
SET debit_or_credit_m=NULL WHERE debit_or_credit_m=0;

UPDATE economics
SET pension_f=NULL WHERE pension_f=0;
UPDATE economics 
SET pension_m=NULL WHERE pension_m=0;

UPDATE economics
SET saved_f=NULL WHERE saved_f=0;
UPDATE economics 
SET saved_m=NULL WHERE saved_m=0;

UPDATE economics
SET worry_bills_f=NULL WHERE worry_bills_f=0;
UPDATE economics 
SET worry_bills_m=NULL WHERE worry_bills_m=0;

-- Education table
UPDATE education
SET prim_enrol_f=NULL WHERE prim_enrol_f=0;
UPDATE education 
SET prim_enrol_m=NULL WHERE prim_enrol_m=0;

UPDATE education
SET sec_enrol_f=NULL WHERE sec_enrol_f=0;
UPDATE education 
SET sec_enrol_m=NULL WHERE sec_enrol_m=0;

UPDATE education
SET test_score_f=NULL WHERE test_score_f=0;
UPDATE education 
SET test_score_m=NULL WHERE test_score_m=0;

UPDATE education
SET years_school_f=NULL WHERE years_school_f=0;
UPDATE education 
SET years_school_m=NULL WHERE years_school_m=0;

UPDATE education
SET preprim_enrol_f=NULL WHERE preprim_enrol_f=0;
UPDATE education 
SET preprim_enrol_m=NULL WHERE preprim_enrol_m=0;

-- Employment table
UPDATE employment
SET employers_f=NULL WHERE employers_f=0;
UPDATE employment
SET employers_m=NULL WHERE employers_m=0;

UPDATE employment
SET labor_partic_f=NULL WHERE labor_partic_f=0;
UPDATE employment
SET labor_partic_m=NULL WHERE labor_partic_m=0;

UPDATE employment
SET business_start_time_f=NULL WHERE business_start_time_f=0;
UPDATE employment
SET business_start_time_m=NULL WHERE business_start_time_m=0;

UPDATE employment
SET youth_unemploy_f=NULL WHERE youth_unemploy_f=0;
UPDATE employment
SET youth_unemploy_m=NULL WHERE youth_unemploy_m=0;

UPDATE employment
SET vulnerable_employment_f=NULL WHERE vulnerable_employment_f=0;
UPDATE employment
SET vulnerable_employment_m=NULL WHERE vulnerable_employment_m=0;

-- Health table
UPDATE health 
SET comm_dis_f=NULL WHERE comm_dis_f=0;
UPDATE health 
SET comm_dis_m=NULL WHERE comm_dis_m=0;

UPDATE health 
SET injur_f=NULL WHERE injur_f=0;
UPDATE health 
SET injur_m=NULL WHERE injur_m=0;

UPDATE health 
SET noncomm_f=NULL WHERE noncomm_f=0;
UPDATE health 
SET noncomm_m=NULL WHERE noncomm_m=0;

UPDATE health 
SET survival_5_f=NULL WHERE survival_5_f=0;
UPDATE health 
SET survival_5_m=NULL WHERE survival_5_m=0;

UPDATE health 
SET survival_60_f=NULL WHERE survival_60_f=0;
UPDATE health 
SET survival_60_m=NULL WHERE survival_60_m=0;

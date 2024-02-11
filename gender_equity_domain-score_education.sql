/* This code calculates an overall score of gender equity for this domain. The CASE/WHEN statements use the GPI_coding table to assign a score of 1-5 to each indicator base on the GPI.
The indicator scores (1-5) are added up for each country
Then divided by the total number of indicators with scores. The code in the demoninator ensures that is a coutry has some nulls for indicators, then these aren't included in the denominator of their total domain score 
*/
ALTER TABLE education
ADD COLUMN `domain_score` double;
UPDATE education
SET domain_score =
(
(CASE
    WHEN prim_enrol_GPI IS NULL THEN 0
    WHEN prim_enrol_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN prim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN prim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN prim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN sec_enrol_GPI IS NULL THEN 0
    WHEN sec_enrol_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN sec_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN sec_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN sec_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN test_score_GPI IS NULL THEN 0
    WHEN test_score_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN test_score_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN test_score_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN test_score_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN years_school_GPI IS NULL THEN 0
    WHEN years_school_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN years_school_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN years_school_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN years_school_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN preprim_enrol_GPI IS NULL THEN 0
    WHEN preprim_enrol_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN preprim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN preprim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN preprim_enrol_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END  
) /(SELECT
(COUNT(IF(prim_enrol_GPI>0, 1, NULL))+COUNT(IF(sec_enrol_GPI>0, 1, NULL))+COUNT(IF(test_score_GPI>0, 1, NULL)) +COUNT(IF(years_school_GPI>0, 1, NULL)) +COUNT(IF(preprim_enrol_GPI>0, 1, NULL)))
)
)
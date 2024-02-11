ALTER TABLE employment
ADD COLUMN `domain_score` double;
UPDATE employment
SET domain_score =
(
(CASE
	WHEN labor_partic_GPI IS NULL THEN 0
    WHEN labor_partic_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN labor_partic_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN labor_partic_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN labor_partic_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN employers_GPI IS NULL THEN 0
    WHEN employers_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN employers_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN employers_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN employers_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN business_start_time_GPI IS NULL THEN 0
    WHEN business_start_time_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN business_start_time_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN business_start_time_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN business_start_time_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN youth_unemploy_GPI IS NULL THEN 0
    WHEN youth_unemploy_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN youth_unemploy_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN youth_unemploy_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN youth_unemploy_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN vulnerable_employment_GPI IS NULL THEN 0
    WHEN vulnerable_employment_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN vulnerable_employment_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN vulnerable_employment_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN vulnerable_employment_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END 
) /(SELECT
(COUNT(IF(labor_partic_GPI>0, 1, NULL))+COUNT(IF(employers_GPI>0, 1, NULL))+COUNT(IF(business_start_time_GPI>0, 1, NULL)) +COUNT(IF(youth_unemploy_GPI>0, 1, NULL)) +COUNT(IF(vulnerable_employment_GPI>0, 1, NULL)))
)
)
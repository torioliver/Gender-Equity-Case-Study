ALTER TABLE health
ADD COLUMN `domain_score` double;
UPDATE health
SET domain_score =
(
(CASE
	WHEN comm_dis_GPI IS NULL THEN 0
    WHEN comm_dis_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN comm_dis_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN comm_dis_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN comm_dis_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN injur_GPI IS NULL THEN 0
    WHEN injur_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN injur_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN injur_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN injur_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN noncomm_GPI IS NULL THEN 0
    WHEN noncomm_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN noncomm_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN noncomm_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN noncomm_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN survival_5_GPI IS NULL THEN 0
    WHEN survival_5_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN survival_5_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN survival_5_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN survival_5_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN survival_60_GPI IS NULL THEN 0
    WHEN survival_60_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN survival_60_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN survival_60_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN survival_60_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END 
) /(SELECT
(COUNT(IF(comm_dis_GPI>0, 1, NULL))+COUNT(IF(injur_GPI>0, 1, NULL))+COUNT(IF(noncomm_GPI>0, 1, NULL)) +COUNT(IF(survival_5_GPI>0, 1, NULL)) +COUNT(IF(survival_60_GPI>0, 1, NULL)))
)
)
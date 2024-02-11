/* This code calculates an overall score of gender equity for this domain. The CASE/WHEN statements use the GPI_coding table to assign a score of 1-5 to each indicator base on the GPI.
The indicator scores (1-5) are added up for each country
Then divided by the total number of indicators with scores. The code in the demoninator ensures that is a coutry has some nulls for indicators, then these aren't included in the denominator of their total domain score 
*/

ALTER TABLE economics
ADD COLUMN `domain_score` double;

UPDATE economics
SET domain_score =
(
(CASE
    WHEN funds_7_GPI IS NULL THEN 0
    WHEN funds_7_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN funds_7_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN funds_7_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN funds_7_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN debit_or_credit_GPI IS NULL THEN 0
    WHEN debit_or_credit_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN debit_or_credit_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN debit_or_credit_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN debit_or_credit_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN pension_GPI IS NULL THEN 0
    WHEN pension_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN pension_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN pension_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN pension_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
    WHEN saved_GPI IS NULL THEN 0
    WHEN saved_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT high_std FROM GPI_coding WHERE strata = 1)
    WHEN saved_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT high_std FROM GPI_coding WHERE strata = 2)
    WHEN saved_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT high_std FROM GPI_coding WHERE strata = 3)
    WHEN saved_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT high_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT high_std FROM GPI_coding WHERE strata = 5)
END +
CASE
	WHEN worry_bills_GPI IS NULL THEN 0
    WHEN worry_bills_GPI <(SELECT upper_limit FROM GPI_coding WHERE strata = 1) THEN (SELECT low_std FROM GPI_coding WHERE strata = 1)
    WHEN worry_bills_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 2) THEN (SELECT low_std FROM GPI_coding WHERE strata = 2)
    WHEN worry_bills_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 3) THEN (SELECT low_std FROM GPI_coding WHERE strata = 3)
    WHEN worry_bills_GPI < (SELECT upper_limit FROM GPI_coding WHERE strata = 4) THEN (SELECT low_std FROM GPI_coding WHERE strata = 4)
ELSE (SELECT low_std FROM GPI_coding WHERE strata = 5)
END 
) /(SELECT
(COUNT(IF(funds_7_GPI>0, 1, NULL))+COUNT(IF(debit_or_credit_GPI>0, 1, NULL))+COUNT(IF(pension_GPI>0, 1, NULL)) +COUNT(IF(saved_GPI>0, 1, NULL)) +COUNT(IF(worry_bills_GPI>0, 1, NULL)))
)
)
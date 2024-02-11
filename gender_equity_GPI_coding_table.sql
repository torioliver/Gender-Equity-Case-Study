/* Script to create a table that dictates how the GPIs will be scored for the purposes of creating a domain score 
strata is the number of the strata the GPI belongs to, where 1 is the lowest and 5 is the highest
upper_limit is the upper limit for the GPI that will fall into this strata
high_std is the score that will be given to GPIs in this strata if the indicator is one which reflects a high standard of living (eg financial inclusion)
low_std is the scorethat will be given to GPIs in this strata if the indicator is one which reflects a low standard of living (eg mortality)
*/

DROP TABLE GPI_coding;
CREATE TABLE GPI_coding(
strata INT AUTO_INCREMENT,
upper_limit DOUBLE, 
high_std INT,
low_std INT,
PRIMARY KEY (strata));

INSERT INTO GPI_coding (upper_limit, high_std, low_std)
VALUES (0.4, 1, 5), (0.6, 2, 4), (0.8, 3, 3), (1, 4, 2);

SELECT *
FROM 
GPI_coding;


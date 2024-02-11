-- Fixed Country column name. 
ALTER TABLE `gender_db`.`economics`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;

ALTER TABLE `gender_db`.`education`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;

ALTER TABLE `gender_db`.`employment`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;

ALTER TABLE `gender_db`.`health`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;

ALTER TABLE `gender_db`.`wbl`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;

ALTER TABLE `gender_db`.`gdp`  
CHANGE COLUMN `ï»¿country` `country` TEXT NULL DEFAULT NULL;
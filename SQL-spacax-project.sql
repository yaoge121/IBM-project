/*Task 1:
Display the names of the unique launch sites in the space mission*/

SELECT Distinct LAUNCH_SITE FROM SPACEXDATASET;

/*Task2:
Display 5 records where launch sites begin with the string 'CCA'*/

SELECT * FROM SPACEXDATASET 
WHERE LAUNCH_SITE LIKE 'CCA%' LIMIT 5;

/*Task 3:
Display the total payload mass carried by boosters launched by NASA (CRS)*/

SELECT SUM(PAYLOAD_MASS__KG_) FROM SPACEXDATASET 
WHERE CUSTOMER='NASA (CRS)';

/*Task 4:
Display average payload mass carried by booster version F9 v1.1*/

SELECT AVG(PAYLOAD_MASS__KG_) FROM SPACEXDATASET 
WHERE BOOSTER_VERSION='F9 v1.1';

/*Task 5:
List the date when the first succesful landing outcome in ground pad was acheived.*/

SELECT MIN(DATE) FROM SPACEXDATASET 
WHERE LANDING__OUTCOME='Success (ground pad)';

/*Task 6:
List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000*/

SELECT BOOSTER_VERSION FROM SPACEXDATASET
WHERE PAYLOAD_MASS__KG_ between 4000 and 6000 
AND LANDING__OUTCOME='Success (drone ship)';

/*Task 7:
List the total number of successful and failure mission outcomes*/

SELECT COUNT(*) FROM SPACEXDATASET
WHERE MISSION_OUTCOME LIKE '%Success%' 
OR MISSION_OUTCOME LIKE '%Failure%';

/*Task 8:
List the names of the booster_versions which have carried the maximum payload mass. Use a subquery*/

SELECT BOOSTER_VERSION FROM SPACEXDATASET
WHERE PAYLOAD_MASS__KG_ = (
SELECT MAX(PAYLOAD_MASS__KG_) FROM SPACEXDATASET 
);

/*Task 9:
List the records which will display the month names, failure landing_outcomes in drone ship ,booster versions, launch_site for the months in year 2015*/

SELECT TO_CHAR(TO_DATE(MONTH("DATE"), 'MM'), 'MONTH') AS MONTH_NAME,
LANDING__OUTCOME AS LANDING__OUTCOME,
BOOSTER_VERSION AS BOOSTER_VERSION,
LAUNCH_SITE AS LAUNCH_SITE
FROM SPACEXDATASET 
WHERE LANDING__OUTCOME = 'Failure (drone ship)' 
AND "DATE" LIKE '%2015%';

/*Task 10:
Rank the count of successful landing_outcomes between the date 2010-06-04 and 2017-03-20 in descending order.*/

SELECT "DATE", COUNT(LANDING__OUTCOME) as COUNT FROM SPACEXDATASET 
WHERE "DATE" BETWEEN '2010-06-04' and '2017-03-20'
AND LANDING__OUTCOME LIKE '%Success%' 
GROUP BY "DATE"
ORDER BY COUNT(LANDING__OUTCOME) DESC;
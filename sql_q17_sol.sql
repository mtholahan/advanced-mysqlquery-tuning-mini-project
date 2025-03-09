-- Solution stub for Question 17
-- 17. Write a SQL query to find the country where the most assistant referees come from,
-- and the count of the assistant referees.

WITH AssistantRefByCountry (AssistantRefCount, country_name, TheRank)
AS
(
SELECT
	COUNT(arm.ass_ref_name) AS AssistantRefCount,
    sc.country_name,
    RANK() OVER(ORDER BY COUNT(arm.ass_ref_name) DESC) AS TheRank
FROM asst_referee_mast AS 		arm
INNER JOIN soccer_country AS 	sc
	ON arm.country_id = sc.country_id
GROUP BY sc.country_name
)
SELECT
	arbc.country_name,
    arbc.AssistantRefCount
FROM AssistantRefByCountry arbc
WHERE arbc.TheRank = 1

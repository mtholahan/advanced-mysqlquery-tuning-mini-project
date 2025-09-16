-- Solution stub for Question 7
-- 7. Write a SQL query to find all the venues where matches with penalty shootouts were played.

SELECT
	DISTINCT sv.venue_name
FROM match_mast AS 			mm
INNER JOIN soccer_venue AS 	sv
	ON mm.venue_id = sv.venue_id
WHERE mm.decided_by = 'P' -- decided by penalty shootout
ORDER BY sv.venue_name;

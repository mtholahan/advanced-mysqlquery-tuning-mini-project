-- Solution stub for Question 20
-- 20. Write a SQL query to find the substitute players who came into the field in the first
-- half of play, within a normal play schedule.

SELECT
	pm.player_name
FROM player_in_out AS 		pio
INNER JOIN player_mast AS 	pm
	ON pio.player_id = pm.player_id
WHERE
	pio.play_schedule = 'NT'
AND
	pio.play_half = 1
ORDER BY pm.player_name;
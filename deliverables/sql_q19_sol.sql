-- Solution stub for Question 19
-- 19. Write a SQL query to find the number of captains who were also goalkeepers.

WITH GKCaptainsRaw (player_name)
AS
(
SELECT
    pm.player_name
FROM player_mast 			pm
INNER JOIN match_captain 	mc
	ON pm.player_id = mc.player_captain
WHERE pm.posi_to_play = 'GK'
GROUP BY pm.player_name
)
SELECT
	COUNT(player_name) AS GoalkeepingCaptainCount
FROM GKCaptainsRaw

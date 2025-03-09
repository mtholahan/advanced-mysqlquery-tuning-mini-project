-- Solution stub for Question 13
-- 13. Write a SQL query to find all the defenders who scored a goal for their teams.

SELECT
	pm.player_name, 
    pm.jersey_no, 
    pm.playing_club, 
    COUNT(gd.goal_id) AS goals_scored
FROM player_mast 			pm
JOIN goal_details 			gd 
	ON pm.player_id = gd.player_id
JOIN playing_position 		pp 
	ON pm.posi_to_play = pp.position_id
WHERE pp.position_desc = 'Defenders'
GROUP BY pm.player_name, pm.jersey_no, pm.playing_club;

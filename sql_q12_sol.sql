-- Solution stub for Question 12
-- 12. Write a SQL query that returns the total number of goals scored by each position on
-- each country’s team. Do not include positions which scored no goals.

SELECT
	sc.country_name,
    pp.position_desc,
	COUNT(1) AS TotalGoalsScored
FROM goal_details AS 			gd		-- a row signifies a goal
INNER JOIN player_mast 			pm
	ON gd.player_id	= pm.player_id
INNER JOIN playing_position AS 	pp
	ON pm.posi_to_play = pp.position_id
INNER JOIN soccer_country AS sc
	ON pm.team_id = sc.country_id
GROUP BY sc.country_name, pp.position_desc
ORDER BY sc.country_name, pp.position_desc

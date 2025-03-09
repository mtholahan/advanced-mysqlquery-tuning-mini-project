-- Solution stub for Question 9
-- 9. Write a SQL query to find the goalkeeper’s name and jersey number, playing for
-- Germany, who played in Germany’s group stage matches.

SELECT
	md.play_stage,
    sc.country_name,
    pm.player_name AS goalkeeper_name,
    pm.jersey_no AS goalkeeper_jersey_no
FROM match_details AS 			md
INNER JOIN soccer_country AS 	sc
	ON md.team_id = sc.country_id
INNER JOIN player_mast AS 		pm
	ON md.player_gk = pm.player_id -- goal keeper ID
WHERE
	md.play_stage = 'G'	-- Group Stage
AND
	sc.country_name = 'Germany'
GROUP BY md.play_stage, sc.country_name, pm.player_name, pm.jersey_no;


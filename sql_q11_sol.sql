-- Solution stub for Question 11
-- 11. Write a SQL query to find the players, their jersey number, and playing club who were
-- the goalkeepers for England in EURO Cup 2016.

SELECT
	pm.player_name, 
    pm.jersey_no, 
    pm.playing_club
FROM player_mast pm
WHERE pm.player_id =
(
	SELECT m.player_gk
	FROM match_details AS 			m
	INNER JOIN soccer_country AS 	s
		ON m.team_id = s.country_id
	WHERE s.country_name = 'England'
	GROUP BY m.player_gk
)
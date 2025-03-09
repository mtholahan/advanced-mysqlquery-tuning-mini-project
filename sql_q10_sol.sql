-- Solution stub for Question 10
-- 10. Write a SQL query to find all available information about the players under contract to
-- Liverpool F.C. playing for England in EURO Cup 2016.

SELECT
	p.player_id,
    p.jersey_no,
    p.player_name,
    pp.position_desc,
    p.dt_of_bir,
    p.age,
    p.playing_club,
    s.country_name
FROM player_mast AS 		p
INNER JOIN soccer_country 	s 
	ON p.team_id = s.country_id
INNER JOIN playing_position pp
	ON p.posi_to_play = pp.position_id
WHERE
	p.playing_club = 'Liverpool'
AND
	s.country_name = 'England'
ORDER BY p.player_name;
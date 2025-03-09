-- Solution stub for Question 4
-- 4. Write a SQL query to compute a list showing the number of substitutions that
-- happened in various stages of play for the entire tournament.

SELECT 
    COALESCE(m.play_stage, 'Tournament Total') AS play_stage,
    COUNT(*) AS SubstitutionCount
FROM match_mast AS 			m
INNER JOIN player_in_out AS p
	ON m.match_no = p.match_no
WHERE p.in_out = 'I' -- when a player came into the field
GROUP BY m.play_stage WITH ROLLUP;



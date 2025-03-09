-- Solution stub for Question 8
-- 8. Write a SQL query to find the match number for the game with the highest number of
-- penalty shots, and which countries played that match.

WITH penalty_shot_matches
AS
(
SELECT
	md.match_no,
	SUM(md.penalty_score) AS TotalPenaltyScore,
    RANK() OVER(ORDER BY SUM(md.penalty_score) DESC) AS TheRank
FROM match_details AS md
WHERE md.penalty_score > 0 -- choose only matches having penalty shots
GROUP BY md.match_no
)
SELECT
	psm.match_no,
    sc.country_name
FROM penalty_shot_matches AS psm
INNER JOIN match_details AS md
	ON psm.match_no = md.match_no
INNER JOIN soccer_country sc
	ON md.team_id = sc.country_id
WHERE psm.TheRank = 1;



    
    
    
    
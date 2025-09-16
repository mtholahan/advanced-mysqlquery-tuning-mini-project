-- Solution stub for Question 3
-- 3. Write a SQL query to find the match number, date, and score for matches in which no
-- stoppage time was added in the 1st half.

SELECT
	m.match_no, 
    m.play_date, 
    m.goal_score
FROM match_mast AS m
WHERE m.stop1_sec = 0;

-- Solution stub for Question 2
-- 2. Write a SQL query to find the number of matches that were won by penalty shootout.

SELECT COUNT(m.decided_by) AS DecidedByPenaltyKick
FROM euro_cup_2016.match_mast AS m
WHERE m.decided_by = 'P';

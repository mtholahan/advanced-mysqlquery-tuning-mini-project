-- Solution stub for Question 18
-- 18. Write a SQL query to find the highest number of foul cards given in one match.

WITH MatchFouls (match_no, FoulsPerMatch, TheRank)
AS
(
SELECT
	pb.match_no,
    COUNT(*) AS FoulsPerMatch,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS TheRank
FROM player_booked AS pb
GROUP BY pb.match_no
)
SELECT
	mf.FoulsPerMatch AS HighestNumberOfFoulCardsIn1Match
FROM MatchFouls AS mf
WHERE mf.TheRank = 1

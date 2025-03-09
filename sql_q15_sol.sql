-- Solution stub for Question 15
-- 15. Write a SQL query to find the referee who booked the most number of players.

WITH ThePlayersTheRefsBooked (referee_id, player_id)
AS
(
SELECT
	mm.referee_id,
	pb.player_id
FROM player_booked 		pb
INNER JOIN match_mast	mm
	ON pb.match_no = mm.match_no
GROUP BY mm.referee_id, pb.player_id
),
TotalPlayersBookedAll (referee_name, TotalPlayersBooked, TheRank)
AS
(
SELECT
    rm.referee_name,
    COUNT(ThePlayersTheRefsBooked.player_id) AS TotalPlayersBooked,
    RANK() OVER(ORDER BY COUNT(ThePlayersTheRefsBooked.player_id) DESC) AS TheRank
FROM ThePlayersTheRefsBooked
INNER JOIN referee_mast rm
	ON ThePlayersTheRefsBooked.referee_id = rm.referee_id
GROUP BY rm.referee_name
)
SELECT
	tpba.referee_name,
    tpba.TotalPlayersBooked
FROM TotalPlayersBookedAll tpba
WHERE tpba.TheRank = 1

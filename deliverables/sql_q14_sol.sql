-- Solution stub for Question 14
-- 14. Write a SQL query to find referees and the number of bookings they made for the
-- entire tournament. Sort your answer by the number of bookings in descending order.

WITH MatchBookings (match_no, TotalBookingsPerMatch)
AS
(
	SELECT
		pb.match_no,
		COUNT(*) AS TotalBookingsPerMatch
    FROM player_booked pb
    GROUP BY pb.match_no
)
SELECT
	rm.referee_name,
    SUM(MatchBookings.TotalBookingsPerMatch) AS RefereeTotalTournamentBookings
FROM MatchBookings
INNER JOIN match_mast AS mm
	ON MatchBookings.match_no = mm.match_no
INNER JOIN referee_mast rm
	ON mm.referee_id = rm.referee_id
GROUP BY rm.referee_name
ORDER BY RefereeTotalTournamentBookings DESC

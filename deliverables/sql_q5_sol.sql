-- Solution stub for Question 5
-- 5. Write a SQL query to find the number of bookings that happened in stoppage time.

SELECT
	COUNT(*) AS NoBookingsInStoppage
FROM player_booked AS p
WHERE p.play_schedule = 'ST';
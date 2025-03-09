-- Solution stub for Question 6
-- 6. Write a SQL query to find the number of matches that were won by a single point, but
-- do not include matches decided by penalty shootout.

WITH team_scores AS
(
SELECT 
    md.match_no,
    MAX(CASE WHEN md.team_id = t.min_team THEN md.goal_score END) AS team_1_score,
    MAX(CASE WHEN md.team_id = t.max_team THEN md.goal_score END) AS team_2_score
FROM match_details AS md
JOIN (
    -- Get the min and max team_id per match_no to differentiate Team 1 and Team 2
    SELECT match_no, 
           MIN(team_id) AS min_team,
           MAX(team_id) AS max_team
    FROM match_details
    GROUP BY match_no
) AS t
ON md.match_no = t.match_no
GROUP BY md.match_no
),
no_penalty_kick_win
AS
(
SELECT
	ts.match_no,
    ABS(ts.team_1_score - ts.team_2_score) AS ScoreDelta
FROM team_scores AS ts
WHERE
	ts.match_no IN
    (
		SELECT m.match_no
		FROM match_mast AS m
		WHERE m.decided_by <> 'P'
    )
)
SELECT
	COUNT(*) AS MatchesWonBySinglePointNoPenaltyShootout
FROM no_penalty_kick_win AS np
WHERE np.ScoreDelta = 1;

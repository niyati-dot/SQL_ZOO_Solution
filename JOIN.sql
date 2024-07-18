-- 1) Show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
  FROM goal 
  WHERE teamid = 'GER';

-- 2) Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2
  FROM game where id = 1012;

-- 3) Show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate 
  FROM game JOIN goal ON (id=matchid) where teamid = 'GER';
  
-- 4) Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT 
    g.team1, g.team2, go.player
FROM
    game g
        LEFT JOIN
    goal go ON g.id = go.matchid
WHERE
    go.player LIKE 'Mario%';
    
-- 5) Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT 
    g.player, g.teamid, go.coach, g.gtime
FROM
    goal g
        JOIN
    eteam go ON g.teamid = go.id
WHERE
    g.gtime <= 10;

-- 6) List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT 
    g.mdate, e.teamname
FROM
    game g
        JOIN
    eteam e ON g.team1 = e.id
WHERE
    coach = 'Fernando Santos';

-- 7) List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT 
    go.player
FROM
    game g
        JOIN
    goal go ON g.id = go.matchid
WHERE
    g.stadium = 'National Stadium, Warsaw';

-- 8) Show the name of all players who scored a goal against Germany.
SELECT DISTINCT
    (go.player)
FROM
    game g
        JOIN
    goal go ON go.matchid = g.id
WHERE
    (team1 = 'GER' OR team2 = 'GER')
        AND go.teamid <> 'GER';

-- 9) Show teamname and the total number of goals scored.
SELECT 
    e.teamname, COUNT(g.teamid) AS 'Goal Scored'
FROM
    eteam e
        LEFT JOIN
    goal g ON e.id = g.teamid
GROUP BY teamname;

-- 10) Show the stadium and the number of goals scored in each stadium.
SELECT 
    g.stadium, COUNT(go.player) AS 'Goal Scored'
FROM
    game g
        JOIN
    goal go ON g.id = go.matchid
GROUP BY g.stadium;

-- 11) For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT 
    g.id, g.mdate, COUNT(go.player) AS 'Goal Scored'
FROM
    game g
        JOIN
    goal go ON g.id = go.matchid
WHERE
    (g.team1 = 'POL' OR g.team2 = 'POL')
        OR go.teamid = 'POL'
GROUP BY g.id;

-- 12) For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT 
    go.matchid, g.mdate, COUNT(go.player) AS 'Goal Scored'
FROM
    goal go
        JOIN
    game g ON go.matchid = g.id
WHERE
    go.teamid = 'GER'
GROUP BY go.matchid;

-- 13) List every match with the goals scored by each team. Sort your result by mdate, matchid, team1 and team2.
SELECT 
    g.mdate,
    g.team1,
    SUM(CASE
        WHEN go.teamid = g.team1 THEN 1
        ELSE 0
    END) score1,
    g.team2,
    SUM(CASE
        WHEN go.teamid = g.team2 THEN 1
        ELSE 0
    END) score2
FROM
    game g
        LEFT JOIN
    goal go ON go.matchid = g.id
GROUP BY g.id
ORDER BY mdate , matchid , team1 , team2;



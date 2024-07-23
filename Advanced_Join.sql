-- 1) List the films where the yr is 1962 [Show id, title]
SELECT m.id, m.title
 FROM movie m
 WHERE m.yr = 1962;
    
-- 2) Give year of 'Citizen Kane'.
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane';

-- 3) List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;

-- 4) What id number does the actor 'Glenn Close' have?
SELECT id
 FROM actor
 WHERE name = 'Glenn Close';
    
-- 5) What is the id of the film 'Casablanca'
SELECT id
 FROM movie
 WHERE title = 'Casablanca';

-- 6) Obtain the cast list for 'Casablanca'. what is a cast list?
SELECT a.name
 FROM actor a
 JOIN casting c ON a.id = c.actorid
 WHERE c.movieid = 11768;
    
-- OR

SELECT a.name
 FROM actor a
 JOIN casting c ON a.id = c.actorid
 WHERE c.movieid = (SELECT id
                       FROM movie
                       WHERE title = 'Casablanca');

-- 7) Obtain the cast list for the film 'Alien'
SELECT a.name
 FROM actor a
 JOIN casting c ON a.id = c.actorid
 WHERE c.movieid = (SELECT id
                       FROM movie
                       WHERE title = 'Alien');

-- 8) List the films in which 'Harrison Ford' has appeared
SELECT m.title
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 WHERE c.actorid = (SELECT id
                       FROM actor
                       WHERE name = 'Harrison Ford');

-- 9) List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT m.title
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 WHERE actorid = (SELECT id
                    FROM actor
                    WHERE name = 'Harrison Ford') AND c.ord != 1;

-- 10) List the films together with the leading star for all 1962 films.
-- joining 3 table together movie, actor, casting
SELECT m.title, a.name
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 JOIN actor a ON a.id = c.actorid
 WHERE c.ord = 1 AND yr = 1962;

-- 11) Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT m.yr, COUNT(m.id)
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 JOIN actor a ON c.actorid = a.id
 WHERE a.name = 'Rock Hudson'
 GROUP BY yr
 HAVING COUNT(m.id) > 2;

-- 12) List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT m.title, a.name
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 JOIN actor a ON a.id = c.actorid
 WHERE m.id IN (SELECT movieid
                    FROM casting
                    WHERE actorid = (SELECT id
                                        FROM actor
                                        WHERE name = 'Julie Andrews')) AND c.ord = 1;

-- 13) Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT a.name
 FROM actor a
 JOIN casting c ON (a.id = c.actorid AND (SELECT COUNT(ord)
                                            FROM casting
                                            WHERE actorid = a.id AND ord = 1) >= 15)
 GROUP BY name;

-- 14) List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT m.title, COUNT(c.actorid) AS 'Total Actors'
 FROM movie m
 JOIN casting c ON m.id = c.movieid
 WHERE m.yr = 1978 AND m.id = c.movieid
 GROUP BY m.title
 ORDER BY COUNT(c.actorid) DESC , m.title;

-- 15) List all the people who have worked with 'Art Garfunkel'.
SELECT a.name
 FROM actor a
 JOIN casting c ON a.id = c.actorid
 JOIN movie m ON m.id = c.movieid
 WHERE m.id IN (SELECT movieid
                    FROM casting
                    WHERE actorid = (SELECT id
                                        FROM actor
                                        WHERE name = 'Art Garfunkel')) AND a.name != 'Art Garfunkel';


-- SELECT QUIZ ANSWERS:

SELECT 
    name, population
FROM
    world
WHERE
    population BETWEEN 1000000 AND 1250000;
 
 -- 2) Pick the result you would obtain from this code: 
SELECT 
    name, population
FROM
    world
WHERE
    name LIKE 'Al%';
-- ANS: Table-E
-- Albania	3200000
-- Algeria	32900000

SELECT 
    name
FROM
    world
WHERE
    name LIKE '%a' OR name LIKE '%l';
 
--  4) result from the query
SELECT 
    name, LENGTH(name)
FROM
    world
WHERE
    LENGTH(name) = 5 AND region = 'Europe';
-- ANS:
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5
 
SELECT 
    name, area * 2
FROM
    world
WHERE
    population = 64000;
--  ANS: Andorra	936

SELECT 
    name, area, population
FROM
    world
WHERE
    area > 50000 AND population < 10000000;
 
--  7) code that shows the population density of China, Australia, Nigeria and France
SELECT 
    name, population / area
FROM
    world
WHERE
    name IN ('China' , 'Nigeria', 'France', 'Australia');
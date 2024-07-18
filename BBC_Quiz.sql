-- BBC Quiz :

SELECT 
    name
FROM
    world
WHERE
    name LIKE 'U%';

-- 2) code which shows just the population of United Kingdom?
SELECT 
    population
FROM
    world
WHERE
    name = 'United Kingdom';
 
--  3) shows the problem with this SQL code - the intended result should be the continent of France:
SELECT 
    continent
FROM
    world
WHERE
    'name' = 'France';
-- Ans: 'name' should be name

SELECT 
    name, population / 10
FROM
    world
WHERE
    population < 10000;
 -- Ans: Nauru	990
 
SELECT 
    name, population
FROM
    world
WHERE
    continent IN ('Europe' , 'Asia');
 
-- 6)  code which would give two rows
SELECT 
    name
FROM
    world
WHERE
    name IN ('Cuba' , 'Togo');
 
-- 7) result that would be obtained from this code:
SELECT 
    name
FROM
    world
WHERE
    continent = 'South America'
        AND population > 40000000;
-- Ans: 
-- Brazil
-- Colombia
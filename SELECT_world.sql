-- 1) show the name, continent and population of all countries.
SELECT 
    name, continent, population
FROM
    world;

-- 2) Show the name for the countries that have a population of at least 200 million.
SELECT 
    name
FROM
    world
WHERE
    population >= 200000000;

-- 3)  Give the name and the per capita GDP for those countries with a population of at least 200 million
SELECT 
    name, GDP / population AS 'per capita GDP'
FROM
    world
WHERE
    population >= 200000000;

-- 4) Show the name and population in millions for the countries of the continent 'South America'.
SELECT 
    name, population / 1000000 AS 'population in millions'
FROM
    world
WHERE
    continent = 'South America';

-- 5) Show the name and population for France, Germany, Italy
SELECT 
    name, population
FROM
    world
WHERE
    name IN ('france' , 'germany', 'italy');

-- 6) Show the countries which have a name that includes the word 'United'
SELECT 
    name
FROM
    world
WHERE
    name LIKE '%united%';

-- 7) Show the countries that are big by area or big by population. Show name, population and area.
SELECT 
    name, population, area
FROM
    world
WHERE
    area > 3000000 OR population > 250000000;

-- 8) Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT 
    name, population, area
FROM
    world
WHERE
    area > 3000000
        XOR population > 250000000;
-- MySQL XOR operator checks two operands (or expressions) and returns TRUE if one or the other but not both is TRUE

SELECT 
    name,
    ROUND(population / 1000000, 2) AS 'Population in Millions',
    ROUND(gdp / 1000000000, 2) AS 'GDP in Billions'
FROM
    world
WHERE
    continent = 'South America';

-- 10) Show the name and per-capita GDP for those countries with a GDP of at least one trillion. Round this value to the nearest 1000. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT 
    name, ROUND(gdp / population, - 3) AS 'per-capita GDP'
FROM
    world
WHERE
    gdp > 1000000000000;

-- 11) Show the name and capital where the name and the capital have the same number of characters.
SELECT 
    name, capital
FROM
    world
WHERE
    LENGTH(name) = LENGTH(capital);

-- 12) Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT 
    name, capital
FROM
    world
WHERE
    LEFT(name, 1) = LEFT(capital, 1)
        AND name <> capital;
-- here function LEFT to isolate the first character. <> as the NOT EQUALS operator

SELECT 
    name
FROM
    world
WHERE
    name LIKE '%a%' AND name LIKE '%e%'
        AND name LIKE '%i%'
        AND name LIKE '%o%'
        AND name LIKE '%u%'
        AND name NOT LIKE '% %'

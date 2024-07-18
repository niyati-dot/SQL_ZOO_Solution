-- Select within Select 
-- world(name, continent, area, population, gdp)

SELECT 
    name
FROM
    world
WHERE
    population > (SELECT 
            population
        FROM
            world
        WHERE
            name = 'Russia');

-- 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'
SELECT 
    name
FROM
    world
WHERE
    continent = 'Europe'
        AND gdp / population > (SELECT 
            gdp / population
        FROM
            world
        WHERE
            name = 'United Kingdom');

-- 3) List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT 
    name, continent
FROM
    world
WHERE
    continent IN (SELECT 
            continent
        FROM
            world
        WHERE
            name = 'Argentina' OR name = 'Australia')
ORDER BY name;

-- 4) Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT 
    name, population
FROM
    world
WHERE
    population > (SELECT 
            population
        FROM
            world
        WHERE
            name = 'United Kingdom')
        AND population < (SELECT 
            population
        FROM
            world
        WHERE
            name = 'Germany');

-- 5) Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT 
    name,
    CONCAT(ROUND((population * 100) / (SELECT 
                            population
                        FROM
                            world
                        WHERE
                            name = 'Germany')),
            '%') AS 'percentage'
FROM
    world
WHERE
    continent = 'Europe';

-- 6) Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT 
    name
FROM
    world
WHERE
    gdp > ALL (SELECT 
            gdp
        FROM
            world
        WHERE
            continent = 'Europe');

-- 7) Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT 
    continent, name, area
FROM
    world a
WHERE
    area > (SELECT 
            MAX(area)
        FROM
            world b
        WHERE
            a.continent = b.continent
                AND a.name <> b.name);

-- 8) List each continent and the name of the country that comes first alphabetically.
SELECT 
    continent, name
FROM
    world
GROUP BY continent
ORDER BY name , 1;

-- 9) Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT 
    name, continent, population
FROM
    world a
WHERE
    continent NOT IN (SELECT 
            continent
        FROM
            world b
        WHERE
            a.continent = b.continent
                AND population <= 25000000);

-- 10) Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT 
    name, continent
FROM
    world a
WHERE
    population > ALL (SELECT 
            population * 3
        FROM
            world b
        WHERE
            a.continent = b.continent
                AND a.name <> b.name);

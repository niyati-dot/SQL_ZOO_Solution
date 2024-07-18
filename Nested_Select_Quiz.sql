-- Nested SELECT Quiz
-- 1) Code that shows the name, region and population of the smallest country in each region
SELECT 
    region, name, population
FROM
    bbc x
WHERE
    population <= ALL (SELECT 
            population
        FROM
            bbc y
        WHERE
            y.region = x.region AND population > 0);
 
-- 2) Code that shows the countries belonging to regions with all populations over 50000
SELECT 
    name, region, population
FROM
    bbc x
WHERE
    50000 < ALL (SELECT 
            population
        FROM
            bbc y
        WHERE
            x.region = y.region AND y.population > 0);

-- 3) Code that shows the countries with a less than a third of the population of the countries around it
SELECT 
    name, region
FROM
    bbc x
WHERE
    population < ALL (SELECT 
            population / 3
        FROM
            bbc y
        WHERE
            y.region = x.region AND y.name != x.name);

-- 4) result that would be obtained from the following code:
SELECT 
    name
FROM
    bbc
WHERE
    population > (SELECT 
            population
        FROM
            bbc
        WHERE
            name = 'United Kingdom')
        AND region IN (SELECT 
            region
        FROM
            bbc
        WHERE
            name = 'United Kingdom');
-- Ans: 
-- France
-- Germany
-- Russia
-- Turkey

SELECT 
    name
FROM
    bbc
WHERE
    gdp > (SELECT 
            MAX(gdp)
        FROM
            bbc
        WHERE
            region = 'Africa');

-- 6) Code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT 
    name
FROM
    bbc
WHERE
    population < (SELECT 
            population
        FROM
            bbc
        WHERE
            name = 'Russia')
        AND population > (SELECT 
            population
        FROM
            bbc
        WHERE
            name = 'Denmark');

-- 7) result that would be obtained from the following code:
SELECT 
    name
FROM
    bbc
WHERE
    population > ALL (SELECT 
            MAX(population)
        FROM
            bbc
        WHERE
            region = 'Europe')
        AND region = 'South Asia';
-- Ans:
-- Bangladesh
-- India
-- Pakistan
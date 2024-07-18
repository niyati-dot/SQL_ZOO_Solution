-- Nobel Quiz:

SELECT 
    winner
FROM
    nobel
WHERE
    winner LIKE 'C%' AND winner LIKE '%n';
 
--  2) code that shows how many Chemistry awards were given between 1950 and 1960
SELECT 
    COUNT(subject)
FROM
    nobel
WHERE
    subject = 'Chemistry'
        AND yr BETWEEN 1950 AND 1960;
   
-- 3) code that shows the amount of years where no Medicine awards were given
SELECT 
    COUNT(DISTINCT yr)
FROM
    nobel
WHERE
    yr NOT IN (SELECT DISTINCT
            yr
        FROM
            nobel
        WHERE
            subject = 'Medicine');
 
-- 4) result that would be obtained from the following code:
SELECT 
    subject, winner
FROM
    nobel
WHERE
    winner LIKE 'Sir%' AND yr LIKE '196%';
-- ANS:
-- Medicine	Sir John Eccles
-- Medicine	Sir Frank Macfarlane Burnet

SELECT 
    yr
FROM
    nobel
WHERE
    yr NOT IN (SELECT 
            yr
        FROM
            nobel
        WHERE
            subject IN ('Chemistry' , 'Physics'));
                 
-- 6) code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT
    yr
FROM
    nobel
WHERE
    subject = 'Medicine'
        AND yr NOT IN (SELECT 
            yr
        FROM
            nobel
        WHERE
            subject = 'Literature')
        AND yr NOT IN (SELECT 
            yr
        FROM
            nobel
        WHERE
            subject = 'Peace');

-- 7) result that would be obtained from the following code:
SELECT 
    subject, COUNT(subject)
FROM
    nobel
WHERE
    yr = '1960'
GROUP BY subject

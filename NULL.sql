-- 1) List the teachers who have NULL for their department.
SELECT name 
 FROM teacher 
 WHERE dept IS NULL;

-- 2)  INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher 
 INNER JOIN dept ON (teacher.dept=dept.id);

-- 3) all teachers are listed.
SELECT t.name, d.name
 FROM teacher t
 LEFT JOIN dept d ON t.dept = d.id;
 
-- 4) ll departments are listed.
SELECT t.name, d.name
 FROM teacher t 
 RIGHT JOIN dept d ON d.id = t.dept;
 
-- 5) Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT t.name, COALESCE(t.mobile,'07986 444 2266')
 FROM teacher t;
 
-- 6) print the teacher name and department name. Use the string 'None' where there is no department.
SELECT t.name, COALESCE(d.name, 'None') 
 FROM teacher t LEFT 
 JOIN dept d ON t.dept = d.id;
 
-- 7) show the number of teachers and the number of mobile phones
SELECT COUNT(name), COUNT(mobile)
 FROM teacher;

-- 8) to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT d.name, COUNT(t.id)
 FROM teacher t 
 RIGHT JOIN dept d ON d.id = t.dept
 GROUP BY d.name;
 
-- 9) show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT t.name,
 CASE 
   WHEN t.dept = 1 OR t.dept = 2 THEN 'Sci'
   ELSE 'Art'
   END AS Department
 FROM teacher t;
 
-- 10) show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT t.name,
  CASE
    WHEN t.dept = 1 OR t.dept = 2 THEN 'Sci'
    WHEN t.dept = 3 THEN 'Art'
    ELSE 'None'
    END AS Department
 FROM teacher t;
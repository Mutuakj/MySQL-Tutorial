
-- Limit (Specifies the number or rows needed in an output) & Aliasing (Changing the name of a column)
SELECT * 
FROM parks_and_recreation.employee_demographics
LIMIT 3
;

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- Aliasing
SELECT gender, AVG(age) AS avg_age 
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
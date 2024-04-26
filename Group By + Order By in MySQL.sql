-- Group By (Groups rows that has the same values)

SELECT * 
FROM parks_and_recreation.employee_demographics
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY (Sorts the resulting in either ASCending or DESCending order)
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC
;

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;














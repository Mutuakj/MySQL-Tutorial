-- Show the tables in the walmartdata Database 
SHOW tables;

-- Explore the structure and contents of the walmartsalesdata Table
DESCRIBE walmartsalesdata;

-- Add a new column with the correct data type
ALTER TABLE walmartsalesdata
ADD COLUMN new_date DATE;

-- Convert the "Time" column from text to TIME data type
ALTER TABLE walmartsalesdata
MODIFY COLUMN Time TIME;

-- Check unique value in the "Gender" column ( This helps to identify any inconsistencies which can be handled)
SELECT DISTINCT Gender
FROM walmartsalesdata;

-- Check the range of values in the "Rating" column
SELECT MIN(Rating) AS Min_rating, MAX(Rating) AS Max_rating
FROM walmartsalesdata;

-- Check all columns in the walmartsalesdata table
SELECT * 
FROM walmartsalesdata;

-- Product Questions: 1) How many unique product lines does the data have?
SELECT COUNT(DISTINCT Product_line) AS unique_product_lines
FROM walmartsalesdata;

-- 2) What is the most common payment method?
SELECT Payment, COUNT(*) AS frequency
FROM walmartsalesdata
GROUP BY Payment
ORDER BY frequency DESC
LIMIT 1;

-- 3) What is the most selling product line?
SELECT Product_line, SUM(Quantity) AS total_quantity_sold
FROM walmartsalesdata
GROUP BY Product_line
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- 4) What is the total revenue?
SELECT SUM(Total) AS total_revenue
FROM walmartsalesdata;

-- What product line had the largest revenue?
SELECT Product_line, SUM(Total) AS total_revenue
FROM walmartsalesdata
GROUP BY Product_line
ORDER BY total_revenue DESC
LIMIT 1;

-- 5) What is the city with the largest revenue?
SELECT City, SUM(Total) AS total_revenue
FROM walmartsalesdata
GROUP BY City
ORDER BY total_revenue DESC
LIMIT 10;

-- 6) What product line had the largest VAT?
SELECT Product_line, SUM(Tax_5_Percent) AS total_vat
FROM walmartsalesdata
GROUP BY Product_line
ORDER BY total_vat DESC
LIMIT 1;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales.
SELECT 
	Product_line,
	CASE 
		WHEN SUM(Total) > (SELECT AVG(Total) FROM walmartsalesdata) THEN 'Good'
        ELSE 'Bad'
	END AS Sales_Status
FROM walmartsalesdata
GROUP BY Product_line;


-- Which branch sold more products than average product sold?







       
       

















































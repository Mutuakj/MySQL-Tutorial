-- Show the tables in the walmartdata Database 
SHOW tables;

-- Explore the structure and contents of the walmartsalesdata Table
DESCRIBE walmartsalesdata2;

-- Check unique value in the "Gender" column ( This helps to identify any inconsistencies which can be handled)
SELECT DISTINCT Gender
FROM walmartsalesdata2;

-- Check the range of values in the "Rating" column
SELECT MIN(Rating) AS Min_rating, MAX(Rating) AS Max_rating
FROM walmartsalesdata2;

-- Check all columns in the walmartsalesdata table
SELECT * 
FROM walmartsalesdata2;

-- 1) How many unique product lines does the data have?
SELECT COUNT(DISTINCT Product_line) AS unique_product_lines
FROM walmartsalesdata2;

-- 2) What is the most common payment method?
SELECT Payment, COUNT(*) AS frequency
FROM walmartsalesdata2
GROUP BY Payment
ORDER BY frequency DESC
LIMIT 1;

-- 3) What is the most selling product line?
SELECT Product_line, SUM(Quantity) AS total_quantity_sold
FROM walmartsalesdata2
GROUP BY Product_line
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- 4) What is the total revenue?
SELECT SUM(Total) AS total_revenue
FROM walmartsalesdata2;

-- What product line had the largest revenue?
SELECT Product_line, SUM(Total) AS total_revenue
FROM walmartsalesdata2
GROUP BY Product_line
ORDER BY total_revenue DESC;

-- 5) What is the city with the largest revenue?
SELECT City, SUM(Total) AS total_revenue
FROM walmartsalesdata2
GROUP BY City
ORDER BY total_revenue DESC;

-- 6) What product line had the largest VAT?
SELECT Product_line, SUM(Tax_5_Percent) AS total_vat
FROM walmartsalesdata2
GROUP BY Product_line
ORDER BY total_vat DESC
LIMIT 1;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales.
SELECT 
	Product_line,
	CASE 
		WHEN SUM(Total) > (SELECT AVG(Total) FROM walmartsalesdata2) THEN 'Good'
        ELSE 'Bad'
	END AS Sales_Status
FROM walmartsalesdata2
GROUP BY Product_line;

-- Calculating the Average products sold--
SELECT AVG(total_products_sold) AS average_products_sold
FROM (SELECT Branch, COUNT(*) AS total_products_sold
FROM walmartsalesdata2
GROUP BY Branch) AS average_products_sold;

-- Calculating the total products sold by each Branch--
SELECT Branch, COUNT(*) AS total_products_sold
FROM walmartsalesdata2
GROUP BY Branch;

-- Which branch sold more products than average product sold?
SELECT Branch
FROM (
    SELECT Branch, COUNT(*) AS total_products_sold
    FROM walmartsalesdata2
    GROUP BY Branch
) AS branch_sales
WHERE total_products_sold > (SELECT AVG(total_products_sold) FROM (
    SELECT COUNT(*) AS total_products_sold
    FROM walmartsalesdata2
    GROUP BY Branch
) AS avg_branch_sales);

-- What is the most common product line by gender?
SELECT Gender, Product_line, COUNT(*) AS frequency
FROM walmartsalesdata2
GROUP BY Gender, Product_line
ORDER BY Gender, frequency DESC;

-- What is the average rating of each product line?
SELECT Product_line, AVG(Rating) AS average_rating
FROM walmartsalesdata2
GROUP BY Product_line;

-- Which of the customer types brings the most revenue?
SELECT Customer_type, SUM(Total) AS total_revenue
FROM walmartsalesdata2
GROUP BY Customer_type
ORDER BY total_revenue DESC
LIMIT 1;

-- Which city has the largest tax percentage/ VAT (Value Added Tax)?
SELECT City, (SUM(Tax_5_Percent) / SUM(Total)) * 100 AS total_percentage
FROM walmartsalesdata2
GROUP BY City
ORDER BY total_percentage DESC
Limit 1;

-- Which customer type pays the most VAT?
SELECT Customer_type, SUM(Tax_5_Percent) AS total_vat
FROM walmartsalesdata2
GROUP BY Customer_type
ORDER BY total_vat DESC;

-- How many unique customer types does the data have?
SELECT COUNT(DISTINCT Customer_type) AS unique_customer_types
FROM walmartsalesdata2;

-- How many unique payment methods does the data have?
SELECT COUNT(DISTINCT Payment) AS unique_payment_methods
FROM walmartsalesdata2;

-- What is the most common customer type?
SELECT Customer_type, COUNT(*) AS frequency
FROM walmartsalesdata2
GROUP BY Customer_type
ORDER BY frequency DESC
LIMIT 1;

-- What is the gender of most of the customers?
SELECT Gender, COUNT(*) AS frequency
FROM walmartsalesdata2
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY frequency DESC;

-- What is the gender distribution per branch?
SELECT Branch, Gender, COUNT(*) AS frequency
FROM walmartsalesdata2
WHERE Gender IS NOT NULL
GROUP BY Branch, Gender
ORDER BY Branch, frequency DESC;

-- Which payment method is most commonly associated with customer ratings?
SELECT Payment, COUNT(*) AS rating_count
FROM walmartsalesdata2
WHERE Rating IS NOT NULL
GROUP BY Payment
ORDER BY rating_count DESC;



















       
       

















































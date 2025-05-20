---CREATE TABLE
DROP TABLE IF EXISTS walmart_sales;
CREATE TABLE walmart_sales(
		                            invoice_id VARCHAR(15),
		                            branch	CHAR(1),	
		                            city  VARCHAR(25),  
		                            customer_type	VARCHAR(15),
		                            gender	VARCHAR(15),
		                            product_line VARCHAR(55),	
		                            unit_price	FLOAT,
		                            quantity    INT, 	
		                            vat	FLOAT,
		                            total	FLOAT,
		                            date	date,	
		                            time time,
		                            payment_method	VARCHAR(15),
		                            rating FLOAT
		                        );
			


-- 1. Total Revenue by Branch
SELECT branch, SUM(total) AS Total_Revenue
FROM walmart_sales
GROUP BY branch
ORDER BY Total_Revenue DESC;

-- 2. Average Spend per Customer Type
SELECT customer_type, AVG(total) AS Avg_Spend
FROM walmart_sales
GROUP BY customer_type;

-- 3. Top Performing Cities by Revenue
SELECT city, SUM(total) AS Total_Revenue
FROM walmart_sales
GROUP BY city
ORDER BY Total_Revenue DESC;

-- 4. Product Line Performance (Revenue)
SELECT product_line, SUM(total) AS Total_Sales
FROM walmart_sales
GROUP BY product_line
ORDER BY Total_Sales DESC;

-- 5. Gender-wise Sales Analysis
SELECT gender, SUM(total) AS Total_Sales
FROM walmart_sales
GROUP BY gender;

-- 6. Payment Method Preferences
SELECT payment_method, COUNT(*) AS Transaction_Count
FROM walmart_sales
GROUP BY payment_method
ORDER BY Transaction_Count DESC;

-- 7. Average Quantity per Product Line
SELECT product_line, AVG(quantity) AS Avg_Quantity
FROM walmart_sales
GROUP BY product_line;

-- 8. Peak Shopping Hours
SELECT EXTRACT (HOUR FROM time) AS Hour, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Hour
ORDER BY Transactions DESC;

-- 9. Daily Sales Trend
SELECT date, SUM(total) AS Daily_Sales
FROM walmart_sales
GROUP BY date
ORDER BY date;

-- 10. Average Rating by Product Line
SELECT product_line,AVG(rating) AS Avg_Rating
FROM walmart_sales
GROUP BY product_line
ORDER BY Avg_Rating DESC;

-- 11. Gender-wise Average Spend
SELECT gender, AVG(total) AS Avg_Spend
FROM walmart_sales
GROUP BY gender;

-- 12. Running Total of Sales by Date
SELECT date, SUM(total) OVER (ORDER BY date) AS Running_Total
FROM walmart_sales;

-- 13. Most Sold Product Lines by Quantity
SELECT product_line, SUM(quantity) AS Total_Units_Sold
FROM walmart_sales
GROUP BY product_line
ORDER BY Total_Units_Sold DESC;

-- 14. Average Revenue Per Transaction by Branch
SELECT branch, AVG(total) AS Avg_Transaction_Value
FROM walmart_sales
GROUP BY branch
ORDER BY branch;

-- 15. Transactions by Day of Week
SELECT TO_CHAR(Date, 'Day') AS Weekday, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Weekday
ORDER BY Weekday;

--Q.18 Find the total sales amount for each branch and hour of the day combination.
       SELECT 
	        branch,
			EXTRACT(HOUR FROM time) AS hour,
			SUM(total) AS Total_sales
	   FROM walmart_sales
	   GROUP BY 1,2
	   ORDER BY 1,3 DESC

-- 17. Top 5 Highest Revenue Transactions
		SELECT *
		FROM walmart_sales
		ORDER BY total DESC
		LIMIT 5;

-- 18. Payment Distribution by Customer Type
		SELECT customer_type, payment_method, COUNT(*) AS Count
		FROM walmart_sales
		GROUP BY customer_type, payment_method
		ORDER BY customer_type, Count DESC;

-- 19. Highest Rated Transaction per Branch
		SELECT *
		FROM (
		    SELECT *, RANK() OVER (PARTITION BY branch ORDER BY rating DESC) AS rnk
		    FROM walmart_sales
		) AS ranked
		WHERE rnk = 1;

-- 20. Hourly Revenue Trend
		SELECT EXTRACT(HOUR FROM time) AS Hour, SUM(total) AS Total_Revenue
		FROM walmart_sales
		GROUP BY Hour
		ORDER BY Hour;

--Q.21 Calculate the total sales amount for each branch for morning (6 AM to 12 PM), afternoon (12 PM to 6 PM), and evening (6 PM to 12 AM) periods using the time condition.
   SELECT * FROM walmart_sales
   
   WITH new_table
    AS
  (SELECT*,
        CASE
		  WHEN EXTRACT (HOUR FROM time) BETWEEN 6 AND 12 THEN 'Morning'
		  WHEN EXTRACT (HOUR FROM time) >12 AND EXTRACT (HOUR FROM time) <=18 THEN 'Afternoon'
          ELSE 'Evening'
		 End AS Shift 
	FROM walmart_sales	 
	)
   SELECT
        branch,
        Shift,
	    SUM(total) AS Total_Sales,
		COUNT(invoice_id) AS Number_of_order
    FROM new_table
	GROUP BY 1,2
    ORDER BY 1,3 DESC
SELECT * FROM walmart_sales

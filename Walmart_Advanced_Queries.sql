
-- 1. Total Revenue by Branch
SELECT Branch, SUM(Total) AS Total_Revenue
FROM walmart_sales
GROUP BY Branch
ORDER BY Total_Revenue DESC;

-- 2. Average Spend per Customer Type
SELECT `Customer Type`, AVG(Total) AS Avg_Spend
FROM walmart_sales
GROUP BY `Customer Type`;

-- 3. Top Performing Cities by Revenue
SELECT City, SUM(Total) AS Total_Revenue
FROM walmart_sales
GROUP BY City
ORDER BY Total_Revenue DESC;

-- 4. Product Line Performance (Revenue)
SELECT `Product line`, SUM(Total) AS Total_Sales
FROM walmart_sales
GROUP BY `Product line`
ORDER BY Total_Sales DESC;

-- 5. Gender-wise Sales Analysis
SELECT Gender, SUM(Total) AS Total_Sales
FROM walmart_sales
GROUP BY Gender;

-- 6. Payment Method Preferences
SELECT Payment, COUNT(*) AS Transaction_Count
FROM walmart_sales
GROUP BY Payment
ORDER BY Transaction_Count DESC;

-- 7. Average Quantity per Product Line
SELECT `Product line`, AVG(Quantity) AS Avg_Quantity
FROM walmart_sales
GROUP BY `Product line`;

-- 8. Peak Shopping Hours
SELECT strftime('%H', Time) AS Hour, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Hour
ORDER BY Transactions DESC;

-- 9. Daily Sales Trend
SELECT Date, SUM(Total) AS Daily_Sales
FROM walmart_sales
GROUP BY Date
ORDER BY Date;

-- 10. Average Rating by Product Line
SELECT `Product line`, ROUND(AVG(Rating), 2) AS Avg_Rating
FROM walmart_sales
GROUP BY `Product line`
ORDER BY Avg_Rating DESC;

-- 11. Gender-wise Average Spend
SELECT Gender, AVG(Total) AS Avg_Spend
FROM walmart_sales
GROUP BY Gender;

-- 12. Running Total of Sales by Date
SELECT Date, SUM(Total) OVER (ORDER BY Date) AS Running_Total
FROM walmart_sales;

-- 13. Most Sold Product Lines by Quantity
SELECT `Product line`, SUM(Quantity) AS Total_Units_Sold
FROM walmart_sales
GROUP BY `Product line`
ORDER BY Total_Units_Sold DESC;

-- 14. Average Revenue Per Transaction by Branch
SELECT Branch, AVG(Total) AS Avg_Transaction_Value
FROM walmart_sales
GROUP BY Branch;

-- 15. Transactions by Day of Week
SELECT strftime('%w', Date) AS Weekday, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Weekday
ORDER BY Weekday;

-- 16. Standard Deviation of Ratings by Branch
SELECT Branch, ROUND(STDDEV(Rating), 2) AS Rating_StdDev
FROM walmart_sales
GROUP BY Branch;

-- 17. Top 5 Highest Revenue Transactions
SELECT *
FROM walmart_sales
ORDER BY Total DESC
LIMIT 5;

-- 18. Payment Distribution by Customer Type
SELECT `Customer Type`, Payment, COUNT(*) AS Count
FROM walmart_sales
GROUP BY `Customer Type`, Payment
ORDER BY `Customer Type`, Count DESC;

-- 19. Highest Rated Transaction per Branch
SELECT *
FROM (
    SELECT *, RANK() OVER (PARTITION BY Branch ORDER BY Rating DESC) AS rnk
    FROM walmart_sales
) AS ranked
WHERE rnk = 1;

-- 20. Hourly Revenue Trend
SELECT strftime('%H', Time) AS Hour, SUM(Total) AS Total_Revenue
FROM walmart_sales
GROUP BY Hour
ORDER BY Hour;

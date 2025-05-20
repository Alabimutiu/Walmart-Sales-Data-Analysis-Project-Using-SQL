
# 🛍️ Walmart Sales Data Analysis Project

This project explores transactional sales data from a Walmart store using **Advanced SQL queries** to extract business insights. The dataset consists of 1,000 rows and 14 columns, simulating typical retail transactions, and was analyzed with a focus on sales performance, customer behavior, and product trends.

---

## 📂 Dataset Overview

The dataset contains the following features:

- `Invoice ID`: Unique identifier for each transaction
- `Branch`: Store branch (A, B, or C)
- `City`: City where the branch is located
- `Customer Type`: Member or Normal
- `Gender`: Male or Female
- `Product Line`: Category of product sold
- `Unit Price`: Price per unit of product
- `Quantity`: Number of items purchased
- `Tax 5%`: VAT collected on purchase
- `Total`: Total amount (including tax)
- `Date`: Date of transaction
- `Time`: Time of transaction
- `Payment`: Payment method used
- `Rating`: Customer satisfaction rating (scale of 1–10)

---

## 🎯 Business Problems Addressed

1. **Branch Performance:** Which branches generate the most revenue?
2. **Product Profitability:** What are the best and worst-performing product lines?
3. **Customer Behavior:** How do members differ from normal customers in spending?
4. **Gender Insights:** Do men or women spend more, and on what?
5. **Sales Trends:** When are peak shopping hours and days?
6. **Payment Preferences:** What methods of payment are most preferred?
7. **Customer Satisfaction:** What do ratings reveal about service and product quality?

---

## 🧰 Tools & Technologies

- **Database:** SQLite
- **Language:** SQL
- **Environment:** Jupyter Notebook, DBeaver or DB Browser for SQLite
- *(Optional visualization can be done in Power BI or Python)*

---

## 🧪 SQL Techniques Used

- Window functions (e.g., `RANK()`, `SUM() OVER`)
- Aggregations and groupings
- Subqueries and Common Table Expressions (CTEs)
- Joins and filtering
- Date and time extraction
- Statistical functions (`AVG`, `STDDEV`, `MIN`, `MAX`)

---

## 📊 Key Insights from the Data

### 🏪 Branch & City Analysis
- **Branch B** recorded the **highest total sales**, indicating a larger customer base or better-performing location.
- **Yangon** was the top-performing city.

### 📦 Product Line Performance
- **Electronic Accessories** and **Food & Beverages** were consistently top-selling categories.
- **Health & Beauty** had high customer ratings but lower total sales.

### 👥 Customer Segmentation
- **Member customers** tend to spend more per transaction than Normal customers.
- Both genders are nearly equally represented, but **female customers** had slightly higher average purchase totals.

### ⏰ Time & Day Trends
- Peak hours were between **13:00 and 15:00**, coinciding with lunchtime and early afternoon shopping.
- **Saturdays and Sundays** recorded higher average sales.

### 💳 Payment Method Trends
- **Ewallet** was the most frequently used method, followed by **Cash**.
- **Credit card** usage was the least common.

### ⭐ Customer Feedback
- Average rating across all transactions was around **7 out of 10**.
- **Branch C** had the **most consistent ratings** (lowest standard deviation), suggesting consistent service quality.

---

## 🧮  SQL Queries

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
```

---

## 📁 Project Structure

```
📦 Walmart-SQL-Project
┣ 📄 README.md
┣ 📄 walmart_sales_data.csv
┣ 📄 Walmart_Analysis.sql
┗ 📊 (Optional) dashboard.pbix / dashboard.ipynb
```

---

## 📌 How to Use

1. Clone the repository.
2. Open the SQL script in your preferred SQL tool.
3. Load the `walmart_sales_data.csv` into a database table.
4. Run queries to explore the dataset.
5. Optional: Use Power BI / Python to visualize.

---

## ✅ Conclusion

This project demonstrates how structured SQL queries can be used to extract valuable business intelligence from retail data. From sales strategy to customer segmentation, SQL is a powerful tool for understanding and optimizing business operations.

---

## 📜 License

This project is licensed under the MIT License.


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
```sql
-- 1. Total Revenue by Branch
SELECT branch, SUM(total) AS Total_Revenue
FROM walmart_sales
GROUP BY branch
ORDER BY Total_Revenue DESC;

```
```sql
-- 2. Average Spend per Customer Type
SELECT customer_type`, AVG(total) AS Avg_Spend
FROM walmart_sales
GROUP BY `customer_type`;
```
```sql
-- 3. Top Performing Cities by Revenue
SELECT city, SUM(total) AS Total_Revenue
FROM walmart_sales
GROUP BY city
ORDER BY Total_Revenue DESC;
```
```sql
-- 4. Product Line Performance (Revenue)
SELECT product_line, SUM(total) AS Total_Sales
FROM walmart_sales
GROUP BY product_line
ORDER BY Total_Sales DESC;
```
```sql
-- 5. Gender-wise Sales Analysis
SELECT gender, SUM(total) AS Total_Sales
FROM walmart_sales
GROUP BY gender;
```
```sql
-- 6. Payment Method Preferences
SELECT payment_method, COUNT(*) AS Transaction_Count
FROM walmart_sales
GROUP BY payment_method
ORDER BY Transaction_Count DESC;
```
```sql
-- 7. Average Quantity per Product Line
SELECT product_line, AVG(quantity) AS Avg_Quantity
FROM walmart_sales
GROUP BY product_line;

```
```sql
-- 8. Peak Shopping Hours
SELECT EXTRACT (HOUR FROM time) AS Hour, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Hour
ORDER BY Transactions DESC;
```
```sql
-- 9. Daily Sales Trend
SELECT date, SUM(total) AS Daily_Sales
FROM walmart_sales
GROUP BY date
ORDER BY date;
```
```sql
-- 10. Average Rating by Product Line
SELECT product_line,AVG(rating) AS Avg_Rating
FROM walmart_sales
GROUP BY product_line
ORDER BY Avg_Rating DESC;
```
```sql
-- 11. Gender-wise Average Spend
SELECT gender, AVG(total) AS Avg_Spend
FROM walmart_sales
GROUP BY gender;
```
```sql
-- 12. Running Total of Sales by Date
SELECT date, SUM(total) OVER (ORDER BY date) AS Running_Total
FROM walmart_sales;
```
```sql
-- 13. Most Sold Product Lines by Quantity
SELECT product_line, SUM(quantity) AS Total_Units_Sold
FROM walmart_sales
GROUP BY product_line
ORDER BY Total_Units_Sold DESC;
```
```sql
-- 14. Average Revenue Per Transaction by Branch
SELECT branch, AVG(total) AS Avg_Transaction_Value
FROM walmart_sales
GROUP BY branch
ORDER BY branch;
```
```sql
-- 15. Transactions by Day of Week
SELECT TO_CHAR(Date, 'Day') AS Weekday, COUNT(*) AS Transactions
FROM walmart_sales
GROUP BY Weekday
ORDER BY Weekday;
```
```sql

```
```sql

```
```sql

```
```sql

```
```sql

```
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

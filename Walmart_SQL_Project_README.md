
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

## 🧮 Sample Advanced SQL Queries

```sql
-- Running total of sales
SELECT 
    date,
    SUM(total) OVER (ORDER BY date) AS running_total
FROM walmart_sales;

-- Product performance by city
SELECT city, product_line, SUM(total) AS total_sales
FROM walmart_sales
GROUP BY city, product_line
ORDER BY city, total_sales DESC;
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

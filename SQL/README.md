# Sales Performance Analysis using SQL

## 📌 Project Overview
This project analyzes transactional sales data using SQL to uncover key business insights related to revenue trends, product performance, and branch-level performance.

The analysis focuses on answering real-world business questions using aggregation, window functions, subqueries, and feature engineering techniques.

---

## 🗂 Dataset Information
- **Table Name:** `sales`
- **Description:** Transaction-level sales data containing:
  - Invoice details
  - Product line
  - Quantity sold
  - Revenue
  - Branch and city
  - Date and time
  - Customer and payment information

---

## 🛠 Key SQL Techniques Used
- Data validation using conditional aggregation
- Feature engineering using `CASE` expressions
- Date functions (`DAYNAME`, `MONTH`, `MONTHNAME`)
- Aggregations (`SUM`, `AVG`)
- Subqueries
- Common Table Expressions (CTEs)
- Window functions (`LAG`, `RANK`, `SUM() OVER`)
- Business-driven analytical queries

---

## 📊 Business Questions Answered

### ✔ 1. What are the top-selling product lines?
Identified product lines with the highest total quantity sold.

### ✔ 2. Do high-selling products also generate the most revenue?
Compared product sales volume with total revenue contribution.

### ✔ 3. How does revenue trend over time?
Analyzed monthly revenue trends to identify seasonality.

### ✔ 4. What is the Month-over-Month (MoM) revenue growth?
Calculated MoM revenue growth using window functions.

### ✔ 5. Which branches outperform the average?
Identified branches generating revenue higher than the overall average branch revenue.

### ✔ 6. How does cumulative revenue grow over time?
Computed running total revenue to track overall growth.

### ✔ 7. Which product line performs best in each city?
Used ranking functions to determine top-performing product lines by city.

### ✔ 8. How do product lines perform relative to the average?
Classified product lines as **Good** or **Bad** based on average quantity sold.

---

## 🧠 Key Insights
- A small number of product lines contribute a significant portion of total revenue.
- High sales volume does not always translate to higher revenue.
- Revenue shows clear monthly trends and growth patterns.
- Certain branches consistently outperform others.
- Product performance varies significantly by city.

---

## 📁 Files Included
- `sales-analysis.sql` — Complete SQL analysis with queries and business logic
- `README.md` — Project documentation
---

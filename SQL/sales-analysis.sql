-- Project Title: Sales Performance Analysis

-- Objective:
-- Analyze sales data to identify top-selling products, revenue trends, and key business insights.

-- Dataset:
-- Table Name: sales
-- Description: Contains transactional sales data including date, product line, quantity sold, revenue, and customer details.

/* =====================================================
   DATA VALIDATION
   ===================================================== */

-- Check for NULL values in critical columns
SELECT
    SUM(invoice_id IS NULL) AS invoice_nulls,
    SUM(quantity IS NULL) AS quantity_nulls,
    SUM(total IS NULL) AS total_nulls
FROM sales;

/* =====================================================
   FEATURE ENGINEERING
   ===================================================== */

-- Create an enriched view for analysis
CREATE VIEW enriched_sales AS
SELECT
    *,
    CASE
        WHEN time BETWEEN '00:00:00' AND '05:59:59' THEN 'Night'
        WHEN time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    DAYNAME(date) AS day_name,
    MONTH(date) AS month_num,
    MONTHNAME(date) AS month_name
FROM sales;

/* =====================================================
   BUSINESS QUESTION 1
   ===================================================== */

-- What is the most selling product line based on quantity sold?
SELECT
    product_line,
    SUM(quantity) AS total_units_sold
FROM enriched_sales
GROUP BY product_line
ORDER BY total_units_sold DESC;

/* =====================================================
   BUSINESS QUESTION 2
   ===================================================== */

-- Does the most selling product line (by quantity) also generate the highest revenue?
SELECT
    product_line,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(total), 2) AS total_revenue
FROM enriched_sales
GROUP BY product_line
ORDER BY total_units_sold DESC;

/* =====================================================
   BUSINESS QUESTION 3
   ===================================================== */

-- What is the total revenue trend by month?
SELECT
    month_name,
    month_num,
    ROUND(SUM(total), 2) AS total_revenue
FROM enriched_sales
GROUP BY month_name, month_num
ORDER BY month_num;

/* =====================================================
   BUSINESS QUESTION 4
   ===================================================== */

-- What is the Month-over-Month (MoM) revenue growth?
WITH monthly_sales AS (
    SELECT
        month_num,
        month_name,
        ROUND(SUM(total), 2) AS revenue
    FROM enriched_sales
    GROUP BY month_num, month_name
)
SELECT
    month_name,
    revenue,
    LAG(revenue) OVER (ORDER BY month_num) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month_num)) /
        NULLIF(LAG(revenue) OVER (ORDER BY month_num), 0) * 100,
        2
    ) AS mom_growth_pct
FROM monthly_sales
ORDER BY month_num;

/* =====================================================
   BUSINESS QUESTION 5
   ===================================================== */

-- Which branches generate revenue higher than the average branch revenue?
WITH branch_revenue AS (
    SELECT
        branch,
        SUM(total) AS revenue
    FROM enriched_sales
    GROUP BY branch
)
SELECT
    branch,
    revenue
FROM branch_revenue
WHERE revenue > (SELECT AVG(revenue) FROM branch_revenue)
ORDER BY revenue DESC;

/* =====================================================
   BUSINESS QUESTION 6
   ===================================================== */

-- What is the running total of revenue over time?
SELECT
    date,
    SUM(total) AS daily_revenue,
    SUM(SUM(total)) OVER (ORDER BY date) AS running_total_revenue
FROM enriched_sales
GROUP BY date
ORDER BY date;

/* =====================================================
   BUSINESS QUESTION 7
   ===================================================== */

-- What is the top-performing product line in each city?
SELECT
    city,
    product_line,
    revenue
FROM (
    SELECT
        city,
        product_line,
        SUM(total) AS revenue,
        RANK() OVER (PARTITION BY city ORDER BY SUM(total) DESC) AS rnk
    FROM enriched_sales
    GROUP BY city, product_line
) t
WHERE rnk = 1;

/* =====================================================
   BUSINESS QUESTION 8
   ===================================================== */

-- Classify product lines as Good or Bad based on average quantity sold
SELECT
    product_line,
    CASE
        WHEN AVG(quantity) > (SELECT AVG(quantity) FROM enriched_sales)
        THEN 'Good'
        ELSE 'Bad'
    END AS performance_category
FROM enriched_sales
GROUP BY product_line;

/* =====================================================
   KEY INSIGHTS & CONCLUSION
   ===================================================== */

-- 1. Identified high-demand product lines based on unit sales.
-- 2. Observed that high-volume products do not always generate the highest revenue.
-- 3. Analyzed monthly revenue trends and calculated MoM growth to track performance.
-- 4. Benchmarked branch performance against average revenue.
-- 5. Identified top-performing products by city for localized strategy.
-- 6. Classified products into performance categories to support decision-making.

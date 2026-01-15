# E-Commerce Sales Performance Dashboard (Power BI)

## 📌 Project Overview
This Power BI dashboard analyzes e-commerce sales performance across multiple dimensions, including 
monthly trends, category contributions, product revenue, and quarter-over-quarter growth.  
The goal is to help business stakeholders quickly identify performance drivers and make data-driven decisions.

---

## 🛠 Key Features
- **Interactive KPI Cards**: YTD Sales, QTD Sales, Products Sold, MoM Growth %
- **Monthly Sales Trend Analysis**
- **Quarter-over-Quarter (QoQ) Sales Growth**
- **Category-Level Sales Contribution Analysis**
- **Top Revenue-Driving Products**
- **Dynamic Slicers** for Product Category and Year
- **Clean, modern dark-theme UI** with consistent formatting

---

## 📊 Dashboard Insights
### ✔ 1. Strong YTD Sales Performance  
YTD Sales reached **$2.18M**, with consistent monthly growth after April.

### ✔ 2. Quarterly Growth Increasing  
Q4 recorded the **highest sales**, indicating strong seasonality.

### ✔ 3. Men Shoes & Camera Categories Lead Revenue  
These categories contribute a combined **60%+** of yearly sales.

### ✔ 4. Top Products Drive Majority of Revenue  
High-end electronics and accessories dominate top-selling items.

### ✔ 5. Smooth Monthly Trend  
Sales show a stable upward trend with minor fluctuations mid-year.

---

## 🧩 Data Model
The data model follows a **star schema**:

- **Fact Table:** `Amazon_Data`
- **Dimension Table:** `date_table`
- Relationship:  
  `date_table[Date] (1) → Amazon_Data[Order Date] (*)`

This ensures proper time intelligence functions using DAX.

---

## 📐 DAX Measures Used
Key DAX expressions include:

- **Total Sales**
- **YTD Sales**
- **QTD Sales**
- **MoM Sales Change**
- **MoM Growth %**
- **Previous Month Sales**
- **YTD Sales %**

These measures support dynamic analysis across months, quarters, and categories.

---

## 🧭 Tools & Skills Demonstrated
- Power BI Desktop
- Data Modeling (Star Schema)
- DAX Calculations
- Interactive Visualizations
- Business Intelligence Reporting
- Data Cleaning & Transformation (Power Query)

---

## 📁 Files Included
- `Sales_Performance.pbix` — Full Power BI dashboard file  
- `dashboard_preview.png` — Dashboard preview image  
- `README.md` — Project documentation

---

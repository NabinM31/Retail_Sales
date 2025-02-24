#  🛍️ Retail Sales Data Analysis Project 🚀

<p align="center">
  <img src="logo.png" width="200" alt="Project Logo">
</p>

------------------------------------

## 📢 About This Project
This repository contains an **SQL-based Retail Sales Data Analysis** project. It involves analyzing sales transactions to extract meaningful insights using SQL queries. The dataset includes details about product sales, pricing, customer behavior, and revenue trends.

--------------------------------------

## 🎯 Objectives
✅ Perform data cleaning and transformation.  
✅ Analyze product sales and revenue trends.  
✅ Extract insights about customer purchase behavior.  
✅ Practice SQL queries for business intelligence.  

---

## 📂 Dataset Overview
The dataset consists of:
- 🛍️ **Product Name**
- 🏷️ **Category**
- 💰 **Price**
- 📦 **Quantity Sold**
- 📊 **Total Revenue**
- 📅 **Transaction Date**
- 👥 **Customer ID**
- 🌍 **Store Location**

---

## 🏛 Database Schema
The following schema represents the structure of the Retail Sales dataset:

```sql
CREATE TABLE retail_sales (
    transaction_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2),
    quantity_sold INT,
    total_revenue DECIMAL(10,2),
    transaction_date DATE,
    customer_id VARCHAR(50),
    store_location VARCHAR(255)
);
```

---

## 📝 Queries Included
📌 **Key SQL Queries Covered:**
- 📊 **Total Sales by Product Category**  
- 🏆 **Top-Selling Products**  
- 📈 **Sales Trends Over Time**  
- 📍 **Store-Wise Sales Analysis**  
- 💰 **Average Price Per Category**  
- 📅 **Monthly and Yearly Sales Breakdown**  
- 🛒 **Customer Purchase Behavior Analysis**  

---

## 📝 Data Analysis & Business Key Problems
----------------------------------------------------------------------------
### Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
 
#### SELECT * FROM retail_sales
#### WHERE sale_date = '2022-11-05';
------------------------------------------------
### Q.2 Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
#####        SELECT * FROM retail_sales
#####        WHERE category='Clothing' 
#####                               AND TO_CHAR(sale_date, 'YYYY-MM')='2022-11'
#####                               AND quantiy>=4;

----------------------------------------------------
### Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
##### SELECT category, SUM(total_sale) as total_sale,
##### COUNT(*)AS Total_order
##### FROM retail_sales
##### GROUP BY category
;
--------------------------------------------------------
### Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
##### SELECT category, CAST(AVG(age)AS DECIMAL(10,2))as Average_age
##### FROM retail_sales
##### WHERE category='Beauty'
##### group by category;

------------------------------------










  

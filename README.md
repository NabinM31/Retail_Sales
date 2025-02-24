#  🛍️ Retail Sales Data Analysis Project 🚀

<p align="center">
  <img src="logo.png" width="200" alt="Project Logo">
</p>

------


## 📢 About This Project
This repository contains an **SQL-based Retail Sales Data Analysis** project. It involves analyzing sales transactions to extract meaningful insights using SQL queries. The dataset includes details about product sales, pricing, customer behavior, and revenue trends.

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

## 🚀 Usage
💡 Modify and test the queries in your preferred SQL environment.  
📊 Extend the dataset by adding more sales transactions.  
⚡ Optimize queries for better performance.  








  

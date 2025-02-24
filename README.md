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
---------------------------

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05:
 ```sql
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';
```
---------------------------
2. **Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
```sql
SELECT * FROM retail_sales
WHERE category='Clothing' 
     AND TO_CHAR(sale_date, 'YYYY-MM')='2022-11'
     AND quantiy>=4;
```

----------------------------------------------------
3. **Write a SQL query to calculate the total sales (total_sale) for each category:
```sql
SELECT category, SUM(total_sale) as total_sale,
COUNT(*)AS Total_order
FROM retail_sales
GROUP BY category;
```

--------------------------------------------------------
4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:
```sql
SELECT category, CAST(AVG(age)AS DECIMAL(10,2))as Average_age
FROM retail_sales
WHERE category='Beauty'
GROUP BY category;
```
------------------------------------

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000:
``` sql
SELECT * FROM retail_sales
WHERE total_sale>1000;
```
--------------------------------------

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category:
```sql
SELECT gender,category, COUNT(transactions_id)AS total_transaction
FROM retail_sales
GROUP BY gender,category
ORDER BY category;
```
---------------------------------------
7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
```sql
SELECT * FROM
(
   SELECT
            EXTRACT('year' FROM sale_date)AS year,
	    EXTRACT('month' FROM sale_date)AS month,
            CAST(AVG(total_sale) AS DECIMAL(10,2))AS Avg_sales,
	    RANK() OVER (PARTITION BY EXTRACT('year' FROM sale_date) ORDER BY CAST(AVG(total_sale) AS DECIMAL(10,2))DESC)AS rank
FROM retail_sales
GROUP BY year,month

)
AS t1
WHERE rank=1;
```
-------------------------------------
8. **Write a SQL query to find the top 5 customers based on the highest total sales:
```sql
SELECT customer_id,
       SUM(total_sale)AS total_sales
FROM retail_sales	   
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

-----------------------------------
9. **Write a SQL query to find the number of unique customers who purchased items from each category:
```sql
SELECT category,
       COUNT(DISTINCT customer_id)as unique_custermer
FROM retail_sales
GROUP BY category;
```
-------------------------------------
10. **Write a SQL query to create each shift and number of orders:
--(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
```sql
SELECT sale_time ,
    CASE 
        WHEN EXTRACT('hour' FROM sale_time)<12 THEN 'MORNING'
        WHEN EXTRACT('hour' FROM sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
    ELSE 'EVENING'
END AS shift
FROM retail_sales;

--Common Transaction Expression

WITH hourly_sale
AS
(
SELECT sale_time ,
    CASE 
         WHEN EXTRACT('hour' FROM sale_time)<12 THEN 'MORNING'
         WHEN EXTRACT('hour' FROM sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
    ELSE 'EVENING'
END AS shift
FROM retail_sales
)

SELECT shift, COUNT(*)as total_orders
FROM hourly_sale
GROUP BY shift;
```





  

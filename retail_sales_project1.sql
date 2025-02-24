DROP TABLE IF EXISTS retail_sales;

--Create Table
CREATE TABLE retail_sales(
             transactions_id INT PRIMARY KEY,
			 sale_date	DATE,
			 sale_time	TIME,
			 customer_id	INT,
			 gender	VARCHAR(15),
			 age INT,
			 category VARCHAR(50),
			 quantiy INT,
			 price_per_unit	FLOAT,
			 cogs FLOAT,
			 total_sale FLOAT

);
SELECT * FROM retail_sales;

select count(*) AS no_of_rows from retail_sales;

--Data Cleaning
--check column if it has any null value
SELECT * FROM retail_sales
WHERE transactions_id  IS NULL

SELECT * FROM retail_sales
WHERE sale_time IS NULL

--check at once
SELECT * FROM retail_sales
WHERE transactions_id  IS NULL
      OR
      sale_time IS NULL
	  OR
	  gender IS NULL
	  OR
	  category IS NULL
	  OR
	  quantiy IS NULL
	  OR
	  price_per_unit IS NULL
	  OR
	  cogs IS NULL
	  OR
	  total_sale IS NULL;

--  3 data getting null value
--so we sre deleting
DELETE FROM retail_sales
WHERE 
	  transactions_id  IS NULL
      OR
      sale_time IS NULL
	  OR
	  gender IS NULL
	  OR
	  category IS NULL
	  OR
	  quantiy IS NULL
	  OR
	  price_per_unit IS NULL
	  OR
	  cogs IS NULL
	  OR
	  total_sale IS NULL;

--DATA EXPLORATION
--How many sales we have
SELECT COUNT(*)AS total_sale
FROM retail_sales;

--How many UNIQUE customers we have
SELECT COUNT(DISTINCT customer_id)AS total_customer
FROM retail_sales;

--How many categories we have
SELECT DISTINCT category 
FROM retail_sales; 

SELECT * FROM retail_sales;

--Data analysis & Business key problem
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

--Q.2 Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * FROM retail_sales
         WHERE category='Clothing' 
                                 AND TO_CHAR(sale_date, 'YYYY-MM')='2022-11'
                                 AND quantiy>=4;

--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) as total_sale,
COUNT(*)AS Total_order
FROM retail_sales
GROUP BY category
;

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT category, CAST(AVG(age)AS DECIMAL(10,2))as Average_age
FROM retail_sales
WHERE category='Beauty'
group by category;

--using ROUND function
SELECT category, ROUND(AVG(age),2)as Average_age
FROM retail_sales
WHERE category='Beauty'
group by category;

--Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale>1000;

--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT gender,category, COUNT(transactions_id)AS total_transaction
FROM retail_sales
GROUP BY gender,category
ORDER BY category;

--(RUN)
SELECT * FROM retail_sales;


--Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT
      EXTRACT('year' FROM sale_date)AS year,
	  EXTRACT('month' FROM sale_date)AS month,
      CAST(AVG(total_sale) AS DECIMAL(10,2))AS Avg_sales
FROM retail_sales
GROUP BY year,month
ORDER BY year,month;

SELECT
      EXTRACT('year' FROM sale_date)AS year,
	  EXTRACT('month' FROM sale_date)AS month,
      CAST(AVG(total_sale) AS DECIMAL(10,2))AS Avg_sales
FROM retail_sales
GROUP BY year,month
ORDER BY year,Avg_sales DESC; --(Avg_sales DESC indicate which month has high sales)

--giving rank
SELECT
      EXTRACT('year' FROM sale_date)AS year,
	  EXTRACT('month' FROM sale_date)AS month,
      CAST(AVG(total_sale) AS DECIMAL(10,2))AS Avg_sales,
	  RANK() OVER (PARTITION BY EXTRACT('year' FROM sale_date) ORDER BY CAST(AVG(total_sale) AS DECIMAL(10,2))DESC) AS rank
FROM retail_sales
GROUP BY year,month;

--Year wise
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

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT customer_id,
       SUM(total_sale)AS total_sales
FROM retail_sales	   
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id)as unique_custermer
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders 
--(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
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





 
-- Database: UIP_Darlytics

-- DROP DATABASE IF EXISTS "UIP_Darlytics";

CREATE DATABASE "UIP_Darlytics"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Germany.1252'
    LC_CTYPE = 'English_Germany.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False#74



-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dropping Tables

DROP TABLE IF EXISTS superstore;


-- Creating Table -superstore

CREATE TABLE IF NOT EXISTS superstore (
		row_id	INT,
		order_id	VARCHAR(50),
		order_date	DATE,
		ship_date	DATE, 
		ship_mode	VARCHAR(50),
		customer_id	VARCHAR(50),
		customer_name	VARCHAR(100),
		segment	VARCHAR(50),
		country	VARCHAR(50),
		city	VARCHAR(50),
		state_	VARCHAR(50),
		postal_code	VARCHAR(50),
		region	VARCHAR(50),
		product_id	VARCHAR(50),	
		category	VARCHAR(50),
		sub_category	VARCHAR(50),
		product_name	VARCHAR(300),
		sales	DECIMAL,
		quantity	INT,
		discount	DECIMAL,
		profit	DECIMAL
);

--To check
SELECT * FROM superstore;



-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TASK 1: Import the data into PostgreSQL. 

--To import and export datasets via table_name - PSQL Tool (window): 

Superstore
\COPY superstore from 'D:\2025\UTIVA_Internship\Superstore_SQL.csv' DELIMITER ',' CSV HEADER;


--To check
SELECT * FROM superstore;



-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TASK 2: Perform queries to filter, sort, and group data. 

----------------------------------------QUERYING----------------------------------------
-- How many entries do we have? = 9993

SELECT DISTINCT COUNT (*) FROM superstore;				


-- What Timeline? 
	-- Order_dates = 1237 days = 03/01/2014 - 30/12/2017 
	
		SELECT DISTINCT (order_date) FROM superstore
		ORDER BY order_date;

	-- Ship_dates = 1334 days = 07/01/2014 - 05/01/2018
	
		SELECT DISTINCT (ship_date) FROM superstore
		ORDER BY ship_date;


-- How many shipping modes? = 4
	--First Class, Same Day, Second Class, Standard Class
	
SELECT DISTINCT (ship_mode) FROM superstore
ORDER BY ship_mode;


-- How many distinct customers are there? = 793

SELECT COUNT(DISTINCT (customer_id)) FROM superstore;


-- How many product segments are there? = 3
	--Consumer, Corporate, Home Office
	
SELECT DISTINCT (segment) FROM superstore
ORDER BY segment;


-- How many countries? = Unites States only

SELECT DISTINCT (country) FROM superstore
ORDER BY country;



-- How many States? = 49 States of the USA

SELECT DISTINCT state_ FROM superstore
ORDER BY state_;


-- How many cities? = 531 Cities of the USA

SELECT DISTINCT city FROM superstore
ORDER BY city;


-- How many Regions? = 4
	--Central, East, South, West
	
SELECT DISTINCT region FROM superstore
ORDER BY region;


-- How many products? = 1862

SELECT DISTINCT (product_id, product_name)--, product_name 
FROM superstore
--ORDER BY product_id

		SELECT DISTINCT (product_id) 
		FROM superstore
		ORDER BY product_id

		SELECT DISTINCT (product_name) 
		FROM superstore
		ORDER BY product_name

-- How many distinct product categories are there? = 3
	--Furniture, Office Supplies, Technology
	
SELECT DISTINCT (category) FROM superstore
ORDER BY category


-- How many distinct product sub-categories are there? = 17
	--Accessories, Appliances, Art, Binders, Bookcases, Chairs, Copiers, Envelopes, Fasteners, Furnishings, Labels, Machines, Paper, Phones, Storage, Supplies, Tables

SELECT DISTINCT (sub_category) FROM superstore
ORDER BY sub_category

-- What percentage discounts are offered? = 0 - 80% discount
SELECT DISTINCT discount FROM superstore
ORDER BY discount



----------------------------------------AGGREGATION----------------------------------------

-- What is the total sales and total profit? Sales = $2,296,919.49; Net Profit = $286,409.08
	--

		SELECT ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_net_profit FROM superstore
		ORDER BY total_sales


		--Sales = $2,296,919.49; Profit = $442,528.31; Loss = -$156, 119.23; Quantity = 37,871
		
		SELECT ROUND(SUM(sales), 2) AS total_sales, 
				(SELECT ROUND(SUM(profit), 2) FROM superstore WHERE profit > 0 ) AS total_profit,
				(SELECT ROUND(SUM(profit), 2) FROM superstore WHERE profit < 0 ) AS total_loss, 
				SUM(quantity) AS total_Quantity
		FROM superstore
		ORDER BY total_sales


-- What does discount sell the quantity?
	
SELECT  *
FROM (SELECT COUNT(discount) AS numberof_discount, discount FROM superstore
GROUP BY discount
) 
ORDER BY numberof_discount DESC


-- What are the total sales by discount?
	
SELECT  *
FROM (SELECT SUM(sales) AS total_revenue, discount FROM superstore
GROUP BY sales, discount
) 
ORDER BY total_revenue DESC;


-- Who are the top 5 customers by number of transactions? =: WB-21850, JL-15835, MA-17560, PP-18955, and CK-12205 
SELECT customer_id, customer_name, COUNT(*) AS number_of_transactions FROM superstore
GROUP BY customer_id, customer_name
ORDER BY number_of_transactions DESC
LIMIT 5;


-- Who are the high-value customers i.e. top customers by total spend?

SELECT customer_id, customer_name, 
       ROUND(SUM(sales), 2) AS total_spent
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- What are the top performing Regions?
	-- The WEST made the highest sales by the amount of $725,458.4; and the highest profit by the amount of $108,418.41
	-- The EAST made the second highest in sales by the amount of $678,499.75 and in profit  by the amount of $91,534.88
SELECT region, 
       ROUND(SUM(sales), 2) AS total_Sales, 
       ROUND(SUM(profit), 2) AS total_Profit
FROM superstore
GROUP BY region
ORDER BY total_Sales DESC;


-- What are the top 5 products by number of transactions? =: Staple envelope, Easy-staple paper, Staples, Avery Non-Stick Binders, and Staples in misc. colors
SELECT product_name, COUNT(*) AS number_of_transactions FROM superstore
GROUP BY product_name
ORDER BY number_of_transactions DESC
LIMIT 5;


-- What are the top 5 products by quantity? =: Staples, Staple envelope, Easy-staple paper, Staples in misc. colors, and KI Adjustable-Height Table  
SELECT product_name, SUM(quantity) AS total_quantity FROM superstore
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 5;


-- What are the top 5 products by total revenue? 
SELECT product_name, ROUND(SUM(sales), 2) AS total_revenue FROM superstore
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- What is the top 10 best-selling product?

SELECT product_name, segment, category,
       ROUND(SUM(sales), 2) AS total_Sales
FROM superstore
GROUP BY product_name, segment, category
ORDER BY total_sales DESC
LIMIT 10;


-- Which products are unprofitable i.e products sold at loss?
SELECT product_name, category, 
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name, category
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- What are the total sales and average sales per order?
	
SELECT order_id,
		SUM(quantity) AS total_Quantity,
		ROUND(SUM(sales), 2) AS total_Sales,
		ROUND(SUM(sales/quantity), 2) AS average_Sales
FROM superstore
GROUP BY order_id, quantity, sales
ORDER BY total_Sales DESC


-- What is the average amount spent per order?

SELECT ROUND(AVG(sales), 2) AS avg_order_value
FROM superstore;


-- What is the Order frequency by Customer segment, i.e, analyze order distribution among customer segments?

SELECT segment, COUNT(order_id) AS total_orders
FROM superstore
GROUP BY segment
ORDER BY total_orders DESC;


-- What are the top 5 products by total net profit? 
SELECT product_name, SUM(profit) AS total_profit FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 5;

		-- What are the top 5 products by total profit? 
		SELECT product_name, ROUND(SUM(profit), 2) AS total_profit FROM superstore
		WHERE profit > 0
		GROUP BY product_name
		ORDER BY total_profit DESC
		LIMIT 5;
			

-- What are the bottom 5 products by total net profit? 
SELECT product_name, SUM(profit) AS total_profit FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 5;

		-- What are the top 5 products by total loss? 
		SELECT product_name, ROUND(SUM(profit), 2) AS total_profit FROM superstore
		WHERE profit < 0
		GROUP BY product_name
		ORDER BY total_profit ASC
		LIMIT 5;


-- How do different discounts impact profit margins?
SELECT discount, 
       ROUND(AVG(profit), 2) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

		-- Discounting recommendation
				SELECT discount, 
				       ROUND(AVG(profit), 2) AS avg_profit,
					   CASE
							WHEN AVG(profit) < 0
							THEN 'not recommended'
							ELSE 'recommended'
						END
				AS out_of_stock_reason
				FROM superstore
				GROUP BY discount
				ORDER BY discount

--To view order dates and shipping dates per order
SELECT order_id, order_date, ship_date   
FROM superstore
GROUP BY order_id, order_date, ship_date
ORDER BY order_date DESC;


-- What is the Sales trend over time?
	--Over 4 years (2014, 2015, 2016, 2017) timeline, the highest sale was in 2017
SELECT DATE_TRUNC('month', order_date) AS sales_month, 
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sales_month
ORDER BY sales_month DESC, total_sales DESC;


-- What is the average shipping or delivery time?
SELECT ROUND(AVG(ship_date - order_date), 1) AS avg_shipping_days
FROM superstore;


-- When was deliveries late i.e delayed shipment?
SELECT COUNT(*) AS delayed_shipments
FROM superstore
WHERE ship_date > order_date + INTERVAL '5 days';



-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TASK 3: Use subqueries and joins to calculate total revenue by category and region. 

SELECT region, category, 
       ROUND(SUM(sales), 2) AS total_revenue
FROM superstore
GROUP BY region, category
ORDER BY region, total_revenue DESC;



-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----Miscellaneous: Forecasts
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--Monthly sales trend analysis i.e. generate a time series of monthly sales, which we can later visualize

SELECT DATE_TRUNC('month', order_date) AS sales_month, 
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sales_month
ORDER BY sales_month;


--What is the 3-Month Moving Average, i.e., smooths out fluctuations by averaging sales over the last 3 months.

SELECT sales_month, 
       total_sales,
       ROUND(AVG(total_sales) OVER (ORDER BY sales_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg
FROM (
    SELECT DATE_TRUNC('month', order_date) AS sales_month, 
           ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY sales_month
) AS sales_data;



--What is the Forecast for Next Month’s Sales Using Trend, i.e., This calculates the monthly sales growth rate to estimate next month’s sales.
--To estimate next month’s sales, we can use linear regression in SQL:

WITH sales_trend AS (
    SELECT EXTRACT(YEAR FROM order_date) AS year, 
           EXTRACT(MONTH FROM order_date) AS month, 
           ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY year, month
),
trend_calculation AS (
    SELECT year, month, 
           total_sales, 
           ROW_NUMBER() OVER (ORDER BY year, month) AS time_index
    FROM sales_trend
)
SELECT year, month, total_sales,
       ROUND((total_sales - LAG(total_sales) OVER (ORDER BY time_index)) / NULLIF(LAG(total_sales) OVER (ORDER BY time_index), 0) * 100, 2) AS growth_rate
FROM trend_calculation;


--Using the monthly sales growth rate to compute the average monthly growth rate and applying it to estimate 2018 sales.
WITH sales_trend AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS year, 
        EXTRACT(MONTH FROM order_date) AS month, 
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY year, month
),
trend_calculation AS (
    SELECT 
        year, month, total_sales, 
        ROW_NUMBER() OVER (ORDER BY year, month) AS time_index
    FROM sales_trend
),
growth_rates AS (
    SELECT 
        year, month, total_sales,
        LAG(total_sales) OVER (ORDER BY time_index) AS prev_month_sales,
        ROUND(
            (total_sales - LAG(total_sales) OVER (ORDER BY time_index)) / 
            NULLIF(LAG(total_sales) OVER (ORDER BY time_index), 0) * 100, 2
        ) AS growth_rate
    FROM trend_calculation
),
average_growth AS (
    SELECT ROUND(AVG(growth_rate), 2) AS avg_growth_rate FROM growth_rates WHERE growth_rate IS NOT NULL
),
forecast_2018 AS (
    SELECT 
        year + 1 AS forecast_year, 
        month, 
        ROUND(total_sales * (1 + (SELECT avg_growth_rate FROM average_growth) / 100), 2) AS predicted_sales
    FROM sales_trend
    WHERE year = 2017
)
SELECT * FROM forecast_2018;

-------------------------------------------------------------------------------END OF PROJECT----------------------------------------------------------------------------

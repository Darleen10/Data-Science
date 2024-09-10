-- Database: 2_pizza_sales


/*--start:  Assignment 1

--Creating table 1_order_details via code

CREATE TABLE IF NOT EXISTS order_details (
	order_details_id INTEGER PRIMARY KEY,
	order_id INTEGER,
	pizza_id INTEGER,
	quantity NUMERIC
);

--Creating table 2_orders via code
CREATE TABLE IF NOT EXISTS orders (
	order_id INTEGER PRIMARY KEY,
	date DATE,
	time TIME
);

--Creating table 3_pizza_types via code
CREATE TABLE IF NOT EXISTS pizza_types (
	pizza_type_id INTEGER PRIMARY KEY,
	name VARCHAR(300),
	category VARCHAR(300),
	ingredients VARCHAR(300)
);

--Creating table 4_pizzas via code
CREATE TABLE IF NOT EXISTS pizzas (
	pizza_id INTEGER PRIMARY KEY,
	pizza_type_id INTEGER,
	size INTEGER,
	price REAL
);
--end:  Assignment 1 */


/*--To change the datatype of some columns

ALTER TABLE order_details
	ALTER COLUMN pizza_id TYPE VARCHAR;
--SELECT* FROM order_details					--To verify 

ALTER TABLE pizza_types
	ALTER COLUMN pizza_type_id TYPE VARCHAR;
--SELECT* FROM pizza_types						--To verify 

ALTER TABLE pizzas
	ALTER COLUMN pizza_id TYPE VARCHAR,
	ALTER COLUMN pizza_type_id TYPE VARCHAR,
	ALTER COLUMN size TYPE VARCHAR;			
--SELECT* FROM pizzas							--To verify		

--To verify others

--SELECT* FROM orders

--SELECT order_details_id, order_id, quantity
--FROM order_details;

--SELECT pizza_id
--FROM order_details;

--SELECT *
--FROM order_details
*/


/*
--To import and export datasets--

--Option 1: Via table_name - import/Export (Nachteil: Error message)
	

--Option 2: Via table_name - PSQL Tool (window): 

Pizzas
\COPY pizzas from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\pizzas.csv_pizzas.csv.csv' DELIMITER ',' CSV HEADER;

Pizza_types
\COPY pizza_types from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\pizza_types.csv_pizza_types.csv.csv' DELIMITER ',' CSV HEADER;

Orders
\COPY orders from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\orders.csv_orders.csv.csv' DELIMITER ',' CSV HEADER;

Order_details
\COPY order_details from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\order_details.csv_order_details.csv.csv' DELIMITER ',' CSV HEADER;

--To verify the imported data--

--SELECT* FROM pizzas

--SELECT* FROM pizza_types

--SELECT* FROM orders

--SELECT* FROM order_details
*/




-- Database: 2_pizza_sales


/*--start:  Assignment 1

--Creating table 1_order_details via code

CREATE TABLE IF NOT EXISTS order_details (
	order_details_id INTEGER PRIMARY KEY,
	order_id INTEGER,
	pizza_id INTEGER,
	quantity NUMERIC
);

--Creating table 2_orders via code
CREATE TABLE IF NOT EXISTS orders (
	order_id INTEGER PRIMARY KEY,
	date DATE,
	time TIME
);

--Creating table 3_pizza_types via code
CREATE TABLE IF NOT EXISTS pizza_types (
	pizza_type_id INTEGER PRIMARY KEY,
	name VARCHAR(300),
	category VARCHAR(300),
	ingredients VARCHAR(300)
);

--Creating table 4_pizzas via code
CREATE TABLE IF NOT EXISTS pizzas (
	pizza_id INTEGER PRIMARY KEY,
	pizza_type_id INTEGER,
	size INTEGER,
	price REAL
);
--end:  Assignment 1 */


/*--To change the datatype of some columns

ALTER TABLE order_details
	ALTER COLUMN pizza_id TYPE VARCHAR;
--SELECT* FROM order_details					--To verify 

ALTER TABLE pizza_types
	ALTER COLUMN pizza_type_id TYPE VARCHAR;
--SELECT* FROM pizza_types						--To verify 

ALTER TABLE pizzas
	ALTER COLUMN pizza_id TYPE VARCHAR,
	ALTER COLUMN pizza_type_id TYPE VARCHAR,
	ALTER COLUMN size TYPE VARCHAR;			
--SELECT* FROM pizzas							--To verify		

--To verify others

--SELECT* FROM orders

--SELECT order_details_id, order_id, quantity
--FROM order_details;

--SELECT pizza_id
--FROM order_details;

--SELECT *
--FROM order_details
*/



/*
--To import and export datasets--

--Option 1: Via table_name - import/Export (Nachteil: Error message)
	

--Option 2: Via table_name - PSQL Tool (window): 

Pizzas
\COPY pizzas from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\pizzas.csv_pizzas.csv.csv' DELIMITER ',' CSV HEADER;

Pizza_types
\COPY pizza_types from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\pizza_types.csv_pizza_types.csv.csv' DELIMITER ',' CSV HEADER;

Orders
\COPY orders from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\orders.csv_orders.csv.csv' DELIMITER ',' CSV HEADER;

Order_details
\COPY order_details from 'D:\2024\Skills\Data Science\SQL\Raw Data 1\order_details.csv_order_details.csv.csv' DELIMITER ',' CSV HEADER;

--To verify the imported data--

--SELECT* FROM pizzas

--SELECT* FROM pizza_types

--SELECT* FROM orders

--SELECT* FROM order_details
*/



--Querying, Sorting, Filtering and Grouping Data

/*--Querying
--SELECT  simple select statement
SELECT * FROM order_details								--* to return every column

SELECT pizza_id FROM order_details						--to return a specific column

SELECT category FROM pizza_types;
*/


/*
-- Aliasing with the AS statement - temporarily changes the column name to the alias
SELECT 
	name AS PizzaName,
	category AS PizzaCategory,
	ingredients AS PizzaIngredients
FROM pizza_types;
*/


/*
--DISTINCT is used in thhe SELECT statement to remove duplicate rows from a result set.
--it returns one row for each group of duplicates.

SELECT DISTINCT 
	category 
FROM pizza_types;
*/


/*--Sorting
-- ORDER BY is similar to the SORT function in excel, sorting in ASC/DESC orders
--if not specified, the default order is ASC.

--
SELECT * 
FROM pizzas
ORDER BY price DESC;

--
SELECT * FROM pizzas
ORDER BY price ASC;

--
SELECT order_id, date, time FROM orders
ORDER BY date DESC, time ASC;

--
SELECT order_id, date, time FROM orders
ORDER BY order_id;
*/


/*--Filtering
--WHERE statement is used to select rows that satisfy a specified condition 
--using its OPERATORS (comparison and logical) and WILDCARD characters.

--Strings
SELECT * FROM order_details
WHERE pizza_id = 'mexicana_l';

--Integer
SELECT * FROM order_details
WHERE order_id = 1765;

--
SELECT * FROM order_details
WHERE quantity > 1;

--
SELECT * FROM order_details
WHERE quantity < 2;

--
SELECT * FROM order_details
WHERE quantity = 3;
*/


/*--WHERE with Comparison operators

--
SELECT * FROM order_details
WHERE quantity > 1
ORDER BY quantity DESC;

SELECT * FROM order_details
WHERE quantity <= 2
ORDER BY quantity DESC;
*/

/*
SELECT * FROM order_details
WHERE quantity >= 3
ORDER BY quantity DESC;
*/

/*
SELECT * FROM order_details
WHERE quantity <> 2
ORDER BY quantity DESC;
*/

/*
SELECT * FROM order_details
WHERE quantity != 1
ORDER BY quantity ASC;
*/


/*--WHERE with Logical operators

--
SELECT * FROM order_details
WHERE quantity <> 1 AND quantity != 2
ORDER BY quantity DESC;

--
SELECT * FROM order_details
WHERE quantity <> 2 OR quantity != 3
ORDER BY quantity DESC;
*/


/*--WHERE and IN statement
--WHERE clause with IN operator (where you know what 
--you are looking for).

SELECT * FROM order_details
WHERE pizza_id
IN ('hawaiian_m', 'five_cheese_l')
ORDER BY quantity DESC;
*/


/*--WHERE and BETWEEN statement
--WHERE clause with BETWEEN operator (where you want 
--a range or dates in a specific column).

SELECT * FROM order_details
WHERE order_id BETWEEN 1 AND 10
ORDER BY order_id DESC;
*/


/*--WHERE and LIKE/ILIKE statement
--WHERE clause with the LIKE/ILIKE operators (used when you don't know the entire value you want) 
--LIKE/ILIKE use wildcards such as underscore (_) to represent single characters, 
--and Percent (%) to represent multiple characters.

--
SELECT * FROM order_details
WHERE pizza_id LIKE '_exicana_s'
ORDER BY order_id DESC;

--
SELECT * FROM order_details
WHERE pizza_id LIKE 'm%'
ORDER BY order_id DESC;

--
SELECT * FROM order_details
WHERE pizza_id LIKE 'mexicana%'
ORDER BY order_id DESC;

--
SELECT * FROM order_details
WHERE pizza_id LIKE '%ter%'
ORDER BY order_id DESC;

--
SELECT * FROM order_details
WHERE pizza_id NOT LIKE '%ter%'
ORDER BY order_id DESC;

--
SELECT COUNT (*) AS number_of_rows
FROM order_details;

--
SELECT COUNT (*) FROM order_details
WHERE pizza_id LIKE '%ter%';
*/


/*--Aggregate functions
--Aggregate functions perform a calculation on a set of rows and return a single row. 
--Its similar to PIVOT tables in Excel.

--
SELECT COUNT (quantity) AS number_of_rows,
		AVG (quantity) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details;

--
SELECT COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,				--rounding up numbers
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details;

--
SELECT COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
WHERE pizza_id = 'thai_ckn_l';										--for a specific product category
*/


/* Aggregation with GROUP BY clause
--GROUP BY clause help to filter aggregation results

--
SELECT pizza_id,
		COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
GROUP BY pizza_id;													--returns aggregates per pizza_id

--
SELECT order_id,
		COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
WHERE pizza_id = 'thai_ckn_l'										--for a specific product category
GROUP BY order_id;													--returns aggregates per order_id

--
SELECT order_id,
		COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
WHERE pizza_id = 'thai_ckn_l'										--for a specific product category
GROUP BY order_id													--returns aggregates per order_id											
ORDER BY order_id;													--returns aggregates per order_id sorted in ASC order of order_id
*/

/*Aggregation with GROUP BY clause and HAVING
--HAVING is used to filter within the GROUP BY
SELECT pizza_id,
		COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
GROUP BY pizza_id													--returns aggregates per order_id
HAVING SUM(quantity) > 200											--returns aggregates only where total quantity is greater than 200
ORDER BY pizza_id;													--returns aggregates per pizza_id sorted in ASC order of pizza_id

--
SELECT pizza_id,
		COUNT (quantity) AS number_of_rows,
		ROUND (AVG (quantity), 2) AS average_quantity,
		SUM (quantity) AS total_quantity,
		MAX (quantity) AS maximum_quantity,
		MIN (quantity) AS minimum_quantity
FROM order_details
GROUP BY pizza_id
HAVING SUM(quantity) < 200											--returns aggregates only where total quantity is less than 200
ORDER BY pizza_id;
*/

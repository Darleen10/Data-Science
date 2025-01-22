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



/*--Subqueries
--Subqueries are Nested queries. It is used to return data that will be used in the main query as a condition
--to further restrict the data to be retrieved.
Syntax:
			SELECT
				columnname_1
				columnname_2,
				SUBQUERY
			FROM
				tablename;
*/


/*--Subqueries scenario 1: Subquery in a SELECT statement
--Task: Create a table that shows pizza_id, size, and average pizza price

SELECT pizza_id, size, price,
		(SELECT AVG(price) FROM pizzas) AS AveragePrice				--this subquery returns average pizza price (from price column)
FROM pizzas																--then the main query returns all requested information
*/


/*--Subqueries scenario 2: Subquery after a FROM keyword--
--Here, the main query queries the result of the subquery
Syntax:
			SELECT *
			FROM
				(SELECT
					columnname_1
					columnname_2,

				FROM
					tablename);

--Task: Find the average price of all pizza_id that begin with the letter 't' in the pizzas table.
--subquery should have an ALIAS
SELECT AVG (price)
		
FROM (SELECT * FROM pizzas								--this subquery returns all columns where pizza_id starts with t
	 WHERE pizza_id LIKE 't%') AS subquery;			--then the main query returns the average price (from priice column) of the subquery
*/


/*--Subqueries scenario 3: Subquery in a WHERE clause--
--Task: Find the list of all pizza prices that have a higher price than the average pizza price.

SELECT *
FROM pizzas												--then the main query returns all details for where the price is greater than the result of the subquery
WHERE price > (SELECT AVG(price)FROM pizzas);			--this subquery returns the average price of all pizzas


--
--Subqueries: Subquery in a WHERE clause using the IN operator--
--Task: Find the pizza_id and price for all pizzas that sold more than 3 quantity.

SELECT pizza_id, price
FROM pizzas
WHERE pizza_id IN (SELECT DISTINCT pizza_id 
FROM order_details WHERE quantity > 3);
*/

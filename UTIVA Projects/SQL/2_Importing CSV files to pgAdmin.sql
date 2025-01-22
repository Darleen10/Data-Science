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

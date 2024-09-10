-- Database: 2_pizza_sales

--CASE STATEMENT--
--is used to write conditional logic to queries that can help you automate some operations based on a particular condition. 
--It is similar to IF/ELSE statements in programming languages or even Excel.

/*
--Syntax: 	CASE
				WHEN condition_1 THEN result_1
				WHEN condition_2 THEN result_2
				[WHEN...]
				[ELSE else_result]
			END 

--
--TO USE CASE STATEMENT--
/*

CREATE VIEW total_price_table
AS (
--semi-complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
--Case statement	
	CASE 
		WHEN p.price > 15 THEN 'Expensive'
		ELSE 'Cheap'
	END AS category
		
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);
--To verify--
SELECT * FROM total_price_table;
*/

--
DROP VIEW IF EXISTS total_price_table_1 CASCADE;
/*
CREATE VIEW total_price_table_1
AS (
--complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
	CASE 
		WHEN p.price > 20 THEN 'Expensive'
		WHEN p.price > 12 THEN 'Mid'
		ELSE 'Cheap'
	END AS category
	
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);
--To verify--
SELECT * FROM total_price_table_1;
*/

--
DROP VIEW IF EXISTS total_price_table_2 CASCADE;
/*
CREATE VIEW total_price_table_2
AS (
--complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
	CASE 
		WHEN p.price >= 20 THEN 'Expensive'
		WHEN p.price > 12 THEN 'Mid'
		ELSE 'Cheap'
	END AS category
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);
SELECT * FROM total_price_table_2;
*/


--
DROP VIEW IF EXISTS total_price_table_3 CASCADE;
/*
--NB: This example will not work because the first case statement (with the lower condition)
	--is already executed before the second case statement (with a higher condition).
	--it returns cheap for every record.
	
CREATE VIEW total_price_table_3
AS (
--complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
	CASE 
		WHEN p.price > 12 THEN 'Cheap'
		WHEN p.price >= 20 THEN 'Expensive'
		
		ELSE 'Cheap'
	END AS category
	
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);
SELECT * FROM total_price_table_3;
*/

--
DROP VIEW IF EXISTS total_price_table_4 CASCADE;
/*
CREATE VIEW total_price_table_4
AS (
--complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
	CASE 
		WHEN p.price >= 20 THEN 'Expensive'
		WHEN p.price > 12 THEN 'Mid'
		ELSE 'Cheap'
	END AS category
	
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);
SELECT * FROM total_price_table_4;
*/

--
DROP VIEW IF EXISTS total_price_table_5 CASCADE;
/*
CREATE VIEW total_price_table_5
AS (
--semi-complex query--

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price,
	
	CASE 
		WHEN p.price > 15 THEN 'Expensive'
		ELSE 'Cheap'
	END AS category,
		
	CASE 
		WHEN o.pizza_id ILIKE'h%' THEN 'Starts with H'
		ELSE NULL
	END AS h_check
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC
);

SELECT * FROM total_price_table_5;
*/

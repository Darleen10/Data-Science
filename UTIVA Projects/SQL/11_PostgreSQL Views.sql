-- Database: 2_pizza_sales

--POSTGRESQL VIEW--
--view is a virtual table in postgreSQL that holds the results of a query
--it represents the result of a complex query
--one or more undelying tables, i.e for complex queries you need often and don't
--want to rewrite from scratch, so,you can always just query the view

--Syntax: CREATE VIEW view_name AS query;

/*
--To see the total price of all the pizzas bought.
--from the order details table

SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price
	
FROM order_details AS o
LEFT JOIN pizzas AS p
ON p.pizza_id = o.pizza_id
ORDER BY o.quantity DESC;

--
--To create the view--

CREATE VIEW total_price_table AS (

	SELECT o.*, p.price,
		(o.quantity * p.price) AS total_price
	
	FROM order_details AS o
		LEFT JOIN pizzas AS p
			ON p.pizza_id = o.pizza_id
	ORDER BY o.quantity DESC
);

--
--To access the created view--

SELECT * FROM total_price_table;

--
--To drop views
--Syntax:	DROP VIEW [IF EXISTS] view_name
			[CASCADE | RESTRICT]


CREATE VIEW sum_table AS (
		SELECT pizza_id, SUM(total_price)
		FROM total_price_table
		GROUP BY pizza_id
);

--
--RESTRICT: check before dropping the view

DROP VIEW IF EXISTS total_price_table
RESTRICT

--
--CASCADE: drop a view and everything related to/dependent on the virtual table

DROP VIEW IF EXISTS total_price_table
CASCADE
*/

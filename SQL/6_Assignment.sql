-- Database: 2_pizza_sales

--Assignment --

/*
--Task 1: Find the sum of quantity of pizza ordered per pizza_id for all pizza_id starting with the letter 's'.
--order your results by the sum of quantity in descending order.

SELECT pizza_id,
		SUM(quantity) AS total_quantity
		FROM order_details
WHERE pizza_id ILIKE 's%' 
GROUP BY pizza_id


--Task 2: Write a query to show the list of pizza_id with prices higher than the average price of the pizza_id in the pizza table.

SELECT pizza_id, price
FROM pizzas
WHERE price > (SELECT AVG(price) FROM pizzas) 
*/

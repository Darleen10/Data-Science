

------------------------------QUERYING

--SELECT
SELECT * FROM actor;

SELECT first_name, last_name FROM actor;

SELECT last_name, first_name FROM actor;

SELECT * FROM city;

SELECT * FROM customer;

--CHALLENGE: We want to send out a promotional email to our existing customers. Use a SELECT statement to grab the necessary information
--ANSWER:
	SELECT first_name, last_name, email FROM customer;



--DISTINCT
SELECT DISTINCT (first_name) FROM customer;

SELECT * FROM film;

SELECT DISTINCT (release_year) FROM film;

SELECT DISTINCT (rental_rate) FROM film;

--CHALLENGE: An Australian visitor isn't familiar with MPAA moving ratings (e.g. PG, PG-13, R, etc)
			--We want to know the types of ratings we have in our database
			--use the SELECT DISTINCT statement to retrieve the distinct rating types our films could have in our database.
--ANSWER:
	SELECT DISTINCT (rating) FROM film;



--COUNT
SELECT COUNT (*) FROM film;

SELECT COUNT (*) FROM customer;

SELECT COUNT (first_name) FROM customer;

SELECT COUNT (DISTINCT (first_name)) FROM customer;

SELECT * FROM payment;

SELECT COUNT (*) FROM payment;

SELECT COUNT (amount) FROM payment;

SELECT DISTINCT (amount) FROM payment;

SELECT COUNT (DISTINCT (amount)) FROM payment;



--WHERE Clause
SELECT * FROM customer
WHERE first_name = 'Jared';

SELECT * FROM film
WHERE rental_rate > 4;

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99;

SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT (title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT (*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT (*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

SELECT * FROM film
WHERE rating != 'R';

SELECT COUNT (*) FROM film
WHERE rating != 'R';

--CHALLENGE: A customer forgot their wallet at our store.
			--We want to track down their email to inform them.
			--What is the email for the customer with the name Nancy Thomas
--ANSWER:
	SELECT email FROM customer
	WHERE first_name = 'Nancy' AND last_name = 'Thomas';


--CHALLENGE: A customer wants to know what the movie 'Outlaw Hanky' is about.
			Could you give them the description for the movie.
--ANSWER:
	SELECT description FROM film
	WHERE title = 'Outlaw Hanky';

--CHALLENGE: A customer is late on their movie return, and we've mailed them a letter to their address at
			'259 Ipoh Drive'. We should also call their phone to let them know. 
			Can you get the phone number of the customer who lives at '259 Ipoh Drive'.
--ANSWER:
	SELECT phone FROM address
	WHERE address = '259 Ipoh Drive';



--ORDER BY
SELECT * FROM customer
ORDER BY first_name;

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name ASC;



--LIMIT		
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name ASC
LIMIT 5;

SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 10;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
LIMIT 5;

--CHALLENGE: We want to reward our first ten paying customers
			What are the customer ids of the first 10 customers who created a payment.
--ANSWER:
	SELECT customer_id FROM payment
	ORDER BY payment_date ASC
	LIMIT 10;

--CHALLENGE: A customer wants to quickly rent a video to watch over their short lunch break. 
			What are the titles of the 5 shortest (in length of runtime) movies.
--ANSWER:
	SELECT title, length FROM film
	ORDER BY length ASC
	Limit 5;

--CHALLENGE: If the previous customer can watch any movie that is 50 minutes or less in runtime,
			how many options does she have.
--ANSWER:
	SELECT title, length FROM film
	WHERE length <= 50
	ORDER BY length ASC
	LIMIT 10;



--BETWEEN			
SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT (*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT COUNT (*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
*/



--IN
SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT (amount) FROM payment
ORDER BY amount ASC;

SELECT * FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT (*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT * FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT COUNT (*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');

SELECT * FROM customer
WHERE first_name NOT IN ('John', 'Jake', 'Julie');



--LIKE/ILIKE		
SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT (*) FROM customer
WHERE first_name LIKE 'J%';

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name ILIKE 's%';

SELECT COUNT (*) FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

SELECT * FROM customer
WHERE first_name ILIKE '%er%'; 

SELECT * FROM customer
WHERE first_name ILIKE '%er%' AND last_name ILIKE 's%';

SELECT * FROM customer
WHERE first_name NOT ILIKE '%er%' AND last_name ILIKE 's%';

SELECT * FROM customer
WHERE first_name NOT ILIKE '%er%' AND last_name ILIKE 's%'
ORDER BY last_name;

SELECT * FROM film
WHERE title ILIKE 'B%__'
ORDER BY title;

SELECT * FROM customer
WHERE first_name ILIKE '%a' AND last_name ILIKE 'h%';

--CHALLENGE: How many payment transactions were greater then $5.00.
--ANSWER:
	SELECT COUNT (*) FROM payment
	WHERE amount > 5;

--CHALLENGE: How many actors have a firstname that starts with the letter P.
--ANSWER:
	SELECT COUNT (*) FROM actor
	WHERE first_name ILIKE 'p%';

--CHALLENGE: How many unique districts are our customers from.
--ANSWER:
	SELECT COUNT (DISTINCT (address)) FROM address; 
	SELECT COUNT (DISTINCT (district)) FROM address;

--CHALLENGE: Retrieve the list of names for those distinct districts from the previous question.
--ANSWER:
	SELECT COUNT (first_name) FROM actor
	WHERE first_name ILIKE 'p%';

	OR

	SELECT COUNT (*) FROM actor
	WHERE first_name ILIKE 'p%';

--CHALLENGE: How many films are have a rating of R and a replacement cost between $5 and $15.
--ANSWER:
	SELECT COUNT (*) FROM film
	WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

--CHALLENGE: How many films have the word Truman somewhere in the title.
--ANSWER:
	SELECT COUNT (*) FROM film
	WHERE title ILIKE '%Truman%';




------------------------------AGGREGATION

SELECT MIN (replacement_cost) FROM film;

SELECT MAX (replacement_cost) FROM film;

SELECT AVG (replacement_cost) FROM film;

SELECT SUM (replacement_cost) FROM film;

SELECT COUNT (replacement_cost) FROM film;

SELECT ROUND (AVG (replacement_cost), 2) FROM film;

SELECT AVG (replacement_cost) FROM film;

SELECT ROUND (AVG (replacement_cost), 1) FROM film;

SELECT MIN (replacement_cost), MAX (replacement_cost) FROM film;



--GROUP BY
SELECT * FROM payment;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
ORDER BY SUM (amount);

SELECT customer_id, COUNT (amount) FROM payment
GROUP BY customer_id 
ORDER BY SUM (amount);



--GROUP BY---WHERE
SELECT customer_id, COUNT (amount) FROM payment
WHERE customer_ID BETWEEN 340 AND 342
GROUP BY customer_id 
ORDER BY SUM (amount);

SELECT customer_id, staff_id, SUM (amount) FROM payment
GROUP BY staff_id, customer_id 
ORDER BY customer_id;

SELECT customer_id, staff_id, SUM (amount) FROM payment
GROUP BY staff_id, customer_id 
ORDER BY customer_id, staff_id, SUM (amount);

SELECT payment_date FROM payment;

SELECT DATE (payment_date) FROM payment
GROUP BY DATE (payment_date);

SELECT DATE (payment_date) FROM payment
GROUP BY DATE (payment_date)
ORDER BY SUM (amount) DESC;

SELECT staff_id, COUNT (*) FROM payment
GROUP BY staff_id
ORDER BY staff_id;

--CHALLENGE: We have two staff members with staff IDs 1 and 2. We want to give a bonus to the staff member that
			--handled the most payment (processed, not in terms of dollar amount)
			--How many payments did each staff member handled and who gets the bonus.
--ANSWER:
	SELECT staff_id, COUNT (amount) FROM payment
	GROUP BY staff_id
	ORDER BY staff_id;

--CHALLENGE: Corporate HQ is conducting a study on the relationship between replacement cost and a movie MPAA rating
			--(e.g., G; PG; R; etc). What is the average replacement cost per MPAA rating?
--ANSWER:
	SELECT rating, AVG (replacement_cost) FROM film
	GROUP BY rating
	ORDER BY rating;
--OR

	SELECT rating, ROUND (AVG (replacement_cost),2) FROM film
	GROUP BY rating
	ORDER BY rating;

--CHALLENGE: We are running a promotio to reward our top 5 customers with coupons.
			--What are the customer IDs of the top 5 customers by total spend?
--ANSWER:
	SELECT customer_id, SUM (amount) FROM payment
	GROUP BY customer_id
	ORDER BY SUM (amount) DESC
	LIMIT 5;



--HAVING
SELECT customer_id, SUM (amount) FROM payment
WHERE customer_id NOT IN (184, 87, 477)
GROUP BY customer_id;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 100;

SELECT store_id,COUNT (customer_id) FROM customer
GROUP BY store_id
HAVING COUNT (*) > 300;

SELECT store_id,COUNT (customer_id) FROM customer
GROUP BY store_id
HAVING COUNT (customer_id) > 300;

SELECT store_id,COUNT (*) FROM customer
GROUP BY store_id
HAVING COUNT (*) > 300;

SELECT customer_id, COUNT (amount) FROM payment
GROUP BY customer_id
HAVING COUNT (amount) >= 40;

--CHALLENGE: We are launching a platinum service for our most loyal customers.
			--We will assign platinum status to customers that have had 40 or more transaction payments
			--What customer IDs are eligible for platinum status.
--ANSWER:
	SELECT customer_id, COUNT (*) FROM payment
	GROUP BY customer_id
	HAVING COUNT (*) >= 40;

--CHALLENGE: What are the customer IDs of customers who have spent more than $100 in payment 
			-- transaction with our staff_is member 2.
--ANSWER:
	SELECT customer_id, SUM (amount) FROM payment
	WHERE staff_id = 2
	GROUP BY customer_id
	HAVING SUM (amount) > 100;



--ASSESSMENT TEST 1

--CHALLENGE: Return the customer IDs of customers who have spent at least $110 with the staff member with an ID of 2.
--ANSWER:
	SELECT customer_id, SUM (amount) FROM payment
	WHERE staff_id = 2
	GROUP BY customer_id
	HAVING SUM (amount) >= 110;

--CHALLENGE: How many films begin with the letter J?
--ANSWER:
	SELECT COUNT (*) FROM film
	WHERE title ILIKE 'J%';

--CHALLENGE: What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
--ANSWER:
	SELECT * FROM customer
	WHERE first_name ILIKE 'E%' AND address_id < 500
	ORDER BY customer_id DESC
	LIMIT 1;



--ALIAS
SELECT amount AS rental_price FROM payment;

SELECT SUM (amount) AS net_revenue FROM payment;

SELECT COUNT (amount) AS num_transactions FROM payment;

SELECT COUNT (*) AS num_transactions FROM payment;

SELECT customer_id, SUM(amount) AS total_spent 
FROM payment
GROUP BY customer_id

SELECT customer_id, SUM(amount) AS total_spent 
FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 100;

SELECT customer_id, amount AS total_spent 
FROM payment
WHERE amount > 2;



--INNER JOIN
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id


SELECT payment_id, payment.customer_id, first_name FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id



--OUTER JOINS

--FULL OUTER JOIN
SELECT* FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS NULL  OR payment.customer_id IS NULL
--NB: No results mean such customers don't exist



--LEFT OUTER JOIN
SELECT film.film_id, film.title, inventory_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL 
		

				
--UNION
SELECT * FROM sales2021_q1
UNION
SELECT * FROM sales2021_q2
ORDER BY name;

--CHALLENGE 1: California sales tax laws have changed and we need to alert our customers to this through email
			--What are the emails of the customers who live in California?
			
--ANSWER:
	SELECT district, email FROM address
	INNER JOIN customer
	ON address.address_id = customer.address_id
	WHERE district = 'California';


--CHALLENGE 2: A customer walks in and is a huge fan of the actor "Nick Wahlberg" and wants to know which movies he is in.
			--Get a list of all the movies "Nick Wahlberg" has been in.
			
--ANSWER:
	SELECT title, first_name, last_name FROM film_actor AS fa
	INNER JOIN actor AS a
	ON fa.actor_id = a.actor_id
	INNER JOIN film AS f
	ON fa.film_id = f.film_id
	WHERE first_name = 'Nick' AND last_name = 'Wahlberg';



--SELF-JOIN
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 ON f1.film_id != f2.film_id AND f1.length = f2.length



--ADVANCED SQL COMMAND:- Overview: Timestamps and EXTRACT, Math functions, String functions, Sub-query, and Self-join 


-- Timestamps and EXTRACT
		
SHOW ALL

--To show current timezone
SHOW TIMEZONE

--To show the current timestamp
SELECT NOW()

--To show the current timestamp as a string
SELECT TIMEOFDAY()

--To show only the current time
SELECT CURRENT_TIME

--To show only the current date
SELECT CURRENT_DATE



--EXTRACT
SELECT EXTRACT (YEAR FROM payment_date) AS year FROM payment;


--AGE()
SELECT AGE (payment_date) FROM payment;


--TO_CHAR()
SELECT TO_CHAR (payment_date, 'MONTH-YYYY') FROM payment;

SELECT TO_CHAR (payment_date, 'MONTH YYYY') FROM payment;

SELECT TO_CHAR (payment_date, 'mon/dd/yyyy') FROM payment;

SELECT TO_CHAR (payment_date, 'mm/dd/yyyy') FROM payment;

SELECT TO_CHAR (payment_date, 'MM/dd/YYYY') FROM payment;

SELECT TO_CHAR (payment_date, 'MM-dd-YYYY') FROM payment;

SELECT TO_CHAR (payment_date, 'dd-MM-YYYY') FROM payment;

--CHALLENGE 1: During which months did payment occur? Format your answer to return the full month name.
			
--ANSWER:
	SELECT DISTINCT (TO_CHAR (payment_date, 'MONTH')) FROM payment;

--CHALLENGE 2: How many payments occurred on a Monday?
			--"DOW" stands for Day of the Week. It is often used in conjunction with the EXTRACT function to extract 
			--the day of the week from a date or timestamp column. Postgresql considers Sunday the start of the week (indexed at 0)  
--ANSWER:
	SELECT COUNT(*) FROM payment WHERE EXTRACT (DOW FROM payment_date) = 1;



--Mathematical functions and operations

--What percentage of replacement cost is the rental_rate

SELECT ROUND(rental_rate/replacement_cost, 2) FROM film

SELECT ROUND(rental_rate/replacement_cost, 4) * 100 AS percent_cost FROM film 

SELECT 0.1 * ROUND(rental_rate/replacement_cost, 4) AS deposit FROM film 


--String functions and operations

--LENGTH
SELECT LENGTH(first_name) FROM customer

--CONCATENATE

SELECT first_name || last_name FROM customer			--without space

SELECT first_name || '--' || last_name FROM customer

SELECT first_name || ' ' || last_name FROM customer


--UPPER

SELECT UPPER (first_name) || ' ' || last_name FROM customer

SELECT UPPER (first_name) || ' ' || UPPER (last_name) FROM customer


--LOWER

SELECT LOWER (first_name) || ' ' || UPPER (last_name) FROM customer

SELECT LOWER (first_name) || ' ' || LOWER (last_name) FROM customer


--challenge: To design a company mail with the names

SELECT first_name || last_name || '@gmail.com' FROM customer	

SELECT LOWER (first_name) || LOWER (last_name) || '@gmail.com' FROM customer


--For the first letter of the first name only

SELECT LEFT (first_name, 1) || (last_name) || '@gmail.com' FROM customer

SELECT LOWER (LEFT (first_name, 1)) || LOWER(last_name) || '@gmail.com' FROM customer



--SUBQUERY

--in WHERE
SELECT title, rental_rate 
FROM film 
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

--in WHERE---IN

SELECT film_id, title 
FROM film
WHERE film_id IN (SELECT inventory.film_id 
					FROM rental 
					INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
					WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
					ORDER BY film_id)



--EXISTS
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS (SELECT * 
				FROM payment AS p
				WHERE p.customer_id = c.customer_id AND amount > 11),


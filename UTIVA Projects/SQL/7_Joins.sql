-- Database: 4_joins


/*
Joins are used to combine columns from one or more tables based on the values of the COMMON COLUMN between related tables.
It is used to get more than one data from a table.
Common column: is the primary key in one- and foreign key in the other table.


--To create Tables and respective columns.

--Creating table 1_order_table
CREATE TABLE order_table(
	order_day VARCHAR (15),
	order_id INTEGER PRIMARY KEY,
	product_id INTEGER,
	client_id INTEGER
);


--Creating table 2_client_table
CREATE TABLE client_table(
	client_id INTEGER PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	location VARCHAR (50)
);


--Creating table 3_product_table
CREATE TABLE product_table(
	product_id INTEGER PRIMARY KEY,
	product_name VARCHAR (50),
	cost_price INTEGER,
	selling_price INTEGER
);


/* 
--To import dataset via PSQL: 

ORDER_TABLE
\COPY order_table from 'D:\2024\Skills\Data Science\SQL\Raw Data 2\orderTable.csv_orderTable.csv.csv' DELIMITER ',' CSV HEADER;

CLIENT_TABLE
\COPY client_table from 'D:\2024\Skills\Data Science\SQL\Raw Data 2\clientTable.csv_clientTable.csv.csv' DELIMITER ',' CSV HEADER;

PRODUCT_TABLE
\COPY product_table from 'D:\2024\Skills\Data Science\SQL\Raw Data 2\productTable.csv_productTable.csv.csv' DELIMITER ',' CSV HEADER;

--To verify
--SELECT * FROM order_table
--SELECT * FROM client_table
--SELECT * FROM product_table
*/



/*--INNER Joins 
--Inner Joins: select rows from both tables with a match
Common column: is the primary key in one- and foreign key in the other table.

--
SELECT order_table.*, client_table.first_name, client_table.location
FROM order_table
INNER JOIN client_table
ON client_table.client_id = order_table.client_id;

--
--Aliasing
SELECT ord.*, cli.first_name, cli.location
FROM order_table AS ord
INNER JOIN client_table AS cli
ON cli.client_id = ord.client_id;
*/



/*--OUTER Joins 
--LEFT JOIN/LEFT OUTER Joins returns everything in A and where it matches with B and where there is no match it returns null
Common column: is thhe primary key in one- and foreign key in the other table.
--Syntax: SELECT * FROM table_a A LEFT JOIN table_b B ON A.key = B.key

--
INSERT INTO order_table (order_day, order_id, product_id, client_id)
VALUES ('Sunday', 1011, 107, 105), ('Sunday', 1012, 108, 106);

--
SELECT 
	o.*, c.client_id, c.first_name, c.last_name, c.location
FROM 
	order_table AS o
LEFT JOIN 
	client_table AS c
ON 
	c.client_id = o.client_id;

--
--To add more left joins, i.e, more than one table

SELECT 
	o.*, c.client_id, c.first_name, c.last_name, c.location, p.product_name
FROM 
	order_table AS o
LEFT JOIN 
	client_table AS c
ON 
	c.client_id = o.client_id
LEFT JOIN 
	product_table AS p
ON 
	o.product_id = p.product_id;



--RIGHT JOIN/RIGHT OUTER Joins returns everything in B and where it matches with A and where there is no match it returns null
Common column: is thhe primary key in one- and foreign key in the other table.
--Syntax: SELECT * FROM table_a A LEFT JOIN table_b B ON A.key = B.key

--
INSERT INTO product_table (product_id, product_name,cost_price, selling_price)
VALUES (107, 'Pencils', 100, 120), (108, 'Rulers', 50, 70), (109, 'Paint brushes', 
150, 190), (110, 'Stencil set', 1000, 1200);

--
SELECT 
	o.order_day, o.order_id, o.product_id, 
	p.product_id, p.product_name,	p.cost_price, p.selling_price,
	(p.selling_price - p.cost_price) AS profit
FROM 
	order_table AS o
RIGHT JOIN 
	product_table p
ON 
	p.product_id = o.product_id;



--FULL JOIN/FULL OUTER Joins returns everything from both tables, whether there is a match or not, i.e, a combination of LEFT and RIGHT
Common column: is thhe primary key in one- and foreign key in the other table.
--Syntax: SELECT * FROM table_a A FULL JOIN table_b B ON A.key = B.key

--
INSERT INTO order_table (order_day, order_id, product_id, client_id)
VALUES ('Sunday', 1013, 113, 102);

--
SELECT 
	o.*, p.*
FROM 
	order_table AS o
FULL JOIN 
	product_table p
ON 
	p.product_id = o.product_id;
*/

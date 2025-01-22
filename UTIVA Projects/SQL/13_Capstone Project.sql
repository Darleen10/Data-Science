-- Database: CP_MavenToys


/*Capstone Project

--Sales & inventory data for a fictitious chain of toy stores in Mexico called Maven Toys, including information 
--about products, stores, daily sales transactions, and current inventory levels at each location.

--Write queries to answer the following questions:

1. Which product categories drive the biggest profits? Is this the same across store locations?

2. How much money is tied up in inventory at the toy stores? How long will it last?

3. Are sales being lost with out-of-stock products at certain locations?

Good luck.
*/


--TASK SOLUTIONS--
/*--To create the Tables and columns respectively
CREATE TABLE stores_stores(
	store_id INTEGER PRIMARY KEY,
	store_name VARCHAR (255),
	store_city VARCHAR (255),
	store_location VARCHAR (255),
	store_open_date DATE
);

CREATE TABLE sales(
	sales_id INTEGER PRIMARY KEY,
	date DATE,
	store_id INTEGER,
	product_id INTEGER,
	units NUMERIC
);

CREATE TABLE products_products(
	product_id INTEGER PRIMARY KEY,
	product_name VARCHAR (255),
	product_category VARCHAR (255),
	product_cost REAL,
	product_price REAL
); --This did not work, so re-create

CREATE TABLE inventory_inventory(
	store_id INTEGER,
	product_id INTEGER,
	stock_on_hand INTEGER
);

--
--To drop and re-create the products_products table—
DROP TABLE products_products;

CREATE TABLE products_products(
	product_id INTEGER PRIMARY KEY,
	product_name VARCHAR (255),
	product_category VARCHAR (255),
	product_cost VARCHAR (50),
	product_price VARCHAR (50)
);

--
--To verify the created Tables--
SELECT * FROM stores_stores;
SELECT * FROM sales;
SELECT * FROM products_products;
SELECT * FROM inventory_inventory;
*/


/*--To import Datasets

	--stores_stores
\COPY stores_stores from 'D:\2024\Skills\Data Science\SQL\Raw Data _Capstone Project\stores_stores.csv' DELIMITER ',' CSV HEADER;
   
   	--sales
\COPY sales from 'D:\2024\Skills\Data Science\SQL\Raw Data _Capstone Project\sales.csv' DELIMITER ',' CSV HEADER;
   	
	--products_products
\COPY products_products from 'D:\2024\Skills\Data Science\SQL\Raw Data _Capstone Project\products_products.csv' DELIMITER ',' CSV HEADER;
   	
	--inventory_inventory
\COPY inventory_inventory from 'D:\2024\Skills\Data Science\SQL\Raw Data _Capstone Project\inventory_inventory.csv' DELIMITER ',' CSV HEADER;

--
--To verify the imported Datasets--
SELECT * FROM stores_stores;
SELECT * FROM sales;
SELECT * FROM products_products;
SELECT * FROM inventory_inventory;
*/


/*Capstone Project Objective: Analyze sales and inventory data for a fictitious chain of toy stores in Mexico called Maven Toys, with 
								information	about products, stores, daily sales transactions, and current inventory levels.*/


/*
MY Q1 SOLUTION:

-----------------------------------------------------------------------------------------------------
--Redefining the product_cost and product_price: To convert the varchar columns to numeric for use--
	--CAST ((REPLACE (product_cost, '$', '')) AS NUMERIC) AS productcost, 
	--CAST ((REPLACE (product_price, '$', '')) AS NUMERIC) AS productprice

--To calculate the cost and selling prices--
CAST ((REPLACE (product_cost, '$', '')) AS NUMERIC) * units AS total_costprice,
CAST ((REPLACE (product_price, '$', '')) AS NUMERIC) * units AS total_sellingprice
--------------------------------------------------------------------------------------------------------


--TASK 1
--SELECT DISTINCT (product_category) FROM products_products;
	--Returns the 5 product categories: Art & Crafts, Games, Toys, Electronics, Sports & Outdoors

--
--Task 1a: Which product categories drive the biggest profit?
SELECT (p.product_category), 
	SUM(
		((CAST ((REPLACE (p.product_price, '$', '')) AS NUMERIC)) 
		 - (CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC))
		 )* s.units) AS totalprofit_per_productcategory
FROM products_products AS p
INNER JOIN sales AS s
	ON s.product_id = p.product_id
GROUP BY p.product_category
ORDER BY totalprofit_per_productcategory DESC, p.product_category;

--Product Categories Driving Profits:
--Answer: Toys ($ 1,079,527.00)


--
--SELECT DISTINCT (store_location) FROM stores_stores;
	--Returns the 4 store locations: Downtown, Residential, Airport, Commercial

---------------
--Task 1b: --Is this the same across store locations?
SELECT (product_category), store_location, highestprofit
FROM (
	SELECT product_category, store_location, MAX(totalprofit) AS highestprofit,
		ROW_NUMBER() OVER (PARTITION BY store_location ORDER BY totalprofit DESC) 
AS profit_rank
	FROM(
		SELECT ss.store_location, (p.product_category), 
		SUM(			
			((CAST ((REPLACE (p.product_price, '$', '')) AS NUMERIC)) 
			 - (CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC)))
			 * s.units)	AS totalprofit

		FROM products_products AS p
			INNER JOIN sales AS s
				ON s.product_id = p.product_id
			INNER JOIN stores_stores AS ss
				ON ss.store_id = s.store_id
		GROUP BY ss.store_location, p.product_category
	           ) AS profits_per_storelocation
GROUP BY store_location, product_category, totalprofit
) AS ranked_profits
WHERE profit_rank = 1
ORDER BY highestprofit DESC;


--Answer:  No, not at all store locations
		-- TOYS drive the biggest profit at Downtown and Residential store locations, while 
		-- ELECTRONICS drive the biggest profit at Commercial and Airport store locations
*/
--------------------------------------------------------------------------------------------------------


/*
MY Q2 SOLUTION:

--TASK 2
--Task 2a: How much money is tied up in inventory at the Toy stores?

--Capital Money tied in inventory at all Maven Toy stores--
SELECT	SUM((CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * stock_on_hand))
		AS capitalmoney_tied_in_inventory
FROM inventory_inventory AS ii
LEFT JOIN products_products AS p
		ON p.product_id = ii.product_id;

--Inventory Valuation and Duration:
	--Answer:  Capital money tied in stock is $ 300,209.58


--Profit tied in inventory at all Maven Toy stores--
SELECT	SUM((CAST ((REPLACE (p.product_price, '$', '')) AS NUMERIC) * stock_on_hand) 
		- (CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * stock_on_hand))
		AS profit_tied_in_inventory
FROM inventory_inventory AS ii
LEFT JOIN products_products AS p
		ON p.product_id = ii.product_id;

--Inventory Valuation and Duration:
	--Answer:  Profit tied in stock is $ 110,031.00


---------------
--Capital tied in inventory for 'Toys' product category--
SELECT 
		SUM(CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * ii.stock_on_hand)
		AS capitalmoney_tied_in_inventory
		
FROM inventory_inventory AS ii
LEFT JOIN products_products AS p
		ON p.product_id = ii.product_id
LEFT JOIN stores_stores AS ss
		ON ss.store_id = ii.store_id
WHERE product_category = 'Toys';

--Toys Inventory Valuation and Duration:
	--Answer: Capital tied in stock is $ 99,861.47


--Profit tied in inventory for 'Toys' product category--
SELECT	SUM((CAST ((REPLACE (p.product_price, '$', '')) AS NUMERIC) * stock_on_hand) 
		- (CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * stock_on_hand))
		AS profit_tied_in_inventory
FROM inventory_inventory AS ii
LEFT JOIN products_products AS p
		ON p.product_id = ii.product_id
WHERE product_category = 'Toys'

--Toys Inventory Valuation and Duration:
	--Answer: Profit tied in stock is $ 32,246.00


---------------
--Task 2b: How long will it last?

--Capital tied in inventory for 'Toys' product category--
--If it takes a1 days to sell b1 units of capital c1
--how long (a2 days) does it take to sell b2 in-stock of capital c2
--solution is either (b2*a1)/b1 OR (c2/c1)

SELECT 
ii.store_id, ii.product_id, ii.stock_on_hand,

	ROUND((SUM(CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * stock_on_hand)/
		SUM(CAST ((REPLACE (p.product_cost, '$', '')) AS NUMERIC) * units)), 1)
		AS how_long_stockonhand_lasts,
		
CONCAT( 'It will last for', ' ', ROUND(AVG(ii.stock_on_hand)/ (SUM(s.units)/COUNT (s.date)),0), ' ', 'days') 
		AS decision
FROM inventory_inventory AS ii
LEFT JOIN sales AS s
		ON s.product_id = ii.product_id
LEFT JOIN products_products AS p
		ON p.product_id = ii.product_id
GROUP BY ii.store_id, ii.product_id,ii.stock_on_hand,p.product_cost
ORDER BY ii.store_id, ii.product_id;
*/
--------------------------------------------------------------------------------------------------------


/*
MY Q3 SOLUTION:

--Task 3: Are sales being lost with out_of_stock products at certain locations?

--Considerations: Where stock_on_hand is either zero or lower than the demand

--To check all stock_on_hand and units per store per product--	
SELECT ii.store_id, ii.product_id, ii.stock_on_hand,
				SUM(s.units) AS units_sold
		
		FROM sales AS s 
			RIGHT JOIN inventory_inventory ii 
					ON s.store_id = ii.store_id AND s.product_id = ii.product_id
			LEFT JOIN products_products AS p 
					ON s.product_id = p.product_id
	--WHERE ii.stock_on_hand IS NULL OR ii.stock_on_hand = 0 OR ii.stock_on_hand < s.units
		GROUP BY ii.store_id, ii.product_id, ii.stock_on_hand
		ORDER BY ii.store_id, ii.product_id, units_sold DESC
		
--To check where sales are being lost due to out-of-stock products per store--	
	SELECT ii.store_id, p.product_name, ii.product_id, ii.stock_on_hand,
				SUM(s.units) AS units_sold, 
				
		CASE
			WHEN ii.stock_on_hand = 0
			THEN 'not in stock, sales is lost'
			ELSE 'higher demand than in stock, sales is lost'
		END
		AS out_of_stock_reason
		
		FROM sales AS s 
			RIGHT JOIN inventory_inventory ii 
					ON s.store_id = ii.store_id AND s.product_id = ii.product_id
			LEFT JOIN products_products AS p 
					ON s.product_id = p.product_id
		WHERE ii.stock_on_hand IS NULL OR ii.stock_on_hand < s.units
		GROUP BY ii.store_id, ii.product_id, ii.stock_on_hand, p.product_name
		ORDER BY ii.store_id, ii.product_id, units_sold DESC;

--Sales Impact Due to Stockouts:
--Answer: Sales are lost at locations where the stock levels are (zero or) insufficient to meet demand, particularly for highly 
		  sought-after products. This means that the supply at these locations cannot keep up with customer demand.
*/























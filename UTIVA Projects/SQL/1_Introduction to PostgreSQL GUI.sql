-- Database: 1_Testdb

--Two way to create a database
	-- Via GUI 
	--Code

-- Create database 1_Testdb via GUI; -- Create Tables (under schemas). Name columns and set datatypes. NB: The values in a column should be of same datatype


-- Creating database via code 

	/* 	Syntax: CREATE TABLE [IF NOT EXISTS] table_name (
			column1 DATATYPE(length) column_constraint,
			column2 DATATYPE(length) column_constraint,
			...
			columnn DATATYPE(length) column_constraint,
			table_contraints 
			)					*/


/*--Creating table 1_accounts via code (using the 1_Testdb query tool)

CREATE TABLE IF NOT EXISTS accounts (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
); 
--NB: in this table, the user_id is the primary key*/


/*--Creating table 2_roles via code (using the 1_Testdb query tool)

CREATE TABLE IF NOT EXISTS roles (
	role_id SERIAL PRIMARY KEY,
	role_name VARCHAR(255) UNIQUE NOT NULL
); 
--NB: in this table, the role_id the a primary key*/


/*--Creating table 3_account_roles via code (using the 1_Testdb query tool)

CREATE TABLE IF NOT EXISTS account_roles (
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	grant_date TIMESTAMP,
	PRIMARY KEY (user_id, role_id),
	FOREIGN KEY(role_id) REFERENCES roles (role_id),
	FOREIGN KEY (user_id) REFERENCES accounts (user_id)
);
--NB: in this table, the user_id and role_id are primary keys, however they are individually, foreign key */


/*--Creating table 4_customer via code (using the 1_Testdb query tool)

CREATE TABLE IF NOT EXISTS customer (
	customer_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	age INT NOT NULL
);


--Inserting Values into table 4_customer via code (using the 1_Testdb query tool)

INSERT INTO customer ( customer_id, first_name, last_name, age) VALUES 
(1, 'David', 'Benjamin', 24);

SELECT * FROM customer;										--to check


INSERT INTO customer (first_name, last_name, age) VALUES 
('Mary', 'Eniola', 26), ('David', 'Thomas', 30);
SELECT * FROM customer;										--to check
*/

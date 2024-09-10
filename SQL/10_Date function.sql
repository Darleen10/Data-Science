-- Database: 6_data_cleaning

-- DATE FUNCTION--

--PostgreSQL stores date in the format yyyy-mm-dd
--the format is also used when inserting data into a date column

/*
CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR (255),
	last_name VARCHAR (355),
	birth_date DATE NOT NULL,
	hire_date DATE NOT NULL
);

INSERT INTO employees (first_name, last_name, birth_date, hire_date)
VALUES ('Shannon', 'Freeman', '1980-01-01', '2005-01-01'), 
		('Sheila', 'Wells', '1978-02-05', '2003-01-01'), 
		('Ethel', 'Webb', '1975-01-01', '2001-01-01');

SELECT * FROM employees;
*/


/*
--To get the CURRENT DATE

SELECT NOW () :: date;

--
--To get the CURRENT TIME
SELECT NOW () :: time;

--
--To get the CURRENT TIMESTAMP
SELECT NOW () :: timestamptz;

--
--To output selected date to another format
SELECT TO_CHAR (NOW () :: date, 'dd/mm/yyyy');

--
SELECT TO_CHAR (NOW () :: date, 'dd-mm-yy')

--
--To get intervals between dates--
SELECT first_name, last_name, hire_date,
		NOW() - hire_date AS duration,
		NOW() - birth_date AS age
FROM employees;
*/


--For relatable time periods
/*--AGE function

--AGE():compares the specified date to the current date and subtracts that (specified) date from the current date
--and then returns the dates that have passed in years, months, and days


SELECT first_name, last_name, birth_date,
		AGE(birth_date) AS employees_age,
		AGE(hire_date) AS duration_of_employment
FROM employees;
*/


/*--EXTRACT function
--To extract (year, month, or day) from a particular date

SELECT first_name, last_name, birth_date,
		EXTRACT(YEAR FROM birth_date) AS birth_year,
		EXTRACT(MONTH FROM birth_date) AS birth_month,
		EXTRACT(DAY FROM birth_date) AS birth_day
FROM employees;
*/

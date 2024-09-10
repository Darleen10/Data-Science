-- Database: 6_data_cleaning

--DATA CLEANING--
--Clean data is not always attainable in real life.
--Dirty data are not fit for analysis since they can contain spaces or null values.
--To cleans data: modify strings by trimming, concartenate strings, change cases, 
--use the substring function, work with dates and time fields, work with text strings.

/*
--String functions are used for manipulating strings.

--CONCAT(): combines two ore more strings into one string
--entry characters should be CHAR, VARCHAR, NCHAR.

--
CREATE TABLE string_manupulation(
	first_name VARCHAR (40),
	last_name VARCHAR (40),
	course_code VARCHAR (40),
	phone_number BIGINT,
	card_number VARCHAR (40),
	gender VARCHAR (40),
	address VARCHAR (100)
);

--
ALTER TABLE string_manupulation RENAME TO string_manipulation;

--
--To import dataset--

String manipulation
\COPY string_manipulation from 'D:\2024\Skills\Data Science\SQL\Raw Data 3\string_manipulation_string_manipulation.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM string_manipulation;

--
--CONCAT function
SELECT first_name, last_name,
	CONCAT (first_name, ' ', last_name) AS full_name
FROM string_manipulation;

--
SELECT first_name, last_name,
	CONCAT (first_name, ' lives in ', address) AS sentence
FROM string_manipulation;

--
SELECT first_name, last_name,
	CONCAT (first_name, ' ', last_name) AS full_name,
	CONCAT (first_name, ' lives in ', address) AS sentence
FROM string_manipulation;
*/


/*
--REPLACE function: to search and then replace a string in a column
--Syntax: SELECT
				REPLACE (source_column, 'old_text', 'new_text') AS newField
			FROM
				table_name;

--
--Stella just got married and changed her surname 
SELECT first_name, last_name,
	REPLACE (last_name, 'Eze', 'Dayo') AS new_last_name
FROM string_manipulation;
*/


/*
--UPPER function: to convert strings to upper cases
--LOWER function: to convert strings to lower cases
--Syntax: SELECT
				UPPER (string) AS newField
			FROM
				table_name;


SELECT first_name, last_name,
	UPPER (first_name) AS capitalized_first_name,
	LOWER (last_name) AS small_letter_last_name
FROM string_manipulation;
*/


/*
--LENGTH() function: returns the number of characters in a string column
--Syntax: SELECT
				LENGTH (string) AS newField
			FROM
				table_name;


SELECT first_name, last_name, gender,
	LENGTH (first_name) AS length_of_first_name,
	LENGTH (last_name) AS length_of_last_name,
	LENGTH (gender) AS length_of_gender
FROM string_manipulation;
*/

/*-- To remove white spaces
--TRIM() function: to remove the longest string containing a character from the start, end, or both the start and end of a string.
--used on CHAR, VARCHAR, and text
--LTRIM() function: trims spaces from the beginning of a string
--RTRIM() function: trims spaces from the end of a string
--BTRIM() function: trims spaces from both the beginning and end of a string.
--Syntax: SELECT
				LTRIM/RTRIM/BTRIM (string) AS newField
			FROM
				table_name;

--
--LEFT Trim
SELECT first_name, last_name, gender,
	LENGTH (gender) AS length_of_gender,
	LTRIM (gender) AS leftTrim,
	LENGTH(LTRIM(gender)) AS length_afterTrim
FROM string_manipulation;

--
--RIGHT Trim
SELECT gender,
	LENGTH (gender) AS lengthBeforeTrim,
	--LTRIM (gender) AS leftTrimmed,
	--LENGTH(LTRIM(gender)) AS lengthAfterTrim,
	RTRIM (gender) AS rightTrimmed,
	LENGTH(RTRIM(gender)) AS lengthAfterRTrim
FROM string_manipulation;

--
--LEFT and RIGHT Trim
SELECT gender,
	LENGTH (gender) AS lengthBeforeTrim,
	--LTRIM (gender) AS leftTrimmed,
	--LENGTH(LTRIM(gender)) AS lengthAfterTrim,
	--RTRIM (gender) AS rightTrimmed,
	--LENGTH(RTRIM(gender)) AS lengthAfterRTrim,
	BTRIM (gender) AS bothTrimmed,
	LENGTH(BTRIM(gender)) AS lengthAfterBTrim
FROM string_manipulation;
*/


/*SUBSTRING functions: 
--SUBSTR(): retuns a part of a string.
--LEFT(): returns the first n characters, i.e,from the left direction
--RIGHT(): returns the laast n characters
-- Syntax: SELECT 
				(column_name, start_position,length)
			FROM 
				table_name;


/*
SELECT * FROM string_manipulation;


--To EXTRACT various part of a string
--NB: comma and spaces are also characters
--SUBSTR() function
	SELECT 
		address,
		SUBSTR(address, 9, 5) AS state_of_residence
	FROM 
		string_manipulation;
				
--LEFT() function		
SELECT 
		address,
		SUBSTR(address, 9, 5) AS state_of_residence,
		LEFT(address, 6) AS city								--returns the first n characters from LHS
	FROM 
		string_manipulation;

--RIGHT()function
SELECT 
		address,
		SUBSTR(address, 9, 5) AS state_of_residence,
		LEFT(address, 6) AS city,
		--to remove the fullstop,use REPLACE with nothing
		REPLACE(RIGHT(address, 8),'.', '') AS country
	FROM 
		string_manipulation;
*/

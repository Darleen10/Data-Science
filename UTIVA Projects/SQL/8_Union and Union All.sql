-- Database: 5_union

--UNION and UNION all

--Unions is used to combine the result-set of two or more SELECT statements
--UNION selects only distinct values
--UNION ALL returnns everything including duplicates
--the columns muust have the same datatype
--and they must be in the same order (column order)

/*--z.B: A teacher taking classes with 3 students per month

CREATE TABLE january_class(
	name VARCHAR (40),
	student_number INTEGER,
	score INTEGER
);


CREATE TABLE february_class(
	name VARCHAR (40),
	student_number INTEGER,
	score INTEGER
);

--
--To import dataset via PSQL: 
JANUARY CLASS
\COPY january_class from 'D:\2024\Skills\Data Science\SQL\Raw Data 2\january_class.csv_january_class.csv.csv' DELIMITER ',' CSV HEADER;

--SELECT * FROM january_class

--To insert dataset: FEBRUARY CLASS
INSERT INTO february_class (name, student_number, score)
VALUES ('John Thomas', 111, 80), ('Bruce Wayne', 114, 82), ('Paul Rivers', 115, 60);

--SELECT * FROM february_class


--
--UNION
--returns distinct
SELECT * FROM january_class
UNION
SELECT * FROM february_class

--
--UNION ALL--
--returns all (with duplicates)
SELECT * FROM january_class
UNION ALL
SELECT * FROM february_class

--NB:
--This example gives error message because they are not in the same order
SELECT name, student_number, score FROM january_class
UNION ALL
SELECT score, name, student_number FROM february_class

--Rather this works:Lesson is -the order should always be the same
SELECT score, name, student_number FROM january_class
UNION ALL
SELECT score, name, student_number FROM february_class
*/
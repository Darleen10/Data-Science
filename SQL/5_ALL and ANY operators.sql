-- Database: 3_university

/*

--Creating table 1_lecturer
CREATE TABLE IF NOT EXISTS lecturer (
	name VARCHAR (40),
	age INTEGER
);

--Creating table 2_student
CREATE TABLE IF NOT EXISTS student (
	name VARCHAR (40),
	age INTEGER
);

--
INSERT INTO lecturer (name,age)
VALUES ('Jane Smith', 43) ,('Tobi Joseph', 52) , ('Chuks Eze', 51), ('Charles Harry', 35), ('Adamu Alli', 40);

SELECT * FROM lecturer

--
INSERT INTO student (name,age)
VALUES ('Yemi Jack', 20) ,('Johnson Rivers', 21) , ('Sandra James', 19), ('Emeka Paul', 37), ('Chinedu Stephen', 57);

SELECT * FROM student;
*/


/*
--ALL and ANY operators

--ALL operator: to compare the main query with the subquery
--Task: Is there a student older than all the lecturers
SELECT * FROM student
WHERE age > ALL (SELECT age FROM lecturer);

--
--Task: Is there a student older than any of the lecturers
SELECT * FROM student
WHERE age > ANY (SELECT age FROM lecturer);
*/

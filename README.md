 Introduction:
This project is a concise summary of essential PostgreSQL concepts. It covers database schemas, key relationships, SQL clauses, and aggregate operations with practical examples. It's designed as a quick reference and learning aid for beginners.

1.What is PostgreSQL?
ANS: PostgreSQL is a powerful,open-source object-relational database management system (ORDBMS).it supports advanced data types, full acid compliance, and is known for its robustness, scalability, and standards compliance.it is widely used for web, mobile, and analytical applications.

2.What is the purpose of a database schema in PostgreSQL?
ANS: A schema in postgreSQL is a logical container for database object like tables, views,indexes, and functions. it helps organize and group objects to avoid name conflicts and manage permissions effectively. its like having folders inside a database.

3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
ANS:A Primary Key - uniquely identifies each row in a table. It must be unique and not null.

A Foreign Key - creates a relationship between two tables. It refers to the primary key of another table to ensure referential integrity between them.

4.What is the difference between the VARCHAR and CHAR data types?
ANS:VARCHAR(n) - stores variable-length strings up to n characters. It uses only the required space.

CHAR(n)- stores fixed-length strings of exactly n characters, padding with spaces if needed.

VARCHAR - is more flexible and commonly used. 

5.Explain the purpose of the WHERE clause in a SELECT statement.
ANS: The WHERE clause filters rows based on a given condition in a SELECT query. Only the rows that satisfy the condition will be returned. It is used to narrow down the result set.
Example: Select * From users Where 1ge >18;

6.What are the LIMIT and OFFSET clauses used for?
ANS:LIMIT - restricts the number of rows returned by a query.
OFFSET - skips a number of rows before starting to return results.
Useful for pagination:
Select * From Products Limit 10 Offset 20;

7.How can you modify data using UPDATE statements? 
ANS:You can modify existing data in a table using the UPDATE statement, combined with a WHERE clause to target specific rows.
Example:
UPDATE employees SET salary = salary + 500 WHERE department = 'Sales';

8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
ANS: JOIN is used to combine rows from two or more tables based on related columns. The most common is INNER JOIN, which returns rows that have matching values in both tables.
Example:SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id;

9.Explain the GROUP BY clause and its role in aggregation operations.
ANS:GROUP BY groups rows with the same value in specified columns. It’s used with aggregate functions (SUM, COUNT, etc.) to perform calculations per group.
Example:SELECT department, COUNT(*) FROM employees GROUP BY department;

10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

ANS:PostgreSQL provides aggregate functions to summarize data:
COUNT() returns the number of rows.
SUM() adds numeric values.
AVG() calculates the average.
Example:
SELECT COUNT(*), SUM(salary), AVG(salary) FROM employees;
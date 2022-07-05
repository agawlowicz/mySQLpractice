USE sql_store;

SELECT *
FROM customers
-- WHERE customer_id = 1
ORDER BY first_name;

-- returns columns in order as called with SELECT
SELECT 
	last_name,
    first_name,
    points,
    (points + 10) * 100 AS 'discount factor'
-- order of operators, parentheses can add clarity to code
-- AS to alias for column name
FROM customers;

-- unique states
SELECT DISTINCT state
FROM customers;

-- WHERE clause to filter data
SELECT * FROM customers
WHERE points > 3000;

SELECT *
FROM customers
WHERE state = 'VA';
-- or WHERE state = 'va' casing does not matter 

-- <> is NOT EQUAL operator
SELECT * FROM customers
WHERE state <> 'va';

 SELECT * FROM customers
 -- born after Jan 1, 1990
 WHERE birth_date > '1990-01-01';
 
 -- operators: AND, OR, NOT
 SELECT * FROM customers
 WHERE birth_date > '1990-01-01' AND points > 1000;
 
 SELECT * FROM customers
 WHERE birth_date > '1990-01-01' OR points > 1000;
 
 -- born in or after 1990 or lives in VA with more than 1000 points
 -- (birth_date) OR (points AND state)
 -- AND operator is evaluated first
 SELECT * FROM customers
 WHERE birth_date > '1990-01-01' OR
	points > 1000 AND state = 'VA';
 -- logical operators order: AND, OR,
 
 SELECT * FROM customers
 -- born before 1990 and have less than 1000 points
 -- > becomes <=, OR becomes AND, points <= 1000
 WHERE NOT (birth_date > '1990-01-01' OR points > 1000);
 -- negation: WHERE birth_date <= '1990-01-01' AND points <= 1000
 
 SELECT * FROM customers
 -- WHERE state = 'VA' OR state = 'GA' or state = 'FL';
 -- IN compares attribute with values in parentheses
 WHERE state IN ('VA', 'FL', 'GA');
 -- negation: WHERE state NOT IN ('VA', 'FL', 'GA')
 
 SELECT * FROM customers
 -- WHERE points >= 1000 AND points <= 3000;
 -- BETWEEN with range values inclusive
 WHERE points BETWEEN 1000 AND 3000;
 
 SELECT * FROM customers
 -- last_name starts with 'b', casing doesn't matter
 -- WHERE last_name LIKE 'b%';
 -- last name has b anywhere
 WHERE last_name LIKE '%b%';
 
 SELECT * FROM customers
 -- last name exactly 6 characters that ends with y
 -- WHERE last_name LIKE '_____y';
 WHERE last_name LIKE 'b____y';
 
 -- % any number of characters
 -- _ single character
 
 SELECT * FROM customers
 -- WHERE last_name LIKE '%field%';
 -- REGEXP regular expression, search for more complex patterns, don't have to type out %
 -- WHERE last_name REGEXP 'field';
 -- '^field' ^ starts with
 -- 'field$' $ ends with
 -- | or, multiple search patterns
 WHERE last_name REGEXP '^field|mac|rose';
 -- above starts with field
 -- WHERE last_name REGEXP 'field$|mac|rose' ends with field or has mac or rose
 
 SELECT * FROM customers
 -- e in last name with a g or i before it
 -- WHERE last_name REGEXP '[gim]e';
 -- [] give patterns of: ge, ie, or me
 -- e[fmq] give patterns of: ef, em, eq
 -- [a-h] range of a-h
 WHERE last_name REGEXP '[a-h]e';
 
 -- REVIEW
 -- ^ beginning, $ end, | logical or, [abcd] match any single character in brackets, [a-f] range
 
 SELECT * FROM customers
 -- WHERE phone IS NULL;
 WHERE phone IS NOT NULL;
 
 SELECT first_name, last_name, 10 AS points
 FROM customers
 ORDER BY birth_date;
 
 SELECT * FROM customers
 -- offset: skip first 6 records, then return 3 records, returns customers 7, 8, 9
 LIMIT 6, 3;
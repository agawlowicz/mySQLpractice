USE sql_store;

-- same column in multiple tables must be qualified with prefix of table
SELECT order_id, o.customer_id, first_name, last_name
-- alias table
FROM orders o
-- combine columns with customers table
-- INNER JOIN is JOIN, INNER is optional keyword
JOIN customers c
	ON o.customer_id = c.customer_id;

-- join tables across databases, prefix table (not part of current db) name with db name
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id;

-- query will be different depending on current database
USE sql_inventory;
SELECT *
FROM sql_store.order_items oi
JOIN products p
	ON oi.product_id = p.product_id;

-- join table with itself, self join 
-- select name of each employee and manager
USE sql_hr;
-- prefix each coloumn
SELECT e.employee_id,
	e.first_name,
	m.first_name AS manager
FROM employees e
-- have to use different alias
JOIN employees m
	ON e.reports_to = m.employee_id;

-- join multiple tables
USE sql_store;

SELECT
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;
    
-- compound join conditions, with composite primary keys
SELECT *
FROM order_items oi
JOIN order_item_notes oin
-- compound join condition, multiple conditions to join these two tables
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;
    
-- explicit join syntax
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
-- implicit join syntax, without where clause gives cross join 
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id;

-- LEFT JOIN
-- All records FROM left table are returned whether condition is true or not
-- records for all customers whether they have an order or not, if no order the value is NULL
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT OUTER JOIN orders o
	ON c.customer_id = o.customer_id; 

-- outer joins between multiple tables
SELECT
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
-- outer join, all customers whether they have an order or not
-- customers without orders have null value for order id 
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
-- all orders whether they have been shipped or not
-- order that have been shipped have a name in shipper coloumn, else NULL
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- self outer joins
USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
-- to return manager who reports_to null
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;
    
USE sql_store;

-- USING keyword
SELECT
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
-- ON o.customer_id = c.customer_id;
-- if coloumn name is exactly the same across both tables, can replace ON clause with USING
	USING (customer_id)
LEFT JOIN shippers sh
	USING (shipper_id);

SELECT *
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id, product_id);
-- 	ON oi.order_id = oin.order_id
--    AND oi.product_id = oin.product_id;

-- natural joins, not recommended, database engine guesses, joins based on common coloumns, can produce unexpected results
SELECT 
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c;

-- cross joins (explicit, more clear)
-- combine or join every record from first table with every record of second table
SELECT
	c.first_name AS customer,
    p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;
-- all combinations of customer name with each product
-- where you have a table of sizes and colors and want to combine all sizes with all colors
-- implicit cross join
SELECT
	c.first_name AS customer,
    p.name AS product
FROM customers c, products p
ORDER BY c.first_name;

-- unions
-- create report, add label active if placed in 2019 (or current year) or archived is placed before
SELECT
	order_id,
    order_date,
-- string literal
    'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
-- string literal
    'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

-- returns a coloumn first_name (title of first query) with all first_names and shipping names under same label first_name
SELECT first_name
FROM customers
UNION
SELECT name
FROM shippers;
-- example of union, to combine archived_orders and orders into one result set
-- number of coloumns each query returns should be equal or there will be an error
    
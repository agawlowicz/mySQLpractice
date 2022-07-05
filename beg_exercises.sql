USE sql_store;

-- Exercise:
-- Return all the products with name, unit price, and new price (unit price * 1.1)
SELECT 
	name,
    unit_price AS 'unit price',
    unit_price * 1.1 AS 'new price'
FROM products;

-- Exercise:
-- Get the orders placed in 2018
SELECT * FROM orders
WHERE order_date >= '2018-01-01' AND order_date < '2019-01-01';

-- Exercise:
-- From the order_items table, get the items for order #6 where the total price is greater than 30
SELECT * FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30;

-- Exercise:
-- Return products with quantity in stock equal to 49, 38, 72
SELECT * FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- Exercise:
-- Return customers born between 1/1/1990 and 1/1/2000
SELECT * FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- Exercise:
-- Get the customers whose addresses contain TRAIL or AVENUE
SELECT * FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

-- Exercise:
-- Get the customers whose phone numbers end with 9
SELECT * FROM customers
WHERE phone LIKE '%9';

-- Exercises:
-- Get the customers whose:
-- first names are ELKA or AMBUR
SELECT * FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

-- last names end with EY or ON
SELECT * FROM customers
WHERE last_name REGEXP 'EY$|ON$';

-- last names start with MY or contains SE
SELECT * FROM customers
WHERE last_name REGEXP '^MY|SE';

-- last names contain B followed by R or U
SELECT * FROM customers
WHERE last_name REGEXP 'B[RU]';

-- Exercise:
-- Get the orders that are not shipped
SELECT * FROM orders
WHERE shipped_date IS NULL;

-- Exercise:
-- order by total price in descending order
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

-- Exercise:
-- Get the top three loyal customers (most points)
SELECT * FROM customers
ORDER BY points DESC
LIMIT 3; 
 
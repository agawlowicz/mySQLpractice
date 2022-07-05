-- Exercise:
-- from order_items, get order_id, product_id, product name, and quantity with price at time of order
 SELECT order_id, oi.product_id, name, quantity, oi.unit_price
 FROM order_items oi
 JOIN products p
	ON oi.product_id = p.product_id;
-- automatically orders by product_id where join occurs
-- ORDER BY order_id;

-- Exercise:
-- return payments in sql_invoicing with name of client and payment method
USE sql_invoicing;

SELECT
    p.date,
    p.invoice_id,  
    p.amount,
    c.name,
    pm.name AS payment_method
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;
    
-- Exercise: OUTER JOIN
-- Return product id, product name, and quantity from order_items table, join products, how many times each product is ordered
-- inner join only shows products that have been ordered, outer join shows all products with NULL quantity if never ordered
SELECT 
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
    
-- Exercise:
-- order_date, order_id, first_name, shipper, status
SELECT 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name AS shipper,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
-- some orders don't have shippers, want to show all orders though
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id;
    
-- Exercise:
-- records of payments: payment date, client name, amount, name of payment method
USE sql_invoicing;
SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

-- Exercise:
-- Do a cross join between shippers and products
-- implicit syntax
SELECT
	sh.name AS shipper,
    p.name AS product
FROM shippers sh, products p
ORDER BY sh.name;
-- explicit syntax
SELECT
	sh.name AS shipper,
    p.name AS product
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name, p.name;

-- Exercise:
-- customer_id, first_name, points, type - ordered by first_name
-- type is Bronze < 2000 points, 2000-3000 silver, >3000 gold
SELECT customer_id, first_name, points, 'Bronze' as type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, first_name, points, 'Silver'
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'Gold'
FROM customers
WHERE points > 3000
ORDER BY first_name;


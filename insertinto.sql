INSERT INTO customers
-- DEFAULT goes to auto increment
VALUES (
	DEFAULT, 
    'John', 
    'Smith', 
    '1990-01-01', 
    NULL,
    'address',
    'city',
    'CA',
    DEFAULT);

INSERT INTO customers (
	first_name,
    last_name,
    birth_date,
    address,
    city,
    state)
VALUES ( 
    'John', 
    'Smith', 
    '1990-01-01',
    'address',
    'city',
    'CA');
    
INSERT INTO shippers (name)
VALUES ('Shipper1'),
		('Shipper2'),
        ('Shipper3');
        
-- Exercise:
-- Insert three rows in the products table
INSERT INTO products (
	name,
    quantity_in_stock,
    unit_price)
VALUES ('product1', 4, 2.99),
	   ('product2', 7, 1.99),
       ('product3', 8, 2.50);
       
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 1, 1, 2.95);


       

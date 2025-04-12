-- Show all books in the store
SELECT * FROM book;

-- Show all authors
SELECT * FROM author;

-- Show all customers and their email
SELECT first_name, last_name, email FROM customer;

-- List all orders placed by a specific customer
SELECT * FROM customer_order WHERE customer_id = 1;



-- List all addresses for a customer 
SELECT a.street, a.city, a.postal_code
FROM customer_address ca
JOIN address a ON ca.address_id = a.address_id
WHERE ca.customer_id = 1;

-- Show books that are currently in stock 
SELECT title, stock FROM book WHERE stock > 0;

-- List all orders and their shipping methods
SELECT co.order_id, sm.method_name
FROM customer_order co
JOIN shipping_method sm ON co.shipping_method_id = shipping_method_id;


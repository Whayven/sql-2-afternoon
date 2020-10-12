-- all tables need primary keys
-- users need a name and an email.
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL
);
INSERT INTO users (name, email)
VALUES ('Wayne', 'wayne@gmail.com'), 
('Hanna', 'hannap@gmail.com'), 
('Caleb', 'calebc@hotmail.com');
-- products need a name and a price
CREATE TABLE product (
  product_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price NUMERIC NOT NULL
);
INSERT INTO product (name, price)
VALUES ('TV', 225),
('Laptop', 800),
('iPhone', 999);
-- orders need a ref to product
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  product_id INT,
  quantity INT NOT NULL,
  CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES product(product_id)
);
INSERT INTO orders (product_id, quantity)
VALUES (100, 1, 1),
(2, 1),
(2, 2),
(2, 1),
(3, 3);
-- Get all products for the first order
SELECT * FROM products 
WHERE product_id IN (
  SELECT product_id FROM orders
  WHERE order_id = 1
)
-- Get all orders 
SELECT * FROM orders;
-- Get the total cost of an order ( sum the price of all products on an order ).
SELECT o.order_id, o.quantity*p.price AS total
FROM orders o 
JOIN product p ON p.product_id = o.product_id
WHERE o.order_id = 2;
-- Add a foreign key reference from orders to users.
ALTER TABLE orders ADD COLUMN user_id INTEGER;
ALTER TABLE orders 
ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(user_id);
-- Update the orders table to link a user to each order.
UPDATE orders 
SET user_id = 1 WHERE order_id = 1;
UPDATE orders 
SET user_id = 1 WHERE order_id = 2;
UPDATE orders 
SET user_id = 2 WHERE order_id = 3;
UPDATE orders 
SET user_id = 3 WHERE order_id = 4;
UPDATE orders 
SET user_id = 3 WHERE order_id = 5;
-- Get all orders for a user.
SELECT * FROM orders 
WHERE user_id IN (
  SELECT user_id FROM users
  WHERE user_id = 1
)
-- Get how many orders each user has.
SELECT u.user_id, COUNT(o.order_id) FROM users u
JOIN orders o ON o.user_id = u.user_id
GROUP BY u.user_id;
-- Black Diamond
-- Get the total amount on all orders for each user.
SELECT u.user_id, SUM(o.quantity*p.price) FROM users u 
JOIN orders o ON o.user_id = u.user_id 
JOIN product p ON p.product_id = o.product_id
GROUP BY u.user_id;
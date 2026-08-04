CREATE DATABASE Session_19;
USE Session_19;

-- Task 1. Run a SELECT query on a large 'orders' table & measure the query execution time --

EXPLAIN ANALYZE SELECT * FROM Orders
WHERE order_id = 8888;   

-- -> Filter: (orders.order_id = 8888)  (cost=1030 rows=1006) (actual time=25.2..26.9 rows=1 loops=1)
-- -> Table scan on Orders  (cost=1030 rows=10055) (actual time=0.0628..25.9 rows=10000 loops=1)

 Create Index order_id_index
 ON Orders(order_id);
 
EXPLAIN ANALYZE SELECT * FROM Orders
WHERE order_id = 8888;  

-- -> Index lookup on Orders using order_id_index (order_id=8888)  (cost=0.35 rows=1) (actual time=0.0441..0.0488 rows=1 loops=1)
  

-- Task 4 Write a query for a 'products' table that avoids a full table scan by using an index on the 'category' column 
-- to fetch all products in a specific category.

CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_id)
);

-- Create an index on the category column
CREATE INDEX idx_category ON products(category);

SELECT product_id, name, price
FROM products
WHERE category = 'Electronics';


-- More optimization technique (other than indexing)

-- One additional optimization technique is to avoid SELECT * and retrieve only the required columns. 
-- For example, instead of selecting every column from the orders table, I would select only order_id, order_date, and amount. 
-- This reduces the amount of data read from disk and transferred to the application, improving overall query performance, especially on large tables.


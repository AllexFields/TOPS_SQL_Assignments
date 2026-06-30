CREATE DATABASE session_10;
USE session_10;

-- Create AppOrders Table

CREATE TABLE App_Orders (
    order_id INT AUTO_INCREMENT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE,
    PRIMARY KEY (order_id)
);

-- Create InStoreOrders Table

CREATE TABLE InStore_Orders (
    order_id INT AUTO_INCREMENT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE,
    PRIMARY KEY (order_id)
);

-- Insert records into AppOrders

INSERT INTO App_Orders (customer_name,amount,order_date)
VALUES ('Amit', 550.00, '2025-06-01'),
	   ('Priya', 320.00, '2025-06-02'),
	   ('Rahul', 780.00, '2025-06-03');
       
-- Insert records into InStoreOrders

INSERT INTO InStore_Orders (customer_name,amount,order_date)
VALUES ('Neha', 450.00, '2025-06-01'),
	   ('Vikram', 620.00, '2025-06-02'),
	   ('Sneha', 390.00, '2025-06-03');	
       
------- 2.  Apply UNION-------

SELECT customer_name FROM App_Orders
UNION 
SELECT customer_name FROM InStore_Orders;

------ 3. Apply UNION ALL ------

SELECT order_id,customer_name,amount,order_date FROM App_Orders
UNION 
SELECT order_id,customer_name,amount,order_date FROM InStore_Orders;

----- 4. Insert Duplicate Values ------

INSERT INTO InStore_Orders (customer_name,amount,order_date)
VALUES ('Neha', 450.00, '2025-06-01');

INSERT INTO App_Orders (customer_name,amount,order_date)
VALUES ('Amit', 550.00, '2025-06-01');

SELECT customer_name,amount,order_date FROM App_Orders
UNION 
SELECT customer_name,amount,order_date FROM InStore_Orders;

------- UNION on customer_name returns 6 unique customers ----


SELECT customer_name,amount,order_date FROM App_Orders
UNION ALL
SELECT customer_name,amount,order_date FROM InStore_Orders;

------- UNION ALL on customer_name returns 8 rows, since Amit & Neha appears twice -----
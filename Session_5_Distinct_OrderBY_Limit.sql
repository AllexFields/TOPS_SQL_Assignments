CREATE DATABASE Session_2;
USE Session_2;

----- 1. Food Delivery App – orders Table -----

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1, 'Amit', 'Dominos', 'UPI', 450.00),
(2, 'Neha', 'Pizza Hut', 'Credit Card', 620.00),
(3, 'Rahul', 'McDonalds', 'Cash', 280.00),
(4, 'Priya', 'Burger King', 'UPI', 350.00),
(5, 'Vikas', 'KFC', 'Debit Card', 540.00),
(6, 'Riya', 'Subway', 'Credit Card', 410.00),
(7, 'Ankit', 'Dominos', 'Cash', 300.00);

SELECT DISTINCT (payment_method) FROM orders;



----- 2. Users Registration – users Table -----

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    city VARCHAR(50),
    registration_status VARCHAR(15)
);

INSERT INTO users VALUES
(1, 'Amit', 'Ahmedabad', 'Registered'),
(2, 'Neha', 'Mumbai', 'Registered'),
(3, 'Rahul', 'Delhi', 'Not Registered'),
(4, 'Priya', 'Ahmedabad', 'Registered'),
(5, 'Vikas', 'Pune', 'Not Registered'),
(6, 'Riya', 'Mumbai', 'Registered'),
(7, 'Ankit', 'Surat', 'Registered'),
(8, 'Karan', 'Delhi', 'Not Registered');

SELECT DISTINCT city FROM users
WHERE registration_status = "Registered"
ORDER BY city ASC;


------ 3. Movie Booking System – bookings Table -----

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    movie_name VARCHAR(100),
    booking_date DATETIME
);

INSERT INTO bookings VALUES
(101, 'Amit', 'Jawan', '2025-05-01 10:15:00'),
(102, 'Neha', 'Pathaan', '2025-05-03 14:20:00'),
(103, 'Rahul', 'Animal', '2025-05-05 18:30:00'),
(104, 'Priya', 'Dunki', '2025-05-07 20:45:00'),
(105, 'Vikas', 'KGF 2', '2025-05-10 11:00:00'),
(106, 'Riya', 'Pushpa', '2025-05-12 16:10:00'),
(107, 'Ankit', 'Leo', '2025-05-15 19:00:00'),
(108, 'Karan', 'Salaar', '2025-05-18 21:15:00');

SELECT movie_name FROM bookings
ORDER BY booking_date DESC
LIMIT 5;



------ 4. Flipkart-style Products – products Table -----

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO products VALUES
(1, 'iPhone 15', 'Mobile', 2500),
(2, 'Samsung Galaxy S24', 'Mobile', 2200),
(3, 'OnePlus 12', 'Mobile', 1800),
(4, 'HP Pavilion Laptop', 'Laptop', 1200),
(5, 'Dell Inspiron', 'Laptop', 1400),
(6, 'Boat Rockerz 450', 'Headphones', 3100),
(7, 'Sony WH-CH520', 'Headphones', 2100),
(8, 'LG Smart TV', 'Electronics', 900),
(9, 'Realme Narzo', 'Mobile', 1600),
(10, 'Noise Smart Watch', 'Wearables', 2700),
(11, 'Fire-Boltt Smart Watch', 'Wearables', 2400),
(12, 'Logitech Mouse', 'Accessories', 3500);

SELECT name, sold_count FROM products
ORDER BY sold_count DESC
LIMIT 10;
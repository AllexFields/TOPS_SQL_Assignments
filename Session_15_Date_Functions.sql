CREATE DATABASE Session_15;
USE Session_15;

-- Task 1. show current date and time --

SELECT NOW() AS Current_Date_Time;


-- Task 2. Extract year, month, day --
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    PRIMARY KEY (order_id)
);

INSERT INTO Orders (user_id,order_date,total_amount)
VALUES (101, '2023-07-01', 500),
(102, '2023-07-05', 700),
(103, '2023-07-10', 1200);

SELECT order_id, order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM Orders;


-- Task 3. order delivery estimate --
CREATE TABLE Deliveries (
    delivery_id INT AUTO_INCREMENT,
    delivery_date DATE,
    PRIMARY KEY (delivery_id)
);

INSERT INTO Deliveries (delivery_date)
VALUES ('2023-07-15'),
('2023-07-20'),
('2023-07-25');

-- expected pickup date = 2 days before delivery
SELECT delivery_id, delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;


-- Task 4. calculate subscription duration --
CREATE TABLE Subscriptions (
    user_id INT AUTO_INCREMENT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (user_id)
);

INSERT INTO Subscriptions (start_date,end_date)
VALUES ('2023-01-01', '2023-03-01'),
('2023-02-15', '2023-04-10'),
('2023-05-01', '2023-05-20');

SELECT user_id,start_date,end_date,
    DATEDIFF(end_date, start_date) AS subscription_days
FROM Subscriptions;


-- Task 5. User inactive > 30 days --
CREATE TABLE AppLogins (
    user_id INT AUTO_INCREMENT,
    last_login_date DATE,
    PRIMARY KEY (user_id)
);

INSERT INTO AppLogins (last_login_date)
VALUES ('2026-06-01'),
('2026-07-01'),
('2026-03-15'),
('2026-04-20');


SELECT user_id,last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;

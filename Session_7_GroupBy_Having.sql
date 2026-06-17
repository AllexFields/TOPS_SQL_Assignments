CREATE DATABASE Session_4;
USE Session_4;

----- 1. Food_Orders_Table ------

CREATE TABLE food_orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    restaurant_name VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO food_orders(user_id, restaurant_name, order_amount, order_date)
VALUES
(101, 'Dominos', 450.00, '2026-06-01'),
(102, 'McDonalds', 300.00, '2026-06-01'),
(101, 'KFC', 550.00, '2026-06-02'),
(103, 'Pizza Hut', 700.00, '2026-06-03'),
(102, 'Burger King', 250.00, '2026-06-03'),
(101, 'Subway', 350.00, '2026-06-04'),
(104, 'Dominos', 600.00, '2026-06-04'),
(103, 'KFC', 450.00, '2026-06-05');

SELECT user_id, count(order_id) AS Total_No_Of_Orders 
FROM food_orders
GROUP BY user_id;



----- 2. transaction_table -----

CREATE TABLE transactions(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20)
);

INSERT INTO transactions(user_id, amount, payment_method)
VALUES
(101, 1200.00, 'Credit Card'),
(102, 800.00, 'UPI'),
(103, 1500.00, 'Credit Card'),
(104, 500.00, 'Cash'),
(101, 700.00, 'UPI'),
(102, 1000.00, 'Debit Card'),
(103, 600.00, 'UPI'),
(104, 900.00, 'Credit Card');

SELECT payment_method, SUM(amount) AS total_spent
FROM transactions
GROUP BY payment_method;



------ 3. movies_table -----

CREATE TABLE movies(
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    box_office_collection DECIMAL(10,2)
);

INSERT INTO movies(movie_name, genre, box_office_collection)
VALUES
('Movie A', 'Action', 5.5),
('Movie B', 'Action', 7.0),
('Movie C', 'Comedy', 4.0),
('Movie D', 'Comedy', 3.5),
('Movie E', 'Drama', 12.0),
('Movie F', 'Drama', 5.0),
('Movie G', 'Thriller', 8.0),
('Movie H', 'Thriller', 4.5);

SELECT genre, SUM(box_office_collection) AS total_box_office_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 10;


------- 4. playlist_table -------

CREATE TABLE playlist(
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist(playlist_id, user_id, song_id, duration)
VALUES
(1, 101, 1001, 1800),
(1, 101, 1002, 2000),
(1, 101, 1003, 2200),

(2, 102, 1004, 1500),
(2, 102, 1005, 1800),

(3, 103, 1006, 3000),
(3, 103, 1007, 2500),
(3, 103, 1008, 2200),

(4, 104, 1009, 1000),
(4, 104, 1010, 1200);

SELECT user_id, SUM(duration) as Total_Duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;
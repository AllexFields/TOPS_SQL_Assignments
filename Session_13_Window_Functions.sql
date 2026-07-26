CREATE DATABASE Session_13;
USE Session_13;

--- Taks 1. Use OVER() Function ---

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(50),
    PRIMARY KEY (order_id)
);

-- Insert sample values
INSERT INTO Orders (user_id,order_amount,app_name)
VALUES (101, 500, 'Zomato'),
(102, 700, 'Swiggy'),
(101, 1200, 'Flipkart'),
(103, 800, 'Zomato'),
(104, 1500, 'Swiggy'),
(102, 600, 'Flipkart'),
(105, 900, 'Zomato'),
(106, 400, 'Swiggy'),
(103, 1100, 'Flipkart'),
(104, 750, 'Zomato');


SELECT order_id, user_id, order_amount, app_name, 
	   SUM(order_amount) OVER() AS total_all_orders
FROM Orders;


--- Task 2. Per-user average order amount ---

SELECT order_id, user_id, order_amount,
    AVG(order_amount) OVER(PARTITION BY user_id) AS avg_order_per_user
FROM Orders;


--- Task 3. Playlist durations per user ---

CREATE TABLE Playlist (
    song_id INT AUTO_INCREMENT,
    user_id INT,
    duration_sec INT,
    PRIMARY KEY (song_id)
);


INSERT INTO Playlist (user_id, duration_sec)
VALUES (101, 200),
(101, 180),
(102, 240),
(102, 300),
(103, 150),
(103, 210),
(104, 400),
(104, 350);


SELECT user_id, song_id, duration_sec,
    SUM(duration_sec) OVER(PARTITION BY user_id) AS total_duration_per_user
FROM Playlist;



--- Task 4. Movie ratings with average per movie and difference ---

CREATE TABLE MovieRatings (
    rating_id INT AUTO_INCREMENT,
    user_id INT,
    movie_name VARCHAR(100),
    rating INT,
    PRIMARY KEY (rating_id)
);

-- Insert sample values
INSERT INTO MovieRatings (user_id, movie_name, rating) 
VALUES (101, 'Inception', 5),
(102, 'Inception', 4),
(103, 'Inception', 3),
(101, 'Interstellar', 4),
(102, 'Interstellar', 5),
(103, 'Interstellar', 4),
(104, 'Dune', 3),
(105, 'Dune', 4);


SELECT movie_name, rating,
    AVG(rating) OVER(PARTITION BY movie_name) AS avg_movie_rating,
    rating - AVG(rating) OVER(PARTITION BY movie_name) AS rating_diff
FROM MovieRatings;

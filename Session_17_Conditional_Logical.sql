CREATE DATABASE Session_17;
USE Session_17;


-- Task 1. WHEN CASE --
CREATE TABLE FoodOrders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2),
    PRIMARY KEY (order_id)
);

INSERT INTO FoodOrders (user_id,total_amount)
VALUES (101, 250),
(102, 500),
(103, 1200),
(104, 800),
(105, 150);

SELECT order_id, user_id, total_amount,
CASE 
	WHEN total_amount < 300 THEN 'Small'
	WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
	ELSE 'Large'
END AS order_size
FROM FoodOrders;


-- Task 2. Movies popularity classification --
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1),
    PRIMARY KEY (movie_id)
);

INSERT INTO Movies (movie_name,rating)
VALUES ('Inception', 8.8),
('Interstellar', 7.5),
('Dune', 6.2),
('Old Classic', 4.5);

SELECT movie_id,movie_name,rating,
CASE 
	WHEN rating >= 8 THEN 'Blockbuster'
	WHEN rating >= 5 AND rating < 8 THEN 'Hit'
	ELSE 'Average'
END AS popularity
FROM Movies;


-- Task 3. FlipkartProducts price category --
CREATE TABLE FlipkartProducts (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    PRIMARY KEY (product_id)
);

INSERT INTO FlipkartProducts (product_name,price)
VALUES ('Earphones', 299),
('Shoes', 1200),
('Laptop', 55000),
('T-Shirt', 499),
('Mixer Grinder', 2500);

SELECT product_id, product_name, price,
CASE 
    WHEN price < 500 THEN 'Budget'
	WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
	ELSE 'Premium'
END AS price_category
FROM FlipkartProducts;


-- Task 4. SpotifyTracks duration label --
CREATE TABLE SpotifyTracks (
    track_id INT AUTO_INCREMENT,
    track_name VARCHAR(100),
    duration_sec INT,
    PRIMARY KEY (track_id)
);

INSERT INTO SpotifyTracks (track_name,duration_sec)
VALUES ('Song A', 150),
('Song B', 200),
('Song C', 320),
('Song D', 180),
('Song E', 400);

SELECT track_id,track_name,duration_sec,
CASE 
	WHEN duration_sec < 180 THEN 'Short'
	WHEN duration_sec BETWEEN 180 AND 300 THEN 'Medium'
	ELSE 'Long'
END AS duration_label
FROM SpotifyTracks;

CREATE DATABASE Session_3;
USE Session_3;

----- 1. Food_Orders -----

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO food_orders (user_id, amount)
VALUES
(101, 250.50),
(102, 430.00),
(101, 320.75),
(103, 180.00),
(102, 550.25),
(101, 400.00);

SELECT user_id, 
sum(amount) AS total_amount_spent
FROM food_orders
GROUP BY user_id;


----- 2. Spotify_Playlist -----

CREATE TABLE spotify_playlists (
    playlist_id INT NOT NULL,
    user_id INT NOT NULL,
    song_id INT NOT NULL
);

INSERT INTO spotify_playlists
VALUES
(1, 101, 1001),
(1, 101, 1002),
(1, 101, 1003),
(2, 102, 1004),
(2, 102, 1005),
(3, 103, 1006),
(3, 103, 1007),
(3, 103, 1008),
(3, 103, 1009);

SELECT user_id,
count(song_id) as total_song_added
FROM spotify_playlists
GROUP BY user_id;



----- 3. Bookmyshow_review -----

CREATE TABLE bookmyshow_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    rating DECIMAL(3,1) NOT NULL
);

INSERT INTO bookmyshow_reviews (movie_id, rating)
VALUES
(201, 4.5),
(201, 3.8),
(201, 4.2),
(202, 5.0),
(202, 4.7),
(203, 3.5),
(203, 4.0);

SELECT movie_id, round(avg(rating)) AS average_rating
FROM bookmyshow_reviews
GROUP BY movie_id;


----- 4. Paytm Transactions -----

CREATE TABLE paytm_transactions (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO paytm_transactions (user_id, amount)
VALUES
(101, 500.00),
(101, 1200.00),
(101, 300.00),
(102, 800.00),
(102, 2500.00),
(103, 150.00),
(103, 900.00);

SELECT user_id, max(amount) AS Max_Trxn_Value , min(amount) AS Min_Trxn_Value
FROM paytm_transactions
GROUP BY user_id;


----- 5. Myntra_Orders -----

CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL
);

INSERT INTO myntra_orders (user_id, total_price)
VALUES
(101, 1499.99),
(101, 899.50),
(101, 2499.00),
(102, 1999.99),
(102, 2999.00),
(103, 799.00),
(103, 1599.00),
(103, 2199.99);

SELECT user_id, count(user_id) AS total_no_of_orders, round(avg(total_price),2) AS average_order_value, max(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;
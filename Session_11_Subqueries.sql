Create DATABASE Session_11;
USE Session_11;

--- Task 1. SubQuery --- 
CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    rating DECIMAL(3,2),
    PRIMARY KEY (restaurant_id)
);

INSERT INTO Restaurants (name, rating)
VALUES ('Spice Hub', 4.5),
	   ('Ocean View', 3.8),
	   ('Green Bowl', 4.2),
	   ('Urban Tandoor', 3.5),
	   ('Royal Feast', 4.7);

SELECT name, rating
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);  -- AVG(rating) is 4.14


--- Task 2. Scalar SubQuery ---
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT,
    p_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    PRIMARY KEY (product_id)
);

INSERT INTO Products (p_name, price, category)
VALUES ('Laptop', 55000, 'Electronics'),
	   ('Smartphone', 30000, 'Electronics'),
	   ('Shoes', 2500, 'Fashion'),
	   ('T-Shirt', 1200, 'Fashion'),
	   ('Mixer Grinder', 4000, 'Home Appliances');

SELECT p_name, price,
    (SELECT AVG(price) 
     FROM Products p2 
     WHERE p2.category = p1.category) AS category_avg_price  -- this is called scalar subquery = returns a scalar quantity
FROM Products p1;


--- Task 3. SubQuery FROM ---

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(100),
    PRIMARY KEY (user_id)
);

CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT,
    user_id INT,
    playlist_name VARCHAR(100),
    PRIMARY KEY (playlist_id),
    FOREIGN KEY (user_id) 
    REFERENCES Users(user_id)
);


INSERT INTO Users (username)
VALUES ('Alice'),
	   ('Bob'),
	   ('Charlie');

INSERT INTO Playlists (user_id, playlist_name)
VALUES (1, 'Workout Mix'),
	   (1, 'Chill Vibes'),
	   (2, 'Party Hits'),
	   (2, 'Jazz Collection'),
	   (2, 'Rock Anthems'),
	   (3, 'Study Tunes');


SELECT username, playlist_count
FROM (
    SELECT u.username, COUNT(p.playlist_id) AS playlist_count
    FROM Users u
    LEFT JOIN Playlists p 
    ON u.user_id = p.user_id
    GROUP BY u.username
) AS user_playlists
WHERE playlist_count > (
    SELECT AVG(playlist_count)
    FROM (
        SELECT COUNT(p.playlist_id) AS playlist_count
        FROM Users u
        LEFT JOIN Playlists p ON u.user_id = p.user_id
        GROUP BY u.username
    ) AS counts
);

--- Task 4. Sub-query ---
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders 
VALUES (201, 1, 500),
(202, 1, 1200),
(203, 2, 800),
(204, 2, 1500),
(205, 3, 600);

-- Query: users with at least one order above average
SELECT DISTINCT user_id, total_amount
FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

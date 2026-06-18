CREATE DATABASE Session_4;
USE Session_4;

------ 1. LIKE Operators ------

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Restaurants
VALUES (2, 'Royal Dining', 'Surat'),
	   (1, 'Sunrise Cafe', 'Ahmedabad');
       
-- Find all restaurants whose names end with 'Cafe'

SELECT * FROM Restaurants
WHERE restaurant_name LIKE "%Cafe";


------ 2. BETWEEN & AND Operators ------

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO Products
VALUES (101, 'Wireless Mouse', 799.00),
	   (102, 'Gaming Keyboard', 1999.00);
       
SELECT * FROM Products
WHERE price BETWEEN 500 AND 1500;


------ 3. IN Operators ------

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Users
VALUES (1, 'Amit', 'Ahmedabad'),
	   (2, 'Neha', 'Mumbai'),
       (3, 'Kailash','Surat'),
       (4,'Divyansh','Vadodara');

SELECT * FROM Users
WHERE city IN ('Ahmedabad','Surat','Vadodara');


----- 4. Select artist with 'ar' in their name ------

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);

INSERT INTO Songs
VALUES (1, 'Kesariya', 'Arijit Singh'),
	   (2, 'Shape of You', 'Ed Sheeran');
       
SELECT * FROM Songs
WHERE artist_name LIKE '%ar%';
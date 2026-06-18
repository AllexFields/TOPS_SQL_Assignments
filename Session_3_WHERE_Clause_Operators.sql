CREATE DATABASE Session_3;
USE Session_3;

------ 1. rating >= 4.5 ------

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO restaurants
VALUES (1, 'Spice Garden', 'Ahmedabad', 4.7),
	   (2, 'Food Junction', 'Mumbai', 4.3),
	   (3, 'Royal Kitchen', 'Delhi', 4.8),
	   (4, 'Taste Hub', 'Pune', 4.4);

SELECT *
FROM restaurants
WHERE rating >= 4.5;

------ Task 2 -------

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    release_year INT,
    genre VARCHAR(50)
);

INSERT INTO movies
VALUES (1, 'Pathaan', 2023, 'Action'),
	   (2, 'Jawan', 2023, 'Action'),
	   (3, '12th Fail', 2023, 'Drama'),
	   (4, 'War', 2019, 'Action');

SELECT * FROM movies
WHERE release_year > 2020
AND genre = 'Action';


----- Task 3 ------

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO products
VALUES (101, 'Laptop', 55000, 'Electronics'),
	   (102, 'Chair', 450, 'Furniture'),
	   (103, 'Mobile Phone', 25000, 'Electronics'),
	   (104, 'Notebook', 100, 'Stationery');
       
SELECT * FROM products
WHERE category != 'Electronics'
OR price < 500;


----- Task 4 -----

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(50),
    followers INT
);

INSERT INTO users
VALUES (1, 'Rahul', 'Ahmedabad', 1500),
	   (2, 'Priya', 'Mumbai', 2000),
	   (3, 'Amit', 'Ahmedabad', 800),
	   (4, 'Sneha', 'Delhi', 1200);

SELECT * FROM users
WHERE NOT city = 'Ahmedabad'
AND followers > 1000;
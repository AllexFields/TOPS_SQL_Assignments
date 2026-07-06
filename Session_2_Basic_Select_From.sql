USE session_1;

----- 1. Select all columns -----

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    location VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO restaurants
VALUES
(1, 'Spice Garden', 'Ahmedabad', 4.5);



SELECT * FROM restaurants;

----- 2. Display only name & rating columns -----

CREATE TABLE zomato_reviews (
    review_id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    review_text VARCHAR(255)
);

SELECT name,rating FROM zomato_reviews;

----- 3. Rename column names -----

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    release_year INT,
    genre VARCHAR(50)
);

SELECT movie_name AS "Title", release_year AS "Year Released" FROM movies;

----- 4. Add Comments using '-' -------

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- This query retrieves all columns and all rows from the products table.
SELECT * FROM products;

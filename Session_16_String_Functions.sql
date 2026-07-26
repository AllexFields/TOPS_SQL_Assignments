CREATE DATABASE Session_16;
USE Session_16;


-- Task 1. Concat first name & last name --

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (user_id)
);

INSERT INTO Users (first_name,last_name)
VALUES ('Arijit', 'Singh'),
('Shreya', 'Ghoshal'),
('Pankaj', 'Udas');

SELECT user_id, first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM Users;


-- Task 2. UPPER function --
CREATE TABLE Playlists (
    song_id INT AUTO_INCREMENT,
    song_title VARCHAR(100),
    PRIMARY KEY (song_id)
);

INSERT INTO Playlists (song_title)
VALUES ('Tum Hi Ho'),
('Kesariya'),
('Ghungroo');

SELECT song_id, UPPER(song_title) AS uppercase_title
FROM Playlists;


-- Task 3. Trim extra spaces --
CREATE TABLE Food_Items (
    item_id INT AUTO_INCREMENT,
    item_code VARCHAR(50),
    PRIMARY KEY (item_id)
);

INSERT INTO Food_Items (item_code)
VALUES ('  PIZZA01  '),
('BURGER02 '),
('  PASTA03');

SELECT item_id, TRIM(item_code) AS trimmed_item_code
FROM Food_Items;


-- Task 4 Extract numeric part with RIGHT --
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT,
    imdb_id VARCHAR(20),
    PRIMARY KEY (movie_id)
);

INSERT INTO Movies (imdb_id) 
VALUES ('tt1234567'),
('tt9876543'),
('tt1112223');

SELECT movie_id, imdb_id, RIGHT(imdb_id, 7) AS movie_number
FROM Movies;


-- Task 5. Replace Function --
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT,
    sku_code VARCHAR(50),
    PRIMARY KEY (product_id)
);

INSERT INTO Products (sku_code)
VALUES ('MOB-123-XY'),
('LAP-456-AB'),
('TV-789-CD');

SELECT product_id, REPLACE(sku_code, '-', '_') AS updated_sku_code
FROM Products;

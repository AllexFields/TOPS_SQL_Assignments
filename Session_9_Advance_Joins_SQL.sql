CREATE DATABASE Session_9;
USE Session_9;

------- 1. Perform Full Outer Join ------

CREATE TABLE influencers (
    influencer_id INT AUTO_INCREMENT,
    influencer_name VARCHAR(50),
    city VARCHAR(50),
    PRIMARY KEY (influencer_id)
);

INSERT INTO influencers (influencer_name,city)
VALUES ('Aman Verma', 'Mumbai'),
	   ('Riya Sharma', 'Delhi'),
	   ('Neha Patel', 'Ahmedabad');

CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT,
    brand_name VARCHAR(50),
    city VARCHAR(50),
    influencer_id INT,
    PRIMARY KEY (brand_id),
    FOREIGN KEY (influencer_id)
    REFERENCES influencers(influencer_id)
);

INSERT INTO brands (brand_name, city, influencer_id)
VALUES ('TechWorld', 'Mumbai',1),
	   ('FashionHub', 'Bangalore',1),
	   ('FoodieKing', 'Ahmedabad',3),
	   ('NewAge', 'Delhi',2);

-- FULL OUTER JOIN is not directly supported in MySQL.
-- It can be simulated by combining LEFT JOIN and RIGHT JOIN using UNION.
-- This returns:
-- 1. All matching records from both tables.
-- 2. Unmatched records from the left table.
-- 3. Unmatched records from the right table.

SELECT i.influencer_name, b.brand_name
FROM influencers AS i
LEFT JOIN brands AS b
ON i.city = b.city

UNION

SELECT i.influencer_name, b.brand_name
FROM influencers AS i
RIGHT JOIN brands AS b
ON i.city = b.city;


-------- 2. Self Join --------

CREATE TABLE playlists (
    id INT AUTO_INCREMENT,
    playlist_name VARCHAR(50),
    parent_playlist_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_playlist_id)
    REFERENCES playlists(id)
);

INSERT INTO playlists (playlist_name, parent_playlist_id)
VALUES ('Workout Mix', NULL),
       ('Cardio Songs', 1),
       ('Gym Motivation', 1),
       ('Relaxing Music', NULL),
       ('Sleep Playlist', 4);
       
-- SELF JOIN is used when a table is related to itself.
-- Here, each playlist can have a parent playlist.
-- Similar to Spotify where a playlist category can contain sub-playlists.

SELECT child.playlist_name AS Playlist_Name, parent.playlist_name AS Parent_Playlist
FROM playlists AS child
JOIN playlists AS parent
ON child.parent_playlist_id = parent.id;


-------- 3. Cross Join --------

CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    user_name VARCHAR(50),
    PRIMARY KEY (user_id)
);

INSERT INTO users (user_name)
VALUES ('Rahul'),
       ('Priya'),
       ('Karan');
       
CREATE TABLE offers (
    offer_id INT AUTO_INCREMENT,
    offer_title VARCHAR(100),
    user_id INT,
    PRIMARY KEY (offer_id)
);

INSERT INTO offers (offer_title,user_id)
VALUES ('10% Off Electronics',1),
       ('Buy 1 Get 1 Free',2),
       ('Free Delivery',3);

       
-- CROSS JOIN creates a Cartesian Product.
-- Every user is paired with every offer.
-- Similar to a Flipkart campaign where all offers are generated for all users before applying personalization filters.

SELECT U.user_name, O.offer_title 
FROM users AS U
CROSS JOIN offers AS O;


-------- 4. Self Join (Employees & Managers) --------

CREATE TABLE managers (
    manager_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (manager_id)
);

INSERT INTO managers (name)
VALUES ('Alok Singh'),
       ('Jignesh Patel');


CREATE TABLE employees (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    manager_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id)
    REFERENCES managers(manager_id)
);

INSERT INTO employees (name, manager_id)
VALUES ('Rajesh', NULL),
       ('Amit', 1),
       ('Sneha', 1),
       ('Pooja', 2),
       ('Vikas', 2);

SELECT e.name AS employee_name,m.name AS manager_name
FROM employees AS e
LEFT JOIN managers AS m
ON e.manager_id = m.manager_id;
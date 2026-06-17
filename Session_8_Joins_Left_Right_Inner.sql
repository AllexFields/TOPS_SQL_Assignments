CREATE DATABASE Session_8;
USE Session_8;


CREATE TABLE Users(
    user_id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    PRIMARY KEY(user_id)
);

INSERT INTO Users(username, city)
VALUES
('Amit', 'Mumbai'),
('Priya', 'Delhi'),
('Rahul', 'Ahmedabad'),
('Neha', 'Surat');

CREATE TABLE Orders(
    order_id INT AUTO_INCREMENT,
    user_id INT,
    product VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(order_id),
    CONSTRAINT fk_orders_users
		FOREIGN KEY(user_id) 
        REFERENCES Users(user_id)
);

INSERT INTO Orders(user_id, product, amount)
VALUES
(1, 'Pizza', 450.00),
(1, 'Burger', 250.00),
(2, 'Pasta', 350.00),
(3, 'Sandwich', 180.00),
(3, 'Cold Coffee', 120.00);

INSERT INTO Orders
Values(5, 'Pizza', 450.00);

----- Inner Join -----

SELECT U.username, O.product
FROM Users AS U
INNER JOIN Orders AS O
ON U.user_id = O.user_id;


----- Left Join -------

SELECT U.username, O.product
FROM Users AS U
LEFT JOIN Orders AS O
ON U.user_id = O.user_id;


----- Right Join ------

SELECT U.username, O.*
FROM Users AS U
RIGHT JOIN Orders AS O
ON U.user_id = O.user_id;


----- Customer_Segments_Table ------

CREATE TABLE CustomerSegments(
    segment_id INT AUTO_INCREMENT,
    segment_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(segment_id)
);

INSERT INTO CustomerSegments(segment_name)
VALUES
('Premium'),
('Regular'),
('Occasional');

ALTER TABLE Users
ADD COLUMN segment_id INT,
ADD CONSTRAINT fk_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);

------ Populated the segment_id column in Users table ------

UPDATE Users
SET segment_id = 3
WHERE user_id = 4;

SELECT U.username, S.segment_name, SUM(O.amount) AS total_amount
FROM Users AS U
LEFT JOIN CustomerSegments AS S
ON U.segment_id = S.segment_id
LEFT JOIN Orders AS O
ON U.user_id = O.user_id
GROUP BY U.username, S.segment_name;
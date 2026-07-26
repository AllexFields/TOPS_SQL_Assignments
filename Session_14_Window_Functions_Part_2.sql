CREATE DATABASE Session_14;
USE Session_14;


-- Task 1. Row Number --

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    PRIMARY KEY (order_id)
);

INSERT INTO Orders (user_id,order_date,total_amount) 
VALUES (101, '2023-07-01', 500),
(101, '2023-07-05', 700),
(102, '2023-07-02', 1200),
(102, '2023-07-06', 800),
(103, '2023-07-03', 1500),
(103, '2023-07-07', 600);


SELECT order_id,user_id,order_date,total_amount,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY order_date DESC) AS Ranking
FROM Orders;


-- Task 2. Rank --

CREATE TABLE Songs (
    song_id INT AUTO_INCREMENT,
    artist VARCHAR(100),
    streams INT,
    PRIMARY KEY (song_id)
);

INSERT INTO Songs (artist,streams)
VALUES ('Arijit Singh', 500000),
('Arijit Singh', 450000),
('Arijit Singh', 450000),
('Shreya Ghoshal', 600000),
('Shreya Ghoshal', 550000);


SELECT song_id,artist,streams,
    RANK() OVER(PARTITION BY artist ORDER BY streams DESC) AS stream_rank
FROM Songs;


-- Task 3. Dense Ranking -- 
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT,
    genre VARCHAR(50),
    rating DECIMAL(3,1),
    PRIMARY KEY (movie_id)
);


INSERT INTO Movies (genre,rating)
VALUES ('Action', 4.8),
('Action', 4.5),
('Action', 4.5),
('Drama', 4.9),
('Drama', 4.7);


SELECT genre,movie_id,rating,
    DENSE_RANK() OVER(PARTITION BY genre ORDER BY rating DESC) AS rating_rank
FROM Movies;


-- Task 4. Row_Number and CTE --
CREATE TABLE Influencers (
    influencer_id INT AUTO_INCREMENT,
    platform VARCHAR(50),
    followers INT,
    PRIMARY KEY (influencer_id)
);

INSERT INTO Influencers (platform,followers)
VALUES ('Instagram', 1000000),
('Instagram', 950000),
('Instagram', 900000),
('Twitter', 870000),
('Instagram', 850000),
('YouTube', 1200000),
('Twitter', 1000000),
('YouTube', 1100000),
('YouTube', 1050000),
('YouTube', 950000);


WITH RankedInfluencers AS (
    SELECT platform,influencer_id,followers,
        ROW_NUMBER() OVER(PARTITION BY platform ORDER BY followers DESC) AS rank_platform_wise
    FROM Influencers
)
SELECT influencer_id, platform, rank_platform_wise
FROM RankedInfluencers
WHERE rank_platform_wise <= 3;

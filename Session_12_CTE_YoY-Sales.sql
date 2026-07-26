CREATE DATABASE Session_12;
USE Session_12;

--- Task 1. Top-3 Most Followed Artists ---
CREATE TABLE SpotifyArtists (
    artist_id INT AUTO_INCREMENT,
    artist_name VARCHAR(100),
    followers INT,
    PRIMARY KEY (artist_id)
);

-- Insert sample values
INSERT INTO SpotifyArtists (artist_name,followers)
VALUES ('Arijit Singh', 1200000),
('Shreya Ghoshal', 950000),
('Badshah', 800000),
('Sonu Nigam', 700000),
('Neha Kakkar', 1100000);


WITH TopArtists AS (
	SELECT artist_id,artist_name,followers 
    FROM SpotifyArtists 
    ORDER BY followers desc
    LIMIT 3
)
SELECT * FROM TopArtists;


--- Task 2. MonthlyTotals CTE ---

CREATE TABLE FlipkartOrders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    PRIMARY KEY (order_id)
);


INSERT INTO FlipkartOrders (user_id,order_date,total_amount)
VALUES (1, '2023-01-15', 5000),
(2, '2023-01-20', 7000),
(1, '2023-02-10', 6000),
(3, '2023-02-25', 8000),
(2, '2023-03-05', 9000);


WITH MonthlyTotals AS (
	SELECT EXTRACT(MONTH FROM order_date) AS months,
		   SUM(total_amount) AS total_sales
	FROM FlipkartOrders
    WHERE EXTRACT(YEAR FROM order_date) = 2023
    GROUP BY months
)
SELECT months, total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;


--- Task 3. Recursive CTE for next 7 Days ---

CREATE TABLE CalendarDays (
    day_date DATE
);


WITH RECURSIVE Next7Days AS (
    SELECT CURDATE() AS day_date, 1 AS day_count
    UNION ALL
    SELECT day_date + INTERVAL 1 DAY, day_count + 1
    FROM Next7Days
    WHERE day_count < 7
)
SELECT day_date FROM Next7Days;


--- Task 4. CTE ---

CREATE TABLE ZomatoRestaurants (
    restaurant_id INT AUTO_INCREMENT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(3,2),
    PRIMARY KEY (restaurant_id)
);


INSERT INTO ZomatoRestaurants (restaurant_name,city,rating)
VALUES ('Spice Villa', 'Delhi', 4.5),
('Royal Treat', 'Delhi', 4.2),
('Urban Cafe', 'Mumbai', 3.8),
('Sea Breeze', 'Mumbai', 4.1),
('Green Leaf', 'Bangalore', 4.3);


WITH City_Rating_Avg AS (
    SELECT city, AVG(rating) AS avg_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT R.*
FROM ZomatoRestaurants AS R
JOIN City_Rating_Avg C 
ON R.city = C.city
WHERE C.avg_rating > 4.0;


--- Task 5. IPL CTE ---

CREATE TABLE IPLMatches (
    match_id INT AUTO_INCREMENT,
    team VARCHAR(50),
    runs INT,
    match_year INT,
    PRIMARY KEY (match_id)
);

INSERT INTO IPLMatches (team,runs,match_year)
VALUES ('Mumbai Indians', 780, 2023),
('Mumbai Indians', 400, 2023),
('CSK', 290, 2023),
('CSK', 810, 2023),
('RCB', 1150, 2023),
('RCB', 890, 2023),
('Mumbai Indians', 690, 2023),
('CSK', 230, 2023),
('RCB', 260, 2023);


WITH TeamRuns AS (
    SELECT team, SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamRuns
WHERE total_runs > 2000;

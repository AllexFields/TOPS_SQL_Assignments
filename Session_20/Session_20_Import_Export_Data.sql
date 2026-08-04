CREATE DATABASE Session_20;
USE Session_20;

-- Load IPL Match csv

CREATE TABLE ipl_matches (
	player_name VARCHAR(50),
    team VARCHAR(20),
    runs INT,
    matches INT,
    innings INT,
    not_out INT,
    highest_score VARCHAR(50),
    Average_score DECIMAL(5,2),
    bf INT,
    strike_rate DECIMAL(5,2),
    centuries INT,
    fifties INT,
    fours INT,
    sixes INT
); 

-- Created table ipl_matches and loaded csv using Table Data Import Wizard option


-- Task 2. Write a SQL query to select all matches where the team 'Mumbai Indians' played, 
-- then export the query results as a CSV file named mi_matches.csv.

SELECT * FROM ipl_matches
WHERE team = 'MI';

-- 
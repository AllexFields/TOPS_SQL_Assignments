CREATE DATABASE session_18;
USE session_18;

-- Restaurants Table

CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    PRIMARY KEY (restaurant_id)
);

-- Restaurant Reviews Table

CREATE TABLE RestaurantReviews (
    review_id INT AUTO_INCREMENT,
    restaurant_id INT,
    rating DECIMAL(2,1),
    PRIMARY KEY (review_id),
    
    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurants(restaurant_id)
);

-- Restaurants

INSERT INTO Restaurants (restaurant_name, city)
VALUES ('Spice Garden', 'Ahmedabad'),
	   ('Pizza Hub', 'Surat'),
	   ('Burger Point', 'Vadodara'),
	   ('South Treat', 'Rajkot'),
	   ('Tandoori House', 'Ahmedabad');
       
-- Restaurant Reviews

INSERT INTO RestaurantReviews (restaurant_id, rating)
VALUES (1,4.5),
	   (1,4.8),
	   (1,4.2),
	   (2,3.8),
	   (2,4.0),
	   (3,4.6),
	   (3,4.7),
	   (4,3.5),
	   (4,3.9),
	   (5,4.9),
	   (5,4.4);
       
CREATE VIEW TopRatedRestaurants AS 
SELECT R.restaurant_name, ROUND(AVG(V.rating),2) AS Average_Rating, COUNT(V.review_id) AS Total_Reviews 
FROM Restaurants AS R
INNER JOIN RestaurantReviews AS V
ON R.restaurant_id = V.restaurant_id
GROUP BY R.restaurant_id
HAVING Avg(V.rating) > 4;

SELECT * FROM TopRatedRestaurants;



--- Update View ---

ALTER VIEW TopRatedRestaurants AS
SELECT R.restaurant_name, R.city, AVG(V.rating) AS Average_Rating, COUNT(V.review_id) AS Total_Reviews 
FROM Restaurants AS R
INNER JOIN RestaurantReviews AS V
ON R.restaurant_id = V.restaurant_id
GROUP BY R.restaurant_id, R.city
HAVING Avg(V.rating) > 4;

SELECT * FROM TopRatedRestaurants;


--- Direct Updating Through View ---
UPDATE TopRatedRestaurants
SET Average_Rating = 5
WHERE restaurant_name = 'Spice Garden';

-- I got the Error Code 1288. The view 'TopRatedRestaurants' uses aggregates (AVG, COUNT) and a GROUP BY clause.
-- Basically SQL views are virtual tables — they don’t store data, they just represent a query result.
-- Because of that, the database cannot map a direct update back to the underlying rows in Reviews.


--- View DailyOrderSummary --- 
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    RestaurantID INT,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID)
);

-- Insert sample values
INSERT INTO Orders (OrderDate, CustomerID, RestaurantID, TotalAmount)
VALUES ('2026-06-30', 101, 201, 450.00),
	   ('2026-07-03', 102, 202, 300.00),
	   ('2026-07-03', 103, 203, 150.00),
	   ('2026-07-22', 104, 204, 600.00),
	   ('2026-07-22', 105, 205, 250.00);

CREATE VIEW DailyOrderSummary AS
SELECT OrderDate, COUNT(OrderID) AS TotalOrders, SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate >= (CURDATE() - INTERVAL 30 DAY)
GROUP BY OrderDate;

SELECT * FROM DailyOrderSummary;



--- 3 Good Practices for SQL View --- 

-- Here are 3 best practices with Flipkart sales reporting examples:

-- 1) Use clear naming conventions  
-- Example: Instead of View1, name it FlipkartDailySalesSummary so analysts instantly know its purpose.

-- 2) Filter data at the source  
-- Example: Create a view that only includes WHERE OrderDate >= CURRENT_DATE - INTERVAL '90 DAY' to avoid 
-- loading unnecessary old Flipkart sales data.

-- 3) Pre-aggregate for performance  
-- Example: Store SUM(SalesAmount) grouped by Category in a view (FlipkartCategoryRevenue) so dashboards 
-- don’t repeatedly compute totals on raw transactions.

CREATE DATABASE Case_Study;
USE Case_Study;


-- Task 1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala, showing their name, average rating, and number of votes 

select name as Restaurant, round(avg(rate)) as Avg_Rating, sum(votes) as No_Of_Votes from zomato_bangalore_restaurant
where location = 'Koramangala'
group by name, location
order by Avg_Rating desc
limit 5;

-- even within the same location (Koramangala), the same restaurant name appeared multiple times with different ratings and vote counts


-- Task 2. create an SQL query that lists all unique cuisines available in Indiranagar along with the count of restaurants offering each cuisine.

Select cuisines as Unique_Cuisines, count(name) as Total_Restaurants 
from zomato_bangalore_restaurant
where location = 'Indiranagar'
group by Unique_Cuisines;

-- Count: cuisines at Indiranagar = 2081, unique cuisines = 363 


-- Task 3. Write an SQL query to calculate the average cost for two people for each restaurant type (such as 'Cafe', 'Casual Dining', etc.) and 
-- order the results from most to least expensive. 

Select rest_type, avg(approx_cost_for_two) as average_cost_for_two_people
from zomato_bangalore_restaurant
group by rest_type
order by average_cost_for_two_people desc;


-- Task 4. Find all restaurants that have a rating below 3.0 but more than 200 votes

Select name as Restaurants, round(avg(rate)) as Rating, sum(votes)
from zomato_bangalore_restaurant
where rate < 3.0 and votes > 200
group by name;

-- Took avg rating & total votes for same restaurants at all location


-- Task 5. Use ChatGPT to generate an SQL query that segments restaurants into three market categories: 
-- 'Budget' (cost for two < 500), 'Mid-range' (500-1500), and 'Premium' (>1500). 
-- Test and run the query on your dataset, and paste the working query in your submission. 

Select name as Restaurant, location, approx_cost_for_two,
case 
	when approx_cost_for_two < 500 then 'Budget'
    when approx_cost_for_two between 500 and 1500 then 'Mid-range'
    when approx_cost_for_two > 1500 then 'Premium'
    else 'Unknown'
end as Market_Category
from zomato_bangalore_restaurant;
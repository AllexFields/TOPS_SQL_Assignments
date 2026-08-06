Create database Section_B;
Use Section_B;

-- 1. Execute a query to retrieve the first 20 records from the orders table to verify data ingestion

Select * from orders
limit 20;


-- 2. Select Order ID, Order Date, Sales, and Profit, applying a column alias to display Sales as Total_Sales

Select `Order ID`, `Order Date`, Sales as Total_Sales, Profit  -- we use backticks (`) so that it can read column names even with spaces btw them
from orders;


-- 3. Filter the dataset to isolate all high-value transactions where the Sales figure exceeds 5000

Select `Order ID` as high_value_transactions, Sales
from orders
where sales > 5000; 


-- 4. Generate a report of the top 10 most profitable orders by sorting the records by Profit in descending order

Select `Order ID`, Sales, Profit
from orders
order by Profit desc
limit 10; 
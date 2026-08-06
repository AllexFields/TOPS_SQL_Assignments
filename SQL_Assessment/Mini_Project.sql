CREATE DATABASE superstore_db;
USE superstore_db;

-- Table Schema Creation
CREATE TABLE superstore (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    INDEX idx_region (region),
    INDEX idx_category (category, sub_category),
    INDEX idx_order_date (order_date)
);


-- Data Load = Data Ingested using Python Script (ingestion_db_Mini_Project)
select count(*) 
from superstore;   -- count of rows = 9994


-- Nulls / bad rows
select COUNT(*) 
from superstore 
where `Order Date` is null or sales is null;   -- 0 Null Rows found


-- Duplicate check
select `Row ID`, COUNT(*) 
from superstore 
group by `Row ID` having COUNT(*) > 1;    -- No Duplicates Found


-- Sanity ranges
select MIN(sales), MAX(sales),MIN(discount), MAX(discount), MIN(profit), MAX(profit) 
from superstore;       -- min profit = -6599.978 suggests loss


-- Category Analyis >> Sales vs Profit
select 
	Category, 
    round(sum(sales),2) as Total_Sales, 
    round(sum(Profit),2) as Total_Profit
from superstore
group by Category
order by Total_Profit desc;     -- Technology >> Highest Sales with Highest Profit



-- High-discount, loss-making transactions for each segment

select 
	count(`Row ID`) Total_Orders, 
    Segment
from superstore
group by Segment;   -- Total_Orders >> Consumer = 5191, Corporate = 3020, Home Office = 1783


with segment_wise_loss_making_transactions as (
	select 
		Segment, 
        `Order ID`, 
        Discount, 
        Profit
	from superstore
	where Discount > 0.6   -- Max Discount is 0.8 (80%)
	and profit < 0
	order by profit desc)
    select Segment, count(distinct `Order ID`) as Total_loss_making_transactions 
    from segment_wise_loss_making_transactions
    group by Segment
    order by Total_loss_making_transactions desc;     -- Total_loss_making_transactions per each segment >> Consumer = 313, Corporate = 180, Home Office = 101
    

--  Aggregated performance report by region 
Select
	Region,
    count(distinct `Order ID`) as total_orders,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(sum(profit) / sum(sales) * 100, 2) as profit_margin_pct,
    round(avg(discount), 3) as avg_discount
from superstore
group by region
order by profit_margin_pct asc;       -- West is the best performing Region >> Central Region is least profit generating region among these 4 regions
									  -- with highest avg_discount and lowest profit_margin percentage
                                      
                        

-- Loss-making transactions summary                                      
select
    region,
    category,
    `Sub-Category`,
    count(*) as loss_transactions,
    round(sum(profit),2) as total_loss,
    round(avg(discount), 3) as avg_discount_on_losses
from superstore
where profit < 0
group by region, category, `Sub-Category`
order by total_loss asc;



-- >> Problem Statement: Identify underperforming product categories and regions 
-- 	                     by analyzing the relationship between discount rates and net profit margins. 

-- >> Findings:- 1) Technology >> Highest Sales with Highest Profit & Furniture is the least profit making category
-- 				 2) Total_loss_making_transactions per each segment >> Consumer = 313, Corporate = 180, Home Office = 101
--               3) West is the best performing Region >> Central Region is least profit generating region among these 4 regions
--                  with highest avg_discount and lowest profit_margin percentage
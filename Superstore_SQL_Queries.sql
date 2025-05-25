create database superstore_data;
use superstore_data;

-- Total Sales
SELECT 
    SUM(sales) AS Total_Sales
FROM
    store_data;

-- Total Sales by Region 
SELECT 
    Region, SUM(sales) AS Total_Sales_by_Region
FROM
    store_data
GROUP BY Region;

-- Total Sales by Catagory
SELECT 
    Category, SUM(sales) AS Totol_Sales_by_Catagory
FROM
    store_data
GROUP BY category;

-- Monthly Sales Trend
SELECT 
    YEAR(`order date`) AS Year,
    MONTH(`order date`) AS Month_number,
    DATE_FORMAT(MIN(`order date`), '%M') AS Month_Name,
    SUM(Sales) AS Monthly_Sales
FROM
    store_data
GROUP BY Year , Month_number
ORDER BY Year , Month_number;

-- Top 5 Products by Profit
SELECT 
    `product name`, ROUND(SUM(profit), 2) AS Total_Profit
FROM
    store_data
GROUP BY `product name`
ORDER BY Total_Profit DESC
LIMIT 5;

-- Segment wise Sales and Profit
SELECT 
    segment,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM
    store_data
GROUP BY segment;

-- Discount Impact on Profit
select discount, round(avg(profit),2) as Avg_Profit
from store_data
group by discount
order by discount;





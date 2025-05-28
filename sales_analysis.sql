create database company;

use company;

select * from sales;

-------- 1. find all  the orders shipped via 'Economy' mode with a total amount greater than 25000------------
select * from sales 
where Ship_Mode = 'Economy' and Total_Amount>25000;

-------- Retrive all sales data for 'Technology' category in 'Ireland' made after 2020-01-01 ---------------
select * from sales 
where Category = 'Technology'and Country = 'Ireland' and Order_Date > '2020-01-01';

--------- list the top 10 most profitable sales transactions in descending oeder ---
select * from sales order by Unit_Profit desc limit 10;


select * from sales order by Unit_Profit desc limit 10, 20; ------ skip 10 records showing next 20 records

----------- find all customers whose name starts with 'J' and ends with 'n' ------------

select Order_id, Customer_name from sales where Customer_name like 'J%n';

-------- Retrive all product names that contains 'Acco' anywhere in the name --------
select Order_id, Product_name  from sales where Product_name like '%Acco%';

-----------  get the top 5 cities with highest total sales amount ----------
select City, sum(Total_Amount) as total_sales from sales 
group by city order by sum(Total_Amount) desc limit 5;

-------------- display the second set of 10 records for customer name and total amount in decreasing order ------
select Customer_Name , Total_Amount from sales order by Total_Amount desc limit 10, 10;


-------------- find the total revence, average unit cost, and total number of oders -------
select sum(Total_Amount) as Total_Revenue, 
avg(Unit_Cost) as Avg_Unit_Cost, count(Order_ID) as Total_Orders from sales;
 
-------- count unique number of regions ----------
select count(distinct(Region)) as Count_Unique_Region from sales;

-------------- find the number of orders placed by each customers --------------
select Customer_Name, count(Order_id) as Order_Count from sales 
group by Customer_Name
order by Order_Count desc;

----------------- Rank 5 products based on total sales using Rank() -------------
select Product_Name, sum(Total_Amount) as Total_Sales,
Rank() over (order by sum(Total_Amount) desc) as Sales_Rank
from sales
group by Product_Name limit 5;



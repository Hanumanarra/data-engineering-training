SUBQUERIES

	-# FROM CLAUSE
	
#1 Rank Customers Based on there total Amount of sales

select 
*,
rank() over(order by total_sales desc)as Customer_rank

from 
	(select 
	customer_id,
	sum(amount) as total_sales
	from Orders
	group by customer_id)

2.fIND THE products that have a price higher than the average price of all products

  
select *
from
	(SELECT
	order_id,
	item,
	amount,
	avg(amount) over() as Avg_amount
	from Orders)
where amount>Avg_amount

-#SELECT CLAUSE
	

1.show order_id,item,amount and total_sales of products from Orders
	
 very Imp Point # in SELECT CLAUSE WE CAN USE ONLY SCALAR SUBQUERYS ONLY
	
select 
	order_id,
	item,
	amount,
	(select count(*) as Total_order from Orders) Total_sales
from Orders;

-Join Clause


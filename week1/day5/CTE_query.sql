1.Find the Total Sales per customer

with CTE_total_sales as
(
select 
  customer_id,
  sum(amount) as total_amount
from Orders
group by customer_id
)

select 
c.customer_id,
c.first_name,
c.last_name,
cts.total_amount
from Customers c
left join CTE_total_sales cts
on c.customer_id=cts.customer_id

2.using Multiple CTE

with CTE_total_sales as
(
select 
  customer_id,
  sum(amount) as total_amount
from Orders
group by customer_id
)
,CTE_max_item as
(
select
  customer_id,
  Max(item) as  Max_item
from Orders
group by customer_id
)

select 
c.customer_id,
c.first_name,
c.last_name,
cts.total_amount,
cta.max_item
from Customers c
left join CTE_total_sales cts
on c.customer_id=cts.customer_id
left join CTE_max_item cta
on c.customer_id=cta.customer_id


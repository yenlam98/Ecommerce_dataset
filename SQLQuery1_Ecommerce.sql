/****** Quick view data  ******/
SELECT top 100 *
  FROM [PortfolioProject].[dbo].[Amazon Sale Report]
  

  /*I. Clean data*/
  --1. Check if any null/blank value from used columns:
 SELECT 
 sum(case when Category is null then 1 else 0 end) as Category,
 sum(case when Size is null then 1 else 0 end) as Size,
 sum(case when Date is null then 1 else 0 end) as Date,
 sum(case when Status is null then 1 else 0 end) as Status,
 sum(case when Fulfilment is null then 1 else 0 end) as Fulfilment,
 sum(case when SKU is null then 1 else 0 end) as SKU,
 sum(case when [Courier_Status] is null then 1 else 0 end) as CourierStatus,
 sum(case when Amount is null then 1 else 0 end) as Amount,
 sum(case when Qty is null then 1 else 0 end) as Qty,
 sum(case when Currency is null then 1 else 0 end) as Currency,
 sum(case when [ship_service_level] is null then 1 else 0 end) as ship_service_level,
 sum(case when [ship_city] is null then 1 else 0 end) as ship_city,
 sum(case when [ship_state] is null then 1 else 0 end) as ship_state,
 sum(case when [fulfilled_by] is null then 1 else 0 end) as Fulfill_by
  FROM [PortfolioProject].[dbo].[Amazon Sale Report] -- no null => check blank

SELECT 
 sum(case when Category = ' ' then 1 else 0 end) as Category,
 sum(case when Size = ' ' then 1 else 0 end) as Size,
 sum(case when Date = ' ' then 1 else 0 end) as Date,
 sum(case when Status = ' ' then 1 else 0 end) as Status,
 sum(case when Fulfilment = ' ' then 1 else 0 end) as Fulfilment,
 sum(case when SKU = ' ' then 1 else 0 end) as SKU,
 sum(case when [Courier_Status] = ' ' then 1 else 0 end) as CourierStatus,
 sum(case when Amount = ' ' then 1 else 0 end) as Amount,
 sum(case when Qty = ' ' then 1 else 0 end) as Qty,
 sum(case when Currency = ' ' then 1 else 0 end) as Currency,
 sum(case when [ship_service_level] = ' ' then 1 else 0 end) as ship_service_level,
 sum(case when [ship_city] = ' ' then 1 else 0 end) as ship_city,
 sum(case when [ship_state] = ' ' then 1 else 0 end) as ship_state,
 sum(case when [fulfilled_by] = ' ' then 1 else 0 end) as Fulfill_by
  FROM [PortfolioProject].[dbo].[Amazon Sale Report] 
  -- => CourierStatus, Amount, Currency, ship_city, ship_state, Fulfill_by are columns with blank

  --2. Fill blank with value or remove if unneccessary:
  ----a) Courier Status:
  alter table [PortfolioProject].[dbo].[Amazon Sale Report] 
  add Courier_Status varchar(50) 
  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set Courier_Status = [Courier Status]

  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set Courier_Status = 'NA' where Courier_Status = ' '

  select Courier_Status
  from [PortfolioProject].[dbo].[Amazon Sale Report] --done for Courier Status

  ----b) Amount:
  select distinct (Courier_Status)
  from [PortfolioProject].[dbo].[Amazon Sale Report] 
  where Amount = ' ' --Result shows blank when courier_status are unshipped, NA or Cancelled => Fill blank with 0

  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set Amount = 0 where Amount = ' '

  ----c) Currency:
  select *
  from [PortfolioProject].[dbo].[Amazon Sale Report] 
  where Currency = ' '
  order by Currency --Result shows blank when Amount = 0 => Fill blank with INR

  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set Currency = 'INR' where Currency = ' '

  ----d) ship_city:
  select *
  from [PortfolioProject].[dbo].[Amazon Sale Report] 
  where [ship_city] = ' '
  order by [ship_city] --Don't know why it's missing => replace by NA

  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set [ship_city] = 'NA' where [ship_city] = ' '

  ----e) ship_state:
  select *
  from [PortfolioProject].[dbo].[Amazon Sale Report] 
  where [ship_state] = ' '
  order by [ship_state] --Don't know why it's missing, replace by NA

  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set [ship_state] = 'NA' where [ship_state] = ' '

  ----f) fulfilled_by:
  select *
  from [PortfolioProject].[dbo].[Amazon Sale Report] 
  where [fulfilled_by] = ' '
  order by [fulfilled_by]  --Replace blank by "Other"
  
  update [PortfolioProject].[dbo].[Amazon Sale Report] 
  set [fulfilled_by] = 'Other' where [fulfilled_by] = ' '

  /*II. Sales overview*/
  --1. Sales per month:

  create table CTE_Sale (month float,total_sales float)
  insert into CTE_Sale
  select month(cast ([Date] as date)) as month, sum (cast (Amount as float)) as total_sales
  from [PortfolioProject].[dbo].[Amazon Sale Report]
  group by month(cast ([Date] as date)) order by 1 
  
  select * from CTE_Sale
  order by 1

  select month, round(sum(total_sales),2) as total_sales,
  case when (lag(sum(total_sales),1,0) over (order by month))= 0 then null else round((sum(total_sales)/(lag(sum(total_sales),1,0) over (order by month)))*100 - 100,2) end percent_sales
  from CTE_Sale
  group by month

  --2. Sales by category:
  select Category, round (sum (cast (Amount as float)),2) as Sales,
  round(sum (cast (Amount as float))/(select sum (cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report]),2) as Percent_sales
  from [PortfolioProject].[dbo].[Amazon Sale Report]
  group by Category
  order by 2 DESC

  --3. Avg Price per category:
 Select category, round(sum(cast (Amount as float))/sum(cast (Qty as float)),2) as Avg_Price
 from [PortfolioProject].[dbo].[Amazon Sale Report]
 group by category order by 2 DESC

  --4. Sales by Size:
  select Size, round (sum (cast (Amount as float)),2) as Sales,
  round(sum (cast (Amount as float))/(select sum (cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report]),2) as Percent_sales
  from [PortfolioProject].[dbo].[Amazon Sale Report]
  group by Size
  order by 2 DESC

  --5. Sales by Top 10 State
 select  top 10 
 ship_state, 
  sum (cast (Amount as float)) as Sales,
  round(sum (cast (Amount as float))/(select sum (cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report]),2) as Percent_sales
  from [PortfolioProject].[dbo].[Amazon Sale Report]
  group by ship_state
  order by 2 DESC

  /*III. Check fulfillment on Amazon and Merchant*/
  --1. Sales by Fulfilment:
select Fulfilment,
sum (cast (Amount as float)) as Sales,
round(sum (cast (Amount as float))/(select sum (cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report]),2) as Percent_sales
from [PortfolioProject].[dbo].[Amazon Sale Report]
group by Fulfilment
order by 2 DESC

  --2. Sales by Status for each fulfillment:
  --Remark: Change Status to 3 category: shipped, cancelled, and pending for an easier check
alter table [PortfolioProject].[dbo].[Amazon Sale Report]
add Status_3cat nvarchar(50)
update [PortfolioProject].[dbo].[Amazon Sale Report]
set Status_3cat =
case 
when Status = 'Cancelled' then 'Cancelled'
when Status = 'Pending' or Status = 'Pending - Waiting for Pick Up' then 'Pending'
else 'Shipped' end 

  ----a) Check Status by value:
select a.Status_3cat, a.Amazon, b.Merchant 
from
(select Status_3cat, sum (cast (Amount as float)) as Amazon
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Amazon' 
group by Status_3cat) a
full outer join 
(select Status_3cat, sum (cast (Amount as float)) as Merchant
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Merchant' 
group by Status_3cat) b
on a.Status_3cat = b.Status_3cat 
order by Status_3cat

  ----b) Check Status by percent:
select a.Status_3cat, round(a.Percent_Amazon_sales,2) as Percent_Amazon_sales, round(b.Percent_Merchant_sales,2) as Percent_Merchant_sales
from
(select Status_3cat, 
sum (cast (Amount as float))/(select sum(cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report] where Fulfilment = 'Amazon') as Percent_Amazon_sales
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Amazon' 
group by Status_3cat) a
full outer join 
(select Status_3cat, 
sum (cast (Amount as float))/(select sum(cast (Amount as float)) from [PortfolioProject].[dbo].[Amazon Sale Report] where Fulfilment = 'Merchant') as Percent_Merchant_sales
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Merchant' 
group by Status_3cat) b
on a.Status_3cat = b.Status_3cat 
order by Status_3cat

  --3. Check fulfilled by for each fulfillment:
select a.fulfilled_by, a.Merchant, b.Amazon
from
(select fulfilled_by, sum (cast (Amount as float)) as Merchant
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Merchant' 
group by fulfilled_by) a
full outer join 
(select fulfilled_by, sum (cast (Amount as float)) as Amazon
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Amazon' 
group by fulfilled_by) b
on a.fulfilled_by = b.fulfilled_by 
order by fulfilled_by

  --4. Check ship_service_level for each fulfillment:
select a.ship_service_level, a.Amazon, b.Merchant
from
(select ship_service_level, sum (cast (Amount as float)) as Amazon
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Amazon' 
group by ship_service_level) a
full outer join 
(select ship_service_level, sum (cast (Amount as float)) as Merchant
from [PortfolioProject].[dbo].[Amazon Sale Report]
where Fulfilment = 'Merchant' 
group by ship_service_level) b
on a.ship_service_level = b.ship_service_level 
order by ship_service_level
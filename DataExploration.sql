select *
from SalesData
order by 4 desc
-------------------
--Data Cleaning
--Order Date
Alter table SalesData
Add Order_Date date
Alter table SalesData
Add Order_Time time

update SalesData
Set Order_Date = Convert(Date,OrderDate),
Order_Time = CONVERT(Time,OrderDate)

Alter table SalesData
drop column OrderDate

Alter table SalesData
drop column Order_Year
Alter table SalesData
drop column Order_Month
-------------------
Alter table SalesData
Add Order_Year varchar(10)
Alter table SalesData
Add Order_Month varchar(10)

update SalesData
Set Order_Year = Format(Order_Date,'yyyy'),
Order_Month = Format(Order_Date,'MM')

--------------
--Data Exploration
--Total Sales
select round(sum(Sales),2) as TotalSales$
from SalesData

--Maximum and Minumum Cities that we sell at
select MAX(City) as MaximumOrderCity
from SalesData

select Min(City) as MinimumOrderCity
from SalesData

--Total Sales by City
Select City , round(sum(sales),2) as TotalSales$
from SalesData
group by City
order by TotalSales$ Desc

--Total Sales by year
Select Order_Year , round(sum(sales),2) as TotalSales$
from SalesData
group by Order_Year
order by 2 Desc

--Total Sales by Month
Select Order_Month , round(sum(sales),2) as TotalSales$
from SalesData
group by Order_Month
order by 2 Desc

--Total Sales by Product
Select Product , round(sum(sales),2) as TotalSales$
from SalesData
group by Product
order by 2 Desc

--Total Orders by Product
Select Product , count(Product) as TotalOrdered
from SalesData
group by Product
order by 2 Desc

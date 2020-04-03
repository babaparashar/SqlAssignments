--Table Used: 
--===========
--student (studentid, rollno, fname, sname, surname, admitdate, birthdate, standard, gender)

select (UPPER(SUBSTRING(FirstName,1,1))+SUBSTRING(FirstName,2,50)+' '
+UPPER(SUBSTRING(SecondName,1,1))+SUBSTRING(SecondName,2,50)+' ' 
+ UPPER(SUBSTRING(SurName,1,1))+SUBSTRING(SurName,2,50) )as FullName from Students 
Where Gender = 'Male' and FirstName like '%h';



--===============

--Tables Used:
--===========

--1) product (productid, mfrid, description, price, qtyonhand)

--2) orders (ordersid, customerid, orderdate, salesrepsid, productid, qty, amount)

--3) customer (customerid, company, salesrepsid, creditlimit)

--4) salesreps (salesrepsid, name, officeid, designation, hiredate, manager, quota, sales, age)

--5) office (officeid, city, region, manager, targetsales, actualsales)

declare @total int
select @total = count(CostomerId) from Costomers
print @total
SELECT   dbo.Salesreps.Name, dbo.Offices.City, dbo.Salesreps.Hiredate , @total as TotalCostomer
FROM dbo.Salesreps INNER JOIN
dbo.Offices ON dbo.Salesreps.OfficeId = dbo.Offices.OfficeId inner join
dbo.Costomers ON dbo.Salesreps.SalesrepId = dbo.Costomers.CostomerId
where Offices.City like '%pur' and Salesreps.Hiredate > '2006-1-1' and Salesreps.Age > 21
and  @total > 2







SELECT dbo.Costomers.Company, dbo.Salesreps.Name, dbo.Offices.City, dbo.Costomers.CreditLimit 
  FROM  dbo.Salesreps INNER JOIN
  dbo.Offices ON dbo.Salesreps.OfficeId = dbo.Offices.OfficeId INNER JOIN
   dbo.Costomers ON dbo.Salesreps.SalesrepId = dbo.Costomers.CostomerId



 .

declare @total int 
select @total = count(SalesrepId) from Salesreps
declare @Diff int
select @Diff =  (cast (TragetSales as int)- cast (ActualSales as int))  from Offices 
print @Diff
SELECT dbo.Offices.City,@total as NoOfSalesRep ,  dbo.Salesreps.Sales, dbo.Offices.TragetSales, dbo.Offices.ActualSales ,@Diff As Difference
FROM  dbo.Offices INNER JOIN
  dbo.Salesreps ON dbo.Offices.OfficeId = dbo.Salesreps.OfficeId





declare @Total int 
select @total = COUNT(OrderId) from Orders
declare @price int 
select @price = Price from Products
declare @Qun int
select @Qun = cast (Quntity as int) from Orders
declare @amount int
set @amount = @price * @qun
print @amount
SELECT dbo.Salesreps.Designation, dbo.Products.Price, dbo.Products.Qtyonhand,@total as Orders, dbo.Orders.Quntity ,@amount As TotalAmount
FROM  dbo.Salesreps INNER JOIN
   dbo.Orders ON dbo.Salesreps.SalesrepId = dbo.Orders.SalesrepId INNER JOIN
   dbo.Products ON dbo.Orders.ProductId = dbo.Products.ProductId





declare @price int 
select @price = Price from Products
declare @Qun int
select @Qun = cast (Quntity as int) from Orders
declare @amount int
set @amount = @price * @qun
print @amount
select Company , @Qun As TotalQuantity , @amount as TotalAmount  from Costomers





declare @date date
set @date = dateAdd(year,-5,getdate())
select Name ,Hiredate,Quota,Sales from Salesreps where Hiredate > @date


select p.description, sum(o.customerid) from
product as p left join order as o
on p.productid=o.productid
left join customer as c
on o.customerid=c.customerid
groupby(o.productid)
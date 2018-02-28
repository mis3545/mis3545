USE AdventureWorks2012;
/*Show from the Production.Product table, the names, product numbers, and list price of all products whose list price is over $500. Order the output in ascending order of list price.*/

Select Name, ProductNumber, ListPrice
From AdventureWorks2012.Production.Product
Where ListPrice > 500
Order by ListPrice;


/*Show the total sales for each territory during the month of August 2007. Use the order date and total due from the Sales.SalesOrderHeader table and the Name from the Sales.SalesTerritory table. Sort the output alphabetically (A to Z) by the name of the sales territory*/

Select t.Name, sum(TotalDue) as TotalSalesAug2007
From AdventureWorks2012.Sales.SalesOrderHeader as h
join AdventureWorks2012.Sales.SalesTerritory as t
on h.TerritoryID = t.TerritoryID 
where year(h.OrderDate)=2007 and month(h.OrderDate)=8
Group by t.Name
Order by t.Name;

/*Show all vendors who have supplied more than three different products to AdventureWorks.Your output should show the name of the vendor (which comes from the Purchasing.Vendor table and the number of different products that vendor supplied (which products are supplied by which vendor is obtained from the Purchasing.ProductVendor table), displayed in decreasing order of the number of products supplied.The Vendor and ProductVendor tables are related through the BusinessEntityID field, which is a foreign key in the ProductVendor table and the primary key of the Vendor table.*/

Select p.Name, Count(DISTINCT v.ProductID) as Number
From AdventureWorks2012.Purchasing.Vendor as p
Join AdventureWorks2012.Purchasing.ProductVendor as v
on p.BusinessEntityID = v.BusinessEntityID
Group by p.Name
Having Count(DISTINCT v.ProductID)>3
Order by Number DESC;
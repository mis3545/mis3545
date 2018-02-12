Use AdventureWorks2012;
/*Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */

Select JobTitle, COUNT(BusinessEntityID) AS Number_of_Employees
From HumanResources.Employee
Where CurrentFlag = 1
Group By JobTitle
ORDER BY Number_of_Employees DESC;

/*Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */

Select JobTitle, COUNT(BusinessEntityID) AS Number_of_Employees
From HumanResources.Employee
Where CurrentFlag = 1
Group By JobTitle
HAVING COUNT(BusinessEntityID) > 1
ORDER BY Number_of_Employees DESC;



/*For each product, show its ProductID and Name (from the ProductionProduct table) and the location of its inventory (from the Product.Location table) and amount of inventory held at that location (from the Production.ProductInventory table).*/

select pp.ProductID, 
		pp.Name as product_name, 
		pl.Name as location_name, 
		i.Quantity
From Production.Product as pp 
	inner join Production.ProductInventory as i
		on pp.ProductID = i.ProductID
	inner join Production.Location as pl
		on pl.LocationID = i.LocationID
order by pl.Name;





/*Find the product model IDs that have no product associated with them. */ 
/*To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID from the ProductModel table always shows, even if there is no product associate with it. */
/*Then, add a WHERE clause to specify that the ProductID IS NULL */


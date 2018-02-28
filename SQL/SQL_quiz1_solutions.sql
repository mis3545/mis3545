USE AdventureWorks2012;

/*a.	A customer has $1000 budget to spend on a single bike. Show the Product ID, Product Name, Price, and Color of each bike that she can purchase. These should be sorted by price in ascending order. */

SELECT p.ProductID, p.Name AS Product_Name, p.ListPrice, p.Color
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.ListPrice <= 1000 AND ps.ProductCategoryID = 1
ORDER BY p.ListPrice ASC;

/*b.	Show First name and last name of employees whose job title is “Sales Representative”, ranking from oldest to youngest. */
SELECT p.FirstName, p.LastName
FROM HumanResources.Employee as e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.JobTitle = 'Sales Representative'
ORDER BY DATEDIFF(year, e.BirthDate, GETDATE());



/*c.	Show the product ID, product name, and list price for each product where the list price is higher than the average list price for all products. */
SELECT p.ProductID, p.Name, p.ListPrice
FROM Production.Product AS p
WHERE p.ListPrice > 
	(SELECT AVG(ListPrice) 
	FROM Production.Product);



/*d.	Show the product category name, subcategory name, product name, and product ID for all products that belong to a category and subcategory. These should be sorted alphabetically by category name, within category by subcategory name, and within subcategory by product name. */
SELECT pc.Name AS Product_Category_Name, ps.Name AS Product_Subcategory_Name, p.Name AS Product_Name, p.ProductID
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
ORDER BY Product_Category_Name, Product_Subcategory_Name, Product_Name;



/*e.	Modify the query above (query d) so that it includes only those products that do not belong to a category or subcategory. */
SELECT pc.Name AS Product_Category_Name, ps.Name AS Product_Subcategory_Name, p.Name AS Product_Name, p.ProductID
FROM Production.Product AS p
LEFT OUTER JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT OUTER JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE ps.ProductSubcategoryID IS NULL OR pc.ProductCategoryID IS NULL
ORDER BY Product_Category_Name, Product_Subcategory_Name, Product_Name;

/*f.	(bonus question) Find out the largest orders in each territory (in terms of total due) and their associated credit card numbers.*/

SELECT st.name AS 'Location'
,ss.TotalDue AS 'Top_Sale'
,cc.CardNumber
FROM Sales.CreditCard AS cc
JOIN Sales.SalesOrderHeader AS ss 
	ON ss.CreditCardID=cc.CreditCardID
JOIN Sales.SalesTerritory AS st 
	ON ss.TerritoryID=st.TerritoryID
Join (
	SELECT MAX(ss.TotalDue) AS 'Top_Sale', st.Name
	FROM Sales.SalesOrderHeader AS ss 
	JOIN Sales.SalesTerritory AS st ON ss.TerritoryID=st.TerritoryID
	GROUP BY st.Name
) as T 
	On ss.TotalDue = T.Top_Sale AND st.Name = T.Name
ORDER BY Location;

USE AdventureWorks2012; /*Set current database*/


/*1, Display the total amount collected from the orders for each order date. */
SELECT OrderDate, SUM(TotalDue) as Daily_Amount,
COUNT(SalesOrderID) as Number_of_Orders
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
ORDER BY SUM(TotalDue) DESC;


/*2, Display the total amount collected from selling the products, FROM 700 to 800. Only list those products that have been sold more than 3000 units.*/
SELECT ProductID, SUM(LineTotal) as Total_Amount,
AVG(UnitPrice) as Avg_Unit_Price,
MAX(UnitPrice) as Max_Unit_Price,
Min(UnitPrice) as Min_Unit_Price,
SUM(OrderQty) as 'Total Number of Units Sold'
FROM Sales.SalesOrderDetail
WHERE ProductID Between 700 and 800
GROUP BY ProductID
HAVING SUM(OrderQty)>3000
ORDER BY SUM(OrderQty) DESC;


/*3, Write a query to display the sales person BusinessEntityID, last name and first name of ALL the sales persons and the name of the territory to which they belong, even though they don't belong to any territory.*/

SELECT SP.BusinessEntityID, 
		P.FirstName, 
		P.LastName, 
		ST.Name as Territory
FROM Sales.SalesPerson as SP
FULL OUTER JOIN Sales.SalesTerritory as ST
On SP.TerritoryID = ST.TerritoryID
JOIN Person.Person as P
ON SP.BusinessEntityID = P.BusinessEntityID;


/*4,  Write a query to display the names of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/
SELECT Person.BusinessEntityID, CardType,
	LastName, FirstName
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.CreditCard.CreditCardID = Sales.PersonCreditCard.CreditCardID
JOIN Person.Person
ON Sales.PersonCreditCard.BusinessEntityID=Person.BusinessEntityID
WHERE CardType = 'Vista';



/*5, Then show the number of customers for each type of credit cards.*/
SELECT CardType, COUNT(BusinessEntityID) as Number_of_Customers
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.CreditCard.CreditCardID = Sales.PersonCreditCard.CreditCardID
GROUP BY CardType;


/*6, Write a query to display ALL the product names along with their corresponding subcategory names.*/
/* Tables: Production.Product, Production.ProductSubcategory*/
SELECT pc.Name AS Product_Category_Name, ps.Name AS Product_Subcategory_Name, p.Name AS Product_Name, p.ProductID
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
ORDER BY Product_Category_Name, Product_Subcategory_Name, Product_Name;



/*7. List ALL the product names that do not belong to any subcategory.*/

SELECT ps.Name AS Product_Subcategory_Name, p.Name AS Product_Name, p.ProductID
FROM Production.Product AS p
LEFT OUTER JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.ProductSubcategoryID IS NULL 
ORDER BY Product_Name;

/*8, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders. You need to use subquery. */
SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 
      (
		SELECT AVG(TotalDue)
		FROM Sales.SalesOrderHeader
	  )
ORDER BY TotalDue;
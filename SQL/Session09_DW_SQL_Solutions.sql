USE AdventureWorksDW2012;

/* Total Amount of off-line sales in each state(province)*/
SELECT SUM(FR.SalesAmount) as 'Total Amount'
	, DG.StateProvinceName as 'State'
FROM FactResellerSales as FR
	, DimReseller as DR
	, DimGeography as DG
WHERE FR.ResellerKey = DR.ResellerKey
	AND DR.GeographyKey = DG.GeographyKey
GROUP BY DG.StateProvinceName;

/* Total Amount of off-line sales in MA*/
SELECT SUM(FR.SalesAmount) as 'Total Amount in MA'
FROM FactResellerSales as FR
	, DimReseller as DR
	, DimGeography as DG
WHERE FR.ResellerKey = DR.ResellerKey
	AND DR.GeographyKey = DG.GeographyKey
	AND DG.StateProvinceName LIKE 'Mas%';

/* Employees whose birthday is in Febrary*/
SELECT *
FROM DimEmployee
WHERE Month(BirthDate) = 2;

/* Sales Reps whose birthday is in Febrary*/
SELECT FirstName, LastName, Title
FROM DimEmployee
WHERE MONTH(BirthDate) = 2 
	AND Title = 'Sales Representative';

/* List all the reseller sales processed by these two */
SELECT de.FirstName, de.LastName, fr.*
FROM FactResellerSales AS fr
	, DimEmployee AS de
WHERE Month(BirthDate) = 2
	AND de.Title = 'Sales Representative'
	AND de.EmployeeKey = fr.EmployeeKey;

/* WHO (between these two) is better in terms of total sales amount ? */
SELECT de.FirstName
	, de.LastName
	, ROUND(SUM(fr.SalesAmount), 2) as 'Total Amount'
FROM DimEmployee AS de
    , FactResellerSales AS fr
WHERE Month(BirthDate) = 2
    AND de.Title = 'Sales Representative'
    AND de.EmployeeKey= fr.EmployeeKey
GROUP BY de.FirstName, de.LastName
ORDER BY 'Total Amount' DESC;

/*Find a better way to measure the sales performance of these two sales reps*/
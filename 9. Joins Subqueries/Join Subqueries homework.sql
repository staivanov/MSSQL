--1.
SELECT E.EmployeeID, E.JobTitle, A.AddressID, A.AddressText
FROM [dbo].Employees AS E
INNER JOIN [dbo].[Addresses] AS A
ON E.AddressID = A.AddressID
ORDER BY A.AddressID ASC


--2.
SELECT TOP 50 E.[FirstName], E.[LastName],T.[Name], A.[AddressText]
FROM [dbo].Employees AS E
INNER JOIN [dbo].[Addresses] AS A
ON E.AddressID = A.AddressID
INNER JOIN [dbo].[Towns] AS T
ON A.[TownID] = T.[TownID]
ORDER BY E.[FirstName], E.[LastName] ASC


--3.
SELECT E.[EmployeeID], E.[FirstName], E.[LastName], D.[Name]
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[Departments] AS D
ON E.DepartmentID = D.DepartmentID
WHERE D.[Name] = 'Sales'
ORDER BY E.[EmployeeID] ASC


--4.
SELECT TOP 5 E.[EmployeeID], E.[FirstName], E.[Salary], D.[Name]
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[Departments] AS D
ON E.DepartmentID = D.DepartmentID
WHERE E.[Salary] > 15000
ORDER BY E.DepartmentID ASC

5.  

--6.
SELECT E.[FirstName], E.[LastName], E.[HireDate], D.[Name]
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[Departments] AS D
ON E.DepartmentID = D.DepartmentID
WHERE E.[HireDate] > '1.1.1999' AND D.[Name] IN ('Sales', 'Finance')
ORDER BY E.[HireDate] ASC


--7.
SELECT TOP 5 E.[EmployeeID], E.[FirstName], P.[Name], P.[StartDate], P.[EndDate]
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[EmployeesProjects] AS EP
ON E.[EmployeeID] = EP.[EmployeeID]
INNER JOIN [dbo].[Projects] AS P
ON EP.[ProjectID] = P.[ProjectID]
WHERE (P.[StartDate] > 13/08/2002) AND (P.[EndDate] IS NULL)
ORDER BY E.[EmployeeID] ASC




--8. !
 SELECT  E.[EmployeeID], E.[FirstName], P.[Name], P.[StartDate], P.[EndDate]
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[EmployeesProjects] AS EP
ON E.[EmployeeID] = EP.[EmployeeID]
INNER JOIN [dbo].[Projects] AS P
ON EP.[ProjectID] = P.[ProjectID]
WHERE E.[EmployeeID] = 24


--9.
SELECT E.[EmployeeID], E.[FirstName], E.[ManagerID]
	FROM [dbo].[Employees] AS E
WHERE E.[ManagerID] = 3 OR E.[ManagerID] = 7
ORDER BY  E.[EmployeeID] ASC


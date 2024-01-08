-- 2.
SELECT * 
FROM [dbo].[Departments]

--3.
SELECT [Name]
FROM [dbo].[Departments]

--4.
SELECT [FirstName], [LastName], [Salary]
FROM [dbo].Employees

--5.
SELECT [FirstName], [MiddleName], [LastName]
FROM [dbo].Employees

--6.
SELECT [FirstName] + '.' + [LastName] + '@softuni.bg' AS [Full Email Adress]
FROM [dbo].Employees
SELECT CONCAT([FirstName],'.', [LastName], '@softuni.bg')
FROM [dbo].Employees

--7.
SELECT DISTINCT Salary
FROM [dbo].[Employees]

--8.
SELECT *
FROM [dbo].[Employees]
WHERE [JobTitle] = 'Sales Representative'

--9.
SELECT [FirstName], [LastName], [Salary]
FROM [dbo].[Employees]
WHERE [Salary]  BETWEEN 20000 AND 30000

--10.
SELECT CONCAT([FirstName], ' ',[MiddleName], ' ',[LastName]) AS [Full Name]
FROM [dbo].[Employees]
WHERE [Salary] IN (25000, 1400, 12500)

--11.
SELECT [FirstName], [LastName]
FROM [dbo].[Employees]
WHERE [ManagerID] IS NULL

--12.
SELECT [FirstName], [LastName], [Salary]
FROM [dbo].[Employees]
WHERE [Salary] > 50000
ORDER BY [Salary] DESC

--13.
SELECT TOP 5 [FirstName], [LastName]
FROM [dbo].[Employees]
ORDER BY [Salary] DESC

--14.
SELECT TOP 5 [FirstName], [DepartmentID]
FROM [dbo].[Employees]
WHERE [DepartmentID] <> 4

--15.
SELECT *
FROM [dbo].[Employees]
ORDER BY [Salary] DESC,
[FirstName] ASC,
[LastName] DESC,
[MiddleName] ASC

--16.
CREATE VIEW V_EmployeesSalaries AS
SELECT [FirstName], [LastName], [Salary]
FROM [dbo].[Employees]

--17.
CREATE VIEW [dbo].[V_EmployeeNameJobTitle] AS
SELECT CONCAT([FirstName], ' ', [MiddleName],' ', [LastName]) AS [Full Name], [JobTitle]
FROM [dbo].[Employees]

--18.
SELECT DISTINCT [JobTitle]
FROM [dbo].[Employees]

--19.
SELECT TOP 10 *
FROM [dbo].[Projects]
ORDER BY [StartDate] ASC,
[Name] ASC

--20.
SELECT TOP 7 [Firstname], [LastName], [HireDate]
FROM [dbo].[Employees]
ORDER BY [HireDate] DESC


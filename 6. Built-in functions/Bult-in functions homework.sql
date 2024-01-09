--1.
SELECT FirstName, LastName
FROM [dbo].[Employees]
WHERE FirstName LIKE 'SA%'


--2.
SELECT FirstName, LastName
FROM [dbo].[Employees]
WHERE LastName LIKE '%EI%'


--3.
SELECT FirstName
FROM [dbo].[Employees]
WHERE (DepartmentID = 3 OR DepartmentID = 10) OR (HireDate BETWEEN 1995 AND 2005)


--4.
SELECT *
FROM [dbo].[Employees]
WHERE JobTitle NOT LIKE '%engineer%'


--5.
SELECT Name
FROM [dbo].[Towns]
WHERE LEN(Name) = 5 OR LEN(Name) = 6
ORDER BY Name ASC

--6.
SELECT [Name]
FROM [dbo].[Towns]
WHERE ([Name] LIKE 'K%') OR ([Name] LIKE 'M%') OR ([Name] LIKE 'B%') OR ([Name] LIKE 'E%')
ORDER BY Name ASC


--7.
SELECT [Name]
FROM [dbo].[Towns]
WHERE [Name] NOT LIKE 'R%' AND ([Name] NOT LIKE 'B%') AND ([Name] NOT LIKE 'D%')
ORDER BY Name ASC


--8.
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
FROM [dbo].[Employees]
WHERE HireDate > '2000/01/01'


--9.
SELECT FirstName, LastName
FROM [dbo].[Employees]
WHERE LEN(LastName) = 5


--10.
SELECT CountryName, IsoCode
FROM [dbo].[Countries]
WHERE  CountryName LIKE '%a%a%a%' 


--11.
SELECT p.PeakName, r.RiverName, LOWER(p.PeakName + r.RiverName) AS [Mix]
FROM [dbo].[Rivers] AS r, [dbo].[Peaks] AS p
ORDER BY Mix ASC


--12.
SELECT TOP 50 [Name], [Start]
FROM [dbo].[Games]
WHERE [Start] > '2011/1/1' AND [Start] < '2013'
ORDER BY [Start]


--13.
SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email) + 1, 20) AS [Email Provider]
FROM [dbo].[Users]
ORDER BY [Email Provider] ASC


--14.
SELECT Username, IpAddress
FROM [dbo].[Users]
WHERE [IpAddress] LIKE '___.1_%._%.___'
ORDER BY Username ASC


--15.
SELECT [Name], [Part of the Day] =
CASE
	WHEN DATEPART(HOUR, [Start]) >= 0 AND DATEPART(HOUR, [Start]) < 12 THEN 'Morning'
	WHEN DATEPART(HOUR, [Start]) >= 12 AND DATEPART(HOUR, [Start]) < 18 THEN 'Afternoon'
	WHEN DATEPART(HOUR, [Start]) >= 18 AND DATEPART(HOUR, [Start]) < 24 THEN 'Evening'
END,
[Duration] = 
CASE
	WHEN Duration <= 3 THEN 'Extra Short'
	WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
	WHEN Duration > 6 THEN 'Long'
	WHEN ISNULL(Duration, 0) = 0 THEN 'Extra Long'
END
FROM [dbo].[Games]
ORDER BY [Name] ASC


--16.
CREATE DATABASE Factory

CREATE TABLE Orders (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(50),
	OrderDate DATETIME
)

INSERT INTO Orders
VALUES ('Butter', '2016/09/19'),
('Milk','2016/09/30'),
('Cheese','2016/09/04'),
('Bread','2015-12-20'),
('Tomatoes','2015-12-30')

SELECT ProductName, OrderDate,
DATEADD(DAY, 3, OrderDate) AS [Pay Due], 
DATEADD(MONTH, 1, OrderDate) AS [Deliver Due]
FROM [dbo].[Orders]


--17.
CREATE TABLE People (
 Id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
 [Name] NVARCHAR(20) NOT NULL,
 Birthday DATETIME NOT NULL)

INSERT INTO [dbo].People
VALUES ('Victor','2000-12-07'),
('Steven','1992-09-10'),
('Stephne','1910-09-19'),
('John','2010-01-05')

SELECT Name, Birthday, DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP) AS [Age in Years], 
(DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP) * 12) AS [Age in Months],
DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP) * 365 AS [Age in Days],
DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP) * 525600 AS [Age in Minutes]
FROM [dbo].[People]


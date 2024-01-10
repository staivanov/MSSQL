--1.
SELECT COUNT(Id) As Count
FROM [dbo].[WizzardDeposits]


--2.
SELECT MAX(MagicWandSize) AS LongestMagicWand
FROM [dbo].[WizzardDeposits]

--3
.
SELECT  DepositGroup ,MAX(MagicWandSize) AS LongestMagicWand
FROM [dbo].[WizzardDeposits]
GROUP BY DepositGroup


--5.
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM [dbo].[WizzardDeposits]
GROUP BY DepositGroup


--6.
SELECT DISTINCT DepositGroup ,SUM(DepositAmount) AS [Total sum]
FROM [dbo].[WizzardDeposits]
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup 


--7.
SELECT DISTINCT DepositGroup , SUM(DepositAmount) AS [Total sum]
FROM [dbo].[WizzardDeposits]
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING (SUM(DepositAmount) < 150000)
ORDER BY SUM(DepositAmount) DESC


--8.
SELECT DISTINCT DepositGroup, MIN(DepositCharge) AS [Minimum deposit charge]
FROM [dbo].[WizzardDeposits]
GROUP BY DepositGroup

--9.
SELECT 
CASE WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END AS AgeGroup, COUNT(*) AS Wizzards
FROM [dbo].[WizzardDeposits]
GROUP BY 
CASE
WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END

--10.
SELECT LEFT(FirstName, 1) AS [FirstLetterName]
FROM [dbo].[WizzardDeposits]
WHERE DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName, 1)


--11.
SELECT DepositGroup, IsDepositExpired, AVG(DepositInterest) AS [AverageInterest]
FROM [dbo].[WizzardDeposits]
WHERE DepositExpirationDate > '1-1-1985'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC


--12.
SELECT COUNT(Salary) AS [Count]
FROM [dbo].[Employees]
WHERE ManagerID IS NULL


--13.
SELECT FirstName, LastName, DepartmentID
FROM [dbo].[Employees]
WHERE  Salary > (
 SELECT AVG(Salary)
 FROM [dbo].[Employees]
 WHERE DepartmentID > 0
 )
ORDER BY DepartmentID ASC


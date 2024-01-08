--2.
CREATE TABLE Minions(
Id INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(100) NOT NULL,
Age INT NOT NULL
)

CREATE TABLE Towns(
Id INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(100) NOT NULL
)

--3.
ALTER TABLE Minions
ADD TownsId INT NOT NULL

ALTER TABLE Minions
ADD CONSTRAINT FK_Minions FOREIGN KEY (TownsId)
REFERENCES Towns(Id)

--4.
INSERT INTO Towns
VALUES ('Sofia'),
	('Plovdiv'),
	('Varna')

INSERT INTO Minions
VALUES('Kevin', 22, 1),
		('Bob', 15, 3),
		('Steward', NULL, 2)

--5.
DELETE FROM Minions

--6.
DROP TABLE dbo.Minions
GO
DROP TABLE dbo.Towns
GO

--7.
CREATE TABLE Peope (
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(400)  NOT NULL,
Picture VARBINARY(MAX),
Height DECIMAL(3,2),
[Weight] DECIMAL(5,2),
Gender NVARCHAR(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX)
)

--8.
CREATE TABLE Users(
Id BIGINT PRIMARY KEY IDENTITY(1,1),
Username VARCHAR(30) UNIQUE  NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(900),
LastLoginTime DateTime2,
IsDeleted BIT
)

--9.
ALTER TABLE Users
DROP CONSTRAINT PK_Id
ALTER TABLE Users
ADD PRIMARY KEY (Id, Username)

--10.
ALTER TABLE Users
ADD CONSTRAINT CHK_UsernamePass CHECK ([Password] >= 5)

--11.
ALTER TABLE Users
ADD CONSTRAINT DF_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime

--12.
ALTER TABLE Users
DROP CONSTRAINT PK_Users
ALTER TABLE Users
ADD PRIMARY KEY (Id)
ALTER TABLE Users
ADD CONSTRAINT CHK_UsernameLength CHECK (Username >= 3)

--13.
CREATE TABLE Directors (
Id INT PRIMARY KEY IDENTITY(1,1),
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
GO

CREATE TABLE Genres (
Id INT PRIMARY KEY IDENTITY(1,1),
GenreName NVARCHAR(50) UNIQUE NOT NULL,
Notes NVARCHAR(MAX)
)
GO

CREATE TABLE Movies (
Id INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear INT,
[Length] INT,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating INT,
Notes NVARCHAR(MAX)
CONSTRAINT FK_DirectorMovie FOREIGN KEY (DirectorId)
REFERENCES Directors(Id)
)

ALTER TABLE Movies
ADD CONSTRAINT FK_CategorieMovie 
FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

--14.
CREATE DATABASE CarRental
CREATE TABLE Categories (
[Id] INT PRIMARY KEY IDENTITY(1,1),
[CategoryName] NVARCHAR(50) NOT NULL UNIQUE,
[DailyRate] INT,
[WeeklyRate] INT,
[MonthlyRate] INT,
[WeekendRate] INT
)

CREATE TABLE Cars(
[Id] INT PRIMARY KEY IDENTITY(1,1),
[PlateNumber] NVARCHAR(50) NOT NULL,
[Manufacturer] NVARCHAR(50) NOT NULL,
[Model] NVARCHAR(50) NOT NULL,
[CarYear] INT,
[CategoryId] INT NOT NULL,
[Doors] INT,
[Picture] VARBINARY(MAX),
[Condition] NVARCHAR(MAX),
[Avaible] BIT
)

CREATE TABLE Employees (
[Id] INT PRIMARY KEY IDENTITY(1,1),
[FirstName] NVARCHAR(50) NOT NULL,
[LastName] NVARCHAR(50) NOT NULL,
[Title] NVARCHAR(50),
[Notes] NVARCHAR(MAX)
)
CREATE TABLE Customers (
[Id] INT PRIMARY KEY IDENTITY(1,1),
[DriverLicenceNumber] NVARCHAR(50) NOT NULL,
[FullName] NVARCHAR(50) NOT NULL,
[Address] NVARCHAR(50) NOT NULL,
[City] NVARCHAR(50),
[ZipCode] INT,
[Notes] NVARCHAR(MAX)
)

CREATE TABLE RentalOrder (
[Id] INT PRIMARY KEY IDENTITY(1,1),
[EmloyeeId] INT NOT NULL,
[CarId] INT NOT NULL,
[TankLevel] INT NOT NULL,
[KilometrageStart] INT,
[KilometrageEnd] INT,
[TotalKilometrage] INT,
[StartDate] DATETIME2 NOT NULL,
[EndDate] DATETIME2 NOT NULL,
[TotalDays] INT,
[RateApplied] SMALLINT,
[TaxRate] DECIMAL(7,2),
[OrderStatus] BIT,
[Notest] NVARCHAR(MAX)
)

ALTER TABLE RentalOrders
ADD CONSTRAINT FK_EmployeeRentalOrder
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE RentalOrders
ADD CONSTRAINT FK_CarRentalOrder
FOREIGN KEY (CarId) REFERENCES Cars(Id)
GO


ALTER TABLE RentalOrders
ADD CONSTRAINT FK_CustomerRentalOrder
FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
GO

--15.
CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50),
Notes NVARCHAR(MAX)
)

CREATE TABLE Customers (
[AccountNumber] INT PRIMARY KEY NOT NULL,
[FirstName] NVARCHAR(50) NOT NULL,
[LastName] NVARCHAR(50) NOT NULL,
[PhoneNumber] INT NOT NULL,
[EmergencyName] NVARCHAR(50),
[EmergencyNumber] INT NOT NULL,
[Notes] NVARCHAR(MAX)
)


CREATE TABLE RoomStatus(
[RoomStatus] NVARCHAR(50) UNIQUE NOT NULL,
[Notes] NVARCHAR(MAX)
)

CREATE TABLE RoomTypes(
[RoomType] NVARCHAR(50) UNIQUE NOT NULL,
[Notes] NVARCHAR(50)
)

CREATE TABLE BedTypes(
[BedType] NVARCHAR(50) NOT NULL,
[Notes] NVARCHAR(MAX)
)

CREATE TABLE Payments (
[Id] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[EmployeeId] INT NOT NULL,
CONSTRAINT FK_Employee_Payment FOREIGN KEY (EmployeeId)
REFERENCES Employees(Id),
[PaymentDate] DATETIME2 NOT NULL,
[AccountNumber] INT NOT NULL,
[FirstDateOccupied] DATETIME2 NOT NULL,
[LastDateOccupied] DATETIME2 NOT NULL,
[TotalDays] INT NOT NULL,
[AmountCharged] MONEY NOT NULL,
[TaxRate] DECIMAL(5,3) NOT NULL,
[TaxAmount] DECIMAL(7,3) NOT NULL,
[PaymentTotal] MONEY NOT NULL,
[Notes] NVARCHAR(MAX),
)

CREATE TABLE Rooms(
[RoomNumber] INT NOT NULL IDENTITY(1,1),
[RoomType] NVARCHAR(50) NOT NULL,
FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
[BedType] NVARCHAR(50) NOT NULL,
FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
[RoomStatus] NVARCHAR(50) NOT NULL,
FOREIGN KEY ([RoomStatus]) REFERENCES RoomStatus(RoomStatus),
[Rate] DECIMAL(2,1),
Notes NVARCHAR(MAX)
)

--16. 
CREATE DATABASE SoftUni
CREATE TABLE Towns(
[Id] INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL
)


CREATE TABLE Addresses(
[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[AddressText] NVARCHAR(50) NOT NULL,
[TownId] INT NOT NULL,
FOREIGN KEY (TownId) REFERENCES Towns(Id)
)


CREATE TABLE Departments(
[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL
)


CREATE TABLE Employees(
[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[FirstName] NVARCHAR(50) NOT NULL,
[MiddleName]  NVARCHAR(50),
[LastName] NVARCHAR(50) NOT NULL,
[JobTitle] NVARCHAR(50) NOT NULL,
[DepartmentId] INT NOT NULL,
FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
[HireDate] DATETIME2 NOT NULL,
[Salary] MONEY,
[AddressId] INT NOT NULL,
FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)

INSERT INTO Towns([Name])
VALUES ('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO Departments([Name])
VALUES ('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')


--17.
INSERT INTO Towns([Name])
VALUES ('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO Departments([Name])
VALUES ('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

--18.
SELECT * 
FROM [dbo].[Towns]

SELECT *
FROM [dbo].[Departments]

SELECT * 
FROM [dbo].[Employees]

--19.
 SELECT * 
FROM [dbo].[Towns]
ORDER BY [Name] ASC

SELECT *
FROM [dbo].[Departments]
ORDER BY [Name] ASC

SELECT * 
FROM [dbo].[Employees]
ORDER BY [Salary] DESC

--20.
SELECT [Name]
FROM [dbo].[Towns]
ORDER BY [Name] ASC

SELECT [Name]
FROM [dbo].[Departments]
ORDER BY [Name] ASC

SELECT [FirstName], [LastName], [JobTitle], [Salary]
FROM [dbo].[Employees]
ORDER BY [Salary] DESC

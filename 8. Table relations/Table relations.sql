CREATE DATABASE PeopleInfo

CREATE TABLE Persons (
PersonID INT PRIMARY KEY NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
Salaray INT NOT NULL,
PassportID INT NOT NULL
)

CREATE TABLE Passports (
PassportID INT NOT NULL PRIMARY KEY,
PassportNumber NVARCHAR(8) NOT NULL UNIQUE
)

INSERT INTO dbo.Persons (PersonID, FirstName, Salaray, PassportID)
VALUES
(1, 'Roberto', 43300, 102),
(2, 'Tom', 56100, 103),
(3, 'Yana', 60200, 101)

INSERT INTO Passports (PassportID, PassportNumber)
VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2')

ALTER TABLE dbo.Persons
ADD CONSTRAINT FK_PersonID
FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)


--2.
CREATE DATABASE Car

CREATE TABLE Models(
ModelID INT IDENTITY PRIMARY KEY NOT NULL,
[Name] NVARCHAR(20) NOT NULL,
ManufacturerID INT NOT NULL
)

CREATE TABLE Manufacturers(
ManufacturerID INT NOT NULL IDENTITY PRIMARY KEY,
[Name] NVARCHAR(20) NOT NULL,
EstablishedOn DATE NOT NULL
)
INSERT INTO dbo.Models(ModelID, Name, ManufacturerID)
VALUES 
(101, 'x1', 1),
(102, 'i6', 2),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3)

INSERT INTO Manufacturers (ManufacturerID, Name, EstablishedOn)
VALUES
(1, 'BMW', '07/03/1916'),
(2, 'Tesla', '01/01/2003'),
(3, 'Lada', '01/05/1966')

ALTER TABLE Models
ADD FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)


--3.
CREATE TABLE Students(
StudentID INT PRIMARY KEY NOT NULL IDENTITY,
[Name] NVARCHAR(40)
)

CREATE TABLE Exams(
ExamID INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(40)
)

CREATE TABLE StudentsExams(
StudentID INT NOT NULL FOREIGN KEY REFERENCES Students(StudentID),
ExamID INT NOT NULL FOREIGN KEY REFERENCES Exams(ExamID)
)
INSERT INTO Students([Name])
VALUES
('Mila'), 
('Toni'),
('Ron')
INSERT INTO Exams(ExamID, [Name])
VALUES
(101, 'SpringMVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES 
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)


--4.
CREATE TABLE Teachers(
TeacherID INT NOT NULL PRIMARY KEY,
[Name] NVARCHAR(40) NOT NULL,
ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
)
INSERT INTO Teachers(TeacherID, [Name], ManagerID)
VALUES 
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101)

USE master
DROP DATABASE LanguageSchoolDatabase
CREATE DATABASE LanguageSchoolDatabase
USE LanguageSchoolDatabase

CREATE TABLE Teachers(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(30) NOT NULL,
	Surname nvarchar(30) NOT NULL
)
CREATE TABLE Courses (
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Language] nvarchar(30) NOT NULL UNIQUE,
	[Level] int NOT NULL
)
CREATE TABLE Lectures (
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Date] datetime2 NOT NULL,
	DurationMinutes int NOT NULL,
	CoursesId int FOREIGN KEY REFERENCES Courses(Id) NOT NULL
)
CREATE TABLE TeacherLecture (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TeacherId int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	LectureId int FOREIGN KEY REFERENCES Lectures(Id) NOT NULL
)
CREATE TABLE Atendees (
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(30) NOT NULL,
	Surname nvarchar(30) NOT NULL,
	Age int CHECK (Age > 0 AND Age < 100) NOT NULL
)
CREATE TABLE LectureAtendee (
	Id int IDENTITY(1,1) PRIMARY KEY,
	AtendeeId int FOREIGN KEY REFERENCES Atendees(Id) NOT NULL,
	LectureId int FOREIGN KEY REFERENCES Lectures(Id) NOT NULL
)


INSERT INTO Teachers([Name],Surname) VALUES
()
INSERT INTO Courses([Language],[Level]) VALUES
()
INSERT INTO Lectures([Date],DurationMinutes,CoursesId) VALUES
()
INSERT INTO TeacherLecture(TeacherId,LectureId) VALUES
()
INSERT INTO Atendees([Name],Surname,Age) VALUES
()
INSERT INTO LectureAtendee(AtendeeId,LectureId) VALUES
()



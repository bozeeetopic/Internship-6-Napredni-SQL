USE master
DROP DATABASE LanguageSchoolDatabase
CREATE DATABASE LanguageSchoolDatabase
USE LanguageSchoolDatabase

CREATE TABLE Teachers(
	Id int IDENTITY(1,1) PRIMARY KEY,
	TeacherName nvarchar(30) NOT NULL,
	TeacherSurname nvarchar(30) NOT NULL
)
CREATE TABLE Classrooms(
	Id int IDENTITY(1,1) PRIMARY KEY,
	RoomNumber int NOT NULL
)
CREATE TABLE Courses (
	Id int IDENTITY(1,1) PRIMARY KEY,
	CourseLanguage nvarchar(30) NOT NULL,
	DifficultyLevel int NOT NULL,
	TotalPrice bigint NOT NULL,
	ClassroomId int FOREIGN KEY REFERENCES Classrooms(Id) NOT NULL,
	CONSTRAINT Uniqueness UNIQUE (DifficultyLevel,CourseLanguage)
)
CREATE TABLE TeacherCourse (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TeacherId int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	CourseId int FOREIGN KEY REFERENCES Courses(Id) NOT NULL
)
CREATE TABLE Lectures (
	Id int IDENTITY(1,1) PRIMARY KEY,
	DateOfLecture datetime2 NOT NULL,
	DurationMinutes int NOT NULL,
	TeacherCourseId int FOREIGN KEY REFERENCES TeacherCourse(Id) NOT NULL
)
CREATE TABLE Atendees (
	Id int IDENTITY(1,1) PRIMARY KEY,
	AtendeeName nvarchar(30) NOT NULL,
	AtendeeSurname nvarchar(30) NOT NULL,
	Age int CHECK (Age > 0 AND Age < 100) NOT NULL
)
CREATE TABLE LectureAtendee (
	Id int IDENTITY(1,1) PRIMARY KEY,
	AmountPayed bigint DEFAULT 0 NOT NULL,
	AtendeeId int FOREIGN KEY REFERENCES Atendees(Id) NOT NULL,
	LectureId int FOREIGN KEY REFERENCES Lectures(Id) NOT NULL
)

INSERT INTO Teachers(TeacherName,TeacherSurname) VALUES
('Emmery','Crosse'),
('Dionisio','Reedman'),
('Skylar','Henningham'),
('Melisenda','Quadri'),
('Rose','Matton'),
('Essy','Bevens'),
('Roze','Guerri'),
('Hebert','Sans'),
('Jammal','Pendle'),
('Hanni','Vasechkin')
INSERT INTO Classrooms(RoomNumber) VALUES
('432'),
('161'),
('507'),
('566'),
('954'),
('537'),
('473'),
('929'),
('444'),
('898'),
('456'),
('112')
INSERT INTO Courses(CourseLanguage,DifficultyLevel,TotalPrice,ClassroomId) VALUES
('Bulgarian',1,3000,1),
('Chinese',1,9000,1),
('Indonesian',1,12000,2),
('Russian',1,120,3),
('Uzbekistanian',1,130,4),
('Polish',1,5,5),
('Colombian',1,8000,6),
('Korean',1,56000,7),
('Bulgarian',2,3000,1),
('Chinese',2,9000,1),
('Indonesian',2,12000,2),
('Russian',2,120,3),
('Uzbekistanian',2,130,4),
('Polish',2,5,5),
('Colombian',2,8000,6),
('Korean',2,56000,7),
('Chinese',3,9000,1),
('Indonesian',3,12000,2),
('Russian',3,120,3),
('Uzbekistanian',3,130,4),
('Colombian',3,8000,6),
('Korean',3,56000,7),
('Chinese',4,9000,1),
('Korean',4,9000,1)
INSERT INTO TeacherCourse(TeacherId,CourseId) VALUES
(1,1),
(2,1),
(3,2),
(2,3),
(3,3),
(2,4),
(3,4),
(3,5),
(4,5),
(5,5),
(6,6),
(7,6),
(8,7),
(8,8),
(9,8),
(10,8),
(1,9),
(2,10),
(3,10),
(2,11),
(3,12),
(2,13),
(3,14),
(3,15),
(4,15),
(5,15),
(6,16),
(7,16),
(8,17),
(8,18),
(9,18),
(10,18),
(1,19),
(2,19),
(3,20),
(2,21),
(3,22),
(2,23)
INSERT INTO Lectures(DateOfLecture,DurationMinutes,TeacherCourseId) VALUES
('2021-06-19',86,8),
('2021-10-27',108,2),
('2021-09-14',94,3),
('2021-09-01',63,9),
('2021-03-24',97,5),
('2021-08-23',115,10),
('2021-02-23',70,1),
('2021-05-22',96,11),
('2021-11-16',115,2),
('2021-05-07',102,7),
('2021-07-06',85,3),
('2021-10-01',117,12),
('2020-12-16',103,6),
('2021-11-20',66,1),
('2021-08-06',118,13),
('2021-07-08',109,4),
('2021-10-15',115,14),
('2021-04-18',117,15),
('2021-05-09',108,16),
('2021-11-24',75,4),
('2021-10-31',77,7),
('2021-06-15',61,1),
('2021-02-05',69,4),
('2021-01-15',76,8),
('2021-09-04',100,3),
('2021-01-30',82,16),
('2021-03-05',87,6),
('2021-04-29',111,3),
('2021-12-07',120,1),
('2021-11-19',107,6),
('2021-06-19',86,17),
('2021-10-27',108,18),
('2021-09-14',94,19),
('2021-09-01',63,19),
('2021-03-24',97,20),
('2021-08-23',115,20),
('2021-02-23',70,21),
('2021-05-22',96,21),
('2021-11-16',115,22),
('2021-05-07',102,22),
('2021-07-06',85,23),
('2021-10-01',117,24),
('2020-12-16',103,26),
('2021-11-20',66,25),
('2021-08-06',118,23),
('2021-07-08',109,27),
('2021-10-15',115,28),
('2021-04-18',117,29),
('2021-05-09',108,30),
('2021-11-24',75,31),
('2021-10-31',77,31),
('2021-06-15',61,32),
('2021-02-05',69,33),
('2021-01-15',76,34),
('2021-09-04',100,34),
('2021-01-30',82,35),
('2021-03-05',87,36),
('2021-04-29',111,37),
('2021-12-07',120,38),
('2021-11-19',107,38)
INSERT INTO Atendees(AtendeeName,AtendeeSurname,Age) VALUES
('Bernadette','Gietz',14),
('Nicolette','Row',15),
('Malissia','Snoden',50),
('Barry','Trahearn',34),
('Sib','Durdan',23),
('Patric','Plain',56),
('Thia','Shayler',86),
('Gianina','Cropp',34),
('Sadye','Caddens',73),
('Bar','Shoebridge',24),
('Christie','Meconi',13),
('Roda','Piatkowski',67),
('Mackenzie','Whitehorn',42),
('Glyn','Van de Velde',75),
('Odo','Limb',12),
('Kora','Sanbroke',23),
('Heidie','Skillanders',34),
('Gib','Woollard',46),
('Bartram','Abel',75),
('Duke','Faughny',48),
('Tremain','Woakes',24),
('Heloise','Halhead',71),
('Marcy','Hartshorn',71),
('Tyrus','Wooles',39),
('Glenine','Butcher',93),
('Clare','Clerk',99),
('Wayland','Ertelt',23),
('Bridgette','Lemoir',42),
('Lanny','Ortes',23),
('Kristien','Bundey',52),
('Deane','Chisnell',25),
('Sidney','Cream',27),
('Morey','Giacobini',28),
('Kerstin','Wailes',33),
('Tyne','Cutriss',31),
('Feodor','Bowry',32),
('Kalina','Youthed',36),
('Yvette','Hackinge',37),
('Gwenni','Ferriere',23),
('Kenon','McAndrew',24),
('Dorise','Peake',24),
('Tris','Jendricke',25),
('Waldon','Bolton',21),
('Abra','Clandillon',19),
('Anita','McKane',18)
INSERT INTO LectureAtendee(AmountPayed,AtendeeId,LectureId) VALUES
(0,1,20),
(0,25,15),
(0,19,1),
(0,26,9),
(0,12,11),
(400,26,3),
(20000,24,17),
(5,6,22),
(100,37,25),
(100,8,24),
(200,35,24),
(4000,23,19),
(2800,15,12),
(3000,42,29),
(10000,26,25),
(200,20,13),
(100,30,3),
(0,17,14),
(0,12,10),
(0,33,5),
(0,5,6),
(0,26,10),
(400,39,12),
(500,16,27),
(200,20,8),
(100,34,14),
(0,2,21),
(0,26,11),
(0,41,4),
(0,28,12),
(0,35,25),
(500,10,3),
(29000,32,25),
(100,12,16),
(100,34,10),
(150,12,3),
(5,38,1),
(5,29,14),
(5,1,21),
(5,43,10),
(100,25,13),
(0,6,16),
(20000,23,4),
(180,33,25),
(290,44,20),
(333,38,11),
(222,26,16),
(111,11,7),
(2,36,16),
(5,30,7),
(5,6,26),
(0,27,9),
(0,30,2),
(2000,5,11),
(1997,40,5),
(234,34,18),
(1234,27,2),
(570,12,14),
(800,41,19),
(700,38,28),
(0,6,24),
(600,44,7),
(500,14,3),
(4000,3,5),
(300,18,5),
(0,22,25),
(0,22,7),
(0,6,12),
(0,35,7),
(0,33,14),
(0,19,2),
(0,36,29),
(0,22,19),
(0,1,1),
(1,24,28),
(1,23,9),
(1000,7,2),
(1200,7,21),
(1250,2,15),
(80,16,12),
(50,20,25),
(30,10,5),
(50,28,22),
(7,37,2),
(0,19,6),
(3790,7,10),
(0,8,3),
(0,34,29),
(23,1,15),
(34,38,14),
(56,10,17),
(78,32,29),
(90,1,2),
(8,35,23),
(7,36,12),
(6,19,19),
(5,30,18),
(4,33,4),
(3,34,13),
(2,8,11),
(0,36,30),
(0,22,31),
(0,1,32),
(1,24,33),
(1,23,34),
(1000,7,35),
(1200,7,36),
(1250,2,37),
(80,16,37),
(50,20,38),
(30,10,39),
(50,28,40),
(7,37,40),
(0,19,41),
(3790,7,42),
(0,8,43),
(0,34,44),
(23,1,45),
(34,38,46),
(56,10,47),
(78,32,48),
(90,1,49),
(8,35,50),
(7,36,51),
(6,19,52),
(5,30,53),
(4,33,54),
(3,34,55),
(2,8,56),
(7,36,56),
(6,19,57),
(5,30,58),
(4,33,59),
(3,34,60),
(2,8,60)

SELECT CourseLanguage,DateOfLecture
FROM Courses a
JOIN TeacherCourse b ON a.Id = b.CourseId
JOIN Lectures c ON b.Id = c.TeacherCourseId
WHERE DATEDIFF(dd, '2020-12-16', DateOfLecture) < 10
ORDER BY CourseLanguage

SELECT 
	DateOfLecture, 
	CourseLanguage,
	DifficultyLevel,
	(SELECT CASE 
		WHEN Age <= 17 THEN  N'U?enik'
		WHEN Age > 17 AND Age <= 27 THEN 'Student'
		WHEN Age > 27 AND Age <= 27 THEN 'Radnik'
		WHEN Age > 67 THEN 'Umirovljenik'
	END) AS AgeGroup
FROM Atendees a
JOIN LectureAtendee b ON a.Id = b.AtendeeId
JOIN Lectures c ON b.LectureId = c.Id
JOIN TeacherCourse d ON c.TeacherCourseId = d.Id
JOIN Courses e ON e.Id = d.CourseId
WHERE DATEDIFF(dd, '2020-12-16', DateOfLecture) < 100
GROUP BY CourseLanguage, DifficultyLevel, AgeGroup
	
SELECT DateOfLecture, TeacherName, TeacherSurname
FROM Teachers a
JOIN TeacherCourse b ON a.Id = b.TeacherId
JOIN Lectures c ON b.Id = c.TeacherCourseId
WHERE DATEDIFF(dd, '2020-12-16', DateOfLecture) < 100
GROUP BY a.Id

SELECT *
FROM Atendees a
JOIN LectureAtendee b ON a.Id = b.AtendeeId
JOIN Lectures c ON b.LectureId = c.Id
JOIN TeacherCourse d ON c.TeacherCourseId = d.Id
JOIN Courses e ON e.Id = d.CourseId
JOIN Teachers f ON d.TeacherId = f.Id
WHERE DATEDIFF(dd, '2020-12-16', DateOfLecture) < 100

SELECT CourseLanguage,Count(d.AtendeeId) AS NumberOfAtendees
FROM Courses a
JOIN TeacherCourse b ON a.Id = b.CourseId
JOIN Lectures c ON b.Id = c.TeacherCourseId
JOIN LectureAtendee d ON c.Id = d.LectureId
WHERE DATEDIFF(dd, '2020-12-16', DateOfLecture) < 100
GROUP BY CourseLanguage

SELECT CourseLanguage,
	DifficultyLevel,
	(SELECT CASE 
		WHEN Age <= 17 THEN  N'U?enik'
		WHEN Age > 17 AND Age <= 27 THEN 'Student'
		WHEN Age > 27 AND Age <= 27 THEN 'Radnik'
		WHEN Age > 67 THEN 'Umirovljenik'
	END) AS AgeGroup
FROM Courses a
JOIN TeacherCourse b ON a.Id = b.CourseId
JOIN Lectures c ON b.Id = c.TeacherCourseId
JOIN LectureAtendee d ON c.Id = d.LectureId
JOIN Atendees e ON d.AtendeeId = e.Id
GROUP BY CourseLanguage, DifficultyLevel, AgeGroup
ORDER BY CourseLanguage

SELECT AtendeeName
FROM Atendees a
JOIN LectureAtendee b ON a.Id = b.AtendeeId
JOIN Lectures c ON b.LectureId = c.Id
JOIN TeacherCourse d ON c.TeacherCourseId = d.Id
JOIN Courses e ON e.Id = d.CourseId
WHERE Count(CourseLanguage) > 2 
	AND Age = MAX(Age)

SELECT CourseLanguage
FROM Courses a
JOIN TeacherCourse b ON a.Id = b.CourseId
JOIN Lectures c ON b.Id = c.TeacherCourseId
JOIN LectureAtendee d ON c.Id = d.LectureId
JOIN Atendees e ON d.AtendeeId = e.Id
WHERE Age < 20
GROUP BY CourseLanguage
ORDER BY Count(e.Id)

SELECT 
	Id,
	AtendeeName,
	AtendeeSurname,
	Age,
	(SELECT CASE 
		WHEN Age <= 17 THEN  N'U?enik'
		WHEN Age > 17 AND Age <= 27 THEN 'Student'
		WHEN Age > 27 AND Age <= 27 THEN 'Radnik'
		WHEN Age > 67 THEN 'Umirovljenik'
	END) AS AgeGroup
FROM Atendees

SELECT *
FROM Atendees
WHERE Id IN (
	SELECT DISTINCT e.Id
	FROM Courses a
	JOIN TeacherCourse b ON a.Id = b.CourseId
	JOIN Lectures c ON b.Id = c.TeacherCourseId
	JOIN LectureAtendee d ON c.Id = d.LectureId
	JOIN Atendees e ON d.AtendeeId = e.Id
	WHERE CourseLanguage = 'Korean'
	)

SELECT *
FROM Atendees
WHERE Id IN (
	SELECT DISTINCT e.Id
	FROM Courses a
	JOIN TeacherCourse b ON a.Id = b.CourseId
	JOIN Lectures c ON b.Id = c.TeacherCourseId
	JOIN LectureAtendee d ON c.Id = d.LectureId
	JOIN Atendees e ON d.AtendeeId = e.Id
	JOIN Classrooms f ON a.ClassroomId = f.Id
	WHERE RoomNumber = 432
	)

SELECT Id,AtendeeName,AtendeeSurname
FROM Atendees
WHERE Id IN (
	SELECT DISTINCT e.Id
	FROM Courses a
	JOIN TeacherCourse b ON a.Id = b.CourseId
	JOIN Lectures c ON b.Id = c.TeacherCourseId
	JOIN LectureAtendee d ON c.Id = d.LectureId
	JOIN Atendees e ON d.AtendeeId = e.Id
	WHERE CourseLanguage = 'Korean'
	)
UNION 
SELECT *
FROM Teachers
WHERE Id IN (
	SELECT DISTINCT c.Id
	FROM Courses a
	JOIN TeacherCourse b ON a.Id = b.CourseId
	JOIN Teachers c ON b.TeacherId = c.Id
	WHERE CourseLanguage = 'Korean'
	)
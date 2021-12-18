CREATE DATABASE LanguageSchoolDatabase

USE LanguageSchoolDatabase

CREATE TABLE [Locations](
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL,
	PostalCode nvarchar(5),
	Country nvarchar(50) NOT NULL
)

CREATE TABLE Languages(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Language] nvarchar(50) NOT NULL
)

CREATE TABLE Teachers(
	PIN nvarchar(11) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	[Address] nvarchar(50) NOT NULL,
	CurrentLocation int FOREIGN KEY REFERENCES Locations(Id) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	DateOfBirth date NOT NULL,
	PlaceOfBirth int FOREIGN KEY REFERENCES Locations(Id) NOT NULL
)

CREATE TABLE StudentStatuses(
	Id int IDENTITY(1,1) PRIMARY KEY,
	StudentStatus nvarchar(50) NOT NULL
)

CREATE TABLE Courses(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Teacher nvarchar(11) FOREIGN KEY REFERENCES Teachers(PIN) NOT NULL,
	[Language] int FOREIGN KEY REFERENCES Languages(Id) NOT NULL,
	StudentStatus int FOREIGN KEY REFERENCES StudentStatuses(Id)
)

CREATE TABLE Appointments(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Course int FOREIGN KEY REFERENCES Courses(Id) NOT NULL,
	Classroom int NOT NULL,
	Beginning datetime2 NOT NULL,
	Ending datetime2 NOT NULL
)

CREATE TABLE Students(
	PIN nvarchar(11) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	[Address] nvarchar(50) NOT NULL,
	CurrentLocation int FOREIGN KEY REFERENCES Locations(Id) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	DateOfBirth date NOT NULL,
	PlaceOfBirth int FOREIGN KEY REFERENCES Locations(Id) NOT NULL,
	TotalNumberOfInstallments int NOT NULL,
	NumberOfPaidInstallments int NOT NULL,
	ProficiencyLevel nvarchar(2)
)

CREATE TABLE AgeGroups(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Student nvarchar(11) FOREIGN KEY REFERENCES Students(PIN) NOT NULL,
	StudentStatus int FOREIGN KEY REFERENCES StudentStatuses(Id) NOT NULL
)

CREATE TABLE StudentCourses(
	Student nvarchar(11) FOREIGN KEY REFERENCES Students(PIN) NOT NULL,
	Course int FOREIGN KEY REFERENCES Courses(Id) NOT NULL
)

CREATE TABLE StudentAppointments(
	Student nvarchar(11) FOREIGN KEY REFERENCES Students(PIN) NOT NULL,
	Appointment int FOREIGN KEY REFERENCES Appointments(Id) NOT NULL,
	Attended bit NOT NULL
)



/*Inserting data*/

insert into [Locations] ([Name], PostalCode, Country) values ('Prelog', 15534, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Laslovo', 61124, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Lavrica', 56856, 'Slovenia');
insert into [Locations] ([Name], PostalCode, Country) values ('Tisno', 77768, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Trpinja', 43761, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Bjelovar', 38863, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Šipovo', 49217, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Kranj', 74817, 'Slovenia');
insert into [Locations] ([Name], PostalCode, Country) values ('Slunj', 61315, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Popovi', 99875, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Hiseti', 86026, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Milići', 69045, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Sv. Anton', 62170, 'Slovenia');
insert into [Locations] ([Name], PostalCode, Country) values ('Varaždin', 20309, 'Croatia');
insert into [Locations] ([Name], PostalCode, Country) values ('Gornja Koprivna', 65694, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Piran', 95942, 'Slovenia');
insert into [Locations] ([Name], PostalCode, Country) values ('Čelinac', 52774, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Moste', 42410, 'Slovenia');
insert into [Locations] ([Name], PostalCode, Country) values ('Lamovita', 43722, 'Bosnia and Herzegovina');
insert into [Locations] ([Name], PostalCode, Country) values ('Zadvorsko', 80704, 'Croatia');


INSERT INTO Languages([Language]) VALUES
('Croatian'),
('English'),
('Russian'),
('Italian'),
('German'),
('French')


insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (71696345783, 'Mariel', 'Cornilli', '19 Novick Trail', 13, '335 544 8814', '2007-01-08', 1);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (37911840626, 'Blane', 'Jeffcock', '07 Saint Paul Place', 1, '648 626 2333', '1949-06-17', 6);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (41966194359, 'Alix', 'Lindup', '94509 Muir Circle', 1, '676 303 9322', '1957-07-30', 13);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (71543841034, 'Lorne', 'Benyan', '4 Talmadge Crossing', 16, '539 118 7470', '1966-12-17', 8);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (80188964316, 'Poul', 'Welden', '53 Mcguire Point', 9, '980 900 3624', '1951-01-07', 15);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (70750101063, 'Wrennie', 'Ashness', '6 Arapahoe Plaza', 1, '156 737 3836', '1990-05-19', 5);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (84048507163, 'Granville', 'Trippack', '62963 Pearson Crossing', 7, '575 411 0316', '1983-12-24', 7);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (61750543641, 'Ame', 'Plowright', '36973 Graedel Circle', 11, '128 372 0505', '1970-05-02', 8);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (18009073048, 'Donnell', 'Ivashnikov', '80 Dexter Crossing', 3, '764 264 5006', '1949-08-31', 6);
insert into Teachers (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth) values (94995199011, 'Barrett', 'Bahlmann', '171 Rieder Court', 12, '251 263 1993', '1945-05-13', 7);


INSERT INTO StudentStatuses(StudentStatus) VALUES
('Pupil'),
('College student'),
('Worker'),
('Pensioner')


INSERT INTO Courses(Teacher, [Language], StudentStatus) VALUES
('71696345783', 1, 1),
('71696345783', 1, 2),
('71696345783', 1, 3),
('71696345783', 1, 4),
('37911840626', 2, 1),
('37911840626', 2, 2),
('41966194359', 2, 3),
('41966194359', 2, 4),
('71543841034', 3, 2),
('71543841034', 3, 3),
('71543841034', 3, 4),
('80188964316', 4, 1),
('80188964316', 4, 2),
('70750101063', 5, 1),
('61750543641', 5, 2),
('84048507163', 6, 2)


INSERT INTO Appointments(Course, Classroom, Beginning, Ending) VALUES
(1, 1, '2021-12-15 08:00:00', '2021-12-15 08:45:00'),
(2, 3, '2021-12-15 09:30:00', '2021-12-15 11:00:00'),
(10, 2, '2021-12-15 09:00:00', '2021-12-15 10:30:00'),
(11, 2, '2021-06-17 9:35', '2021-06-17 10:35'),
(5, 4, '2021-02-22 19:47', '2021-02-22 20:47'),
(15, 4, '2021-09-26 14:25', '2021-09-26 15:25'),
(12, 6, '2021-04-05 16:32', '2021-04-05 17:32'),
(6, 2, '2021-02-20 14:14', '2021-02-20 15:14'),
(8, 7, '2021-10-28 8:37', '2021-10-28 9:37'),
(15, 2, '2021-08-18 9:34', '2021-08-18 10:34'),
(1, 7, '2021-06-08 9:30', '2021-06-08 10:30'),
(11, 6, '2021-01-19 11:43', '2021-01-19 12:43'),
(6, 7, '2021-01-28 12:29', '2021-01-28 13:29'),
(8, 1, '2021-06-24 17:31', '2021-06-24 18:31'),
(12, 7, '2021-01-13 13:14', '2021-01-13 14:14'),
(11, 7, '2021-06-27 8:01', '2021-06-27 9:01'),
(6, 3, '2021-01-16 9:26', '2021-01-16 10:26'),
(3, 4, '2021-06-12 11:31', '2021-06-12 12:31'),
(2, 1, '2021-01-10 17:55', '2021-01-10 18:55'),
(3, 4, '2021-07-13 10:36', '2021-07-13 11:36'),
(10, 4, '2021-02-19 17:06', '2021-02-19 17:36'),
(16, 3, '2021-08-13 14:22', '2021-08-13 15:52'),
(7, 7, '2021-10-09 18:39', '2021-10-09 19:39'),
(15, 2, '2021-02-10 11:20', '2021-02-10 12:20'),
(10, 2, '2021-11-15 17:04', '2021-11-15 18:04'),
(11, 2, '2021-07-04 18:02', '2021-07-04 19:32'),
(7, 1, '2021-03-24 10:20', '2021-03-24 11:20'),
(15, 2, '2021-03-16 10:35', '2021-03-16 11:35'),
(2, 5, '2021-01-21 19:29', '2021-01-21 20:29'),
(12, 1, '2021-01-09 14:58', '2021-01-09 15:58'),
(14, 3, '2021-05-23 12:37', '2021-05-23 14:37')


insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (87098114489, 'Costa', 'Danovich', '812 Artisan Junction', 16, '970 850 7538', '1977-12-09', 17, 2, 2, 'A1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (39769439360, 'Wyatan', 'Castelijn', '5 Columbus Way', 12, '542 696 7570', '2012-11-27', 4, 7, 7, 'A2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (87463553807, 'Melly', 'Gazey', '67426 Debra Plaza', 7, '190 268 1405', '2012-11-30', 2, 1, 1, 'B1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (61603296215, 'Vanda', 'Ledstone', '930 Nancy Avenue', 19, '282 562 9230', '1957-06-04', 20, 6, 3, 'B2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (10682750465, 'Cally', 'Tofts', '5 Lerdahl Terrace', 20, '952 161 5294', '1990-05-02', 14, 11, 10, 'C1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (93485954094, 'Sibbie', 'Gallatly', '4595 Moland Crossing', 8, '197 808 7125', '1946-07-05', 1, 4, 4, 'C2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (69560600780, 'Gabriello', 'Trebbett', '1803 Scott Lane', 10, '739 669 6905', '1982-07-11', 7, 12, 5, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (59563916395, 'Bernadina', 'MacMorland', '2005 Namekagon Road', 19, '633 198 7273', '2010-01-24', 14, 8, 6, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (15634322521, 'Kristen', 'Loude', '5441 Clemons Alley', 18, '981 288 4165', '1949-08-19', 6, 4, 1, 'C1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (46101048184, 'Hollie', 'Raynor', '53 Lotheville Park', 12, '247 832 5719', '1968-01-09', 9, 4, 4, 'A1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (86474192666, 'Alwyn', 'Payze', '65044 Badeau Center', 12, '145 182 6977', '1976-07-22', 14, 3, 1, 'B1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (24089461021, 'Vite', 'Fullager', '472 Hansons Way', 20, '699 856 5883', '1971-07-27', 4, 2, 0, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (92721105237, 'Danica', 'Yurchenko', '02697 Scofield Street', 20, '450 627 6229', '1979-04-18', 19, 9, 0, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (47159859208, 'Celestyn', 'Iorio', '740 Northwestern Place', 19, '309 950 0253', '1941-07-27', 11, 9, 8, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (65097133169, 'Stacie', 'Brady', '2329 Colorado Drive', 11, '992 214 3189', '2004-05-05', 4, 9, 9, 'B2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (52997425849, 'Dorie', 'Sawood', '0 Delaware Street', 2, '520 235 1421', '1948-06-29', 9, 9, 9, 'C2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (12137223960, 'Brittaney', 'Finci', '16 Bellgrove Drive', 9, '395 859 2442', '1987-12-02', 12, 1, 1, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (53019043423, 'Perla', 'Swansbury', '3450 Dahle Road', 1, '469 598 8565', '1960-08-24', 17, 5, 0, 'A1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (31034388842, 'Iolanthe', 'Smeaton', '242 Mandrake Trail', 5, '182 741 6480', '1996-05-13', 19, 5, 4, 'A2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (28873432876, 'Ham', 'O''Shaughnessy', '26638 Barby Place', 3, '516 514 7258', '2002-04-25', 5, 6, 2, NULL);
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (65213094599, 'Raymund', 'Hayman', '3 Hoard Pass', 9, '252 178 5974', '1995-09-22', 12, 1, 1, 'C1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (34417167305, 'Gerti', 'Tween', '62 Arrowood Parkway', 15, '609 312 2099', '1945-07-21', 19, 4, 4, 'A2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (53708293722, 'Rorie', 'Baudon', '755 Barby Road', 17, '251 499 3051', '1974-10-31', 15, 7, 3, 'B1');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (65368377157, 'Coral', 'Landal', '161 Delladonna Court', 17, '975 222 2851', '2008-02-19', 8, 10, 9, 'A2');
insert into Students (PIN, FirstName, LastName, [Address], CurrentLocation, PhoneNumber, DateOfBirth, PlaceOfBirth, TotalNumberOfInstallments, NumberOfPaidInstallments, ProficiencyLevel) values (98322574070, 'Kitty', 'Sinnott', '3 Gulseth Center', 9, '669 896 6145', '1998-12-02', 9, 7, 6, NULL);


INSERT INTO AgeGroups(Student, StudentStatus)
SELECT PIN, 1
FROM Students
WHERE DATEDIFF(YEAR, Students.DateOfBirth, CAST(GETDATE() AS date)) < 18

INSERT INTO AgeGroups(Student, StudentStatus)
SELECT PIN, 2
FROM Students
WHERE DATEDIFF(YEAR, Students.DateOfBirth, CAST(GETDATE() AS date)) BETWEEN 19 AND 27

INSERT INTO AgeGroups(Student, StudentStatus)
SELECT PIN, 3
FROM Students
WHERE DATEDIFF(YEAR, Students.DateOfBirth, CAST(GETDATE() AS date)) BETWEEN 28 AND 65

INSERT INTO AgeGroups(Student, StudentStatus)
SELECT PIN, 4
FROM Students
WHERE DATEDIFF(YEAR, Students.DateOfBirth, CAST(GETDATE() AS date)) >= 66


INSERT INTO StudentCourses(Student, Course)
SELECT Student, 1
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 1
AND LEN(Students.FirstName) <= 5)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 5
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 1
AND LEN(Students.FirstName) > 5)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 2
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 2
AND LEN(Students.LastName) <= 6)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 9
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 2
AND LEN(Students.LastName) > 6)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 16
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 2
AND LEN(Students.Address) < 18)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 7
FROM Students
JOIN AgeGroups
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 3
AND LEN(Students.FirstName) < 6)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 10
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 3
AND LEN(Students.FirstName) >= 6)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 3
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 3
AND Students.TotalNumberOfInstallments < 8)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 4
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 4
AND LEN(Students.Address) <= 20)

INSERT INTO StudentCourses(Student, Course)
SELECT Student, 11
FROM AgeGroups
JOIN Students
ON Students.PIN = AgeGroups.Student
WHERE (AgeGroups.StudentStatus = 4
AND LEN(Students.Address) > 20)


INSERT INTO StudentAppointments(Student, Appointment, Attended)
SELECT Students.PIN, Appointments.Id, CRYPT_GEN_RANDOM(1) % 2
FROM Appointments
JOIN Courses
ON Appointments.Course = Courses.Id
JOIN StudentCourses
ON Courses.Id = StudentCourses.Course
JOIN Students
ON Students.PIN = StudentCourses.Student



/*Queries*/

/*raspored održavanja tečajeva u školi za određeni vremenski period*/
SELECT Appointments.Id AS 'Appointment ID', Languages.[Language], StudentStatuses.StudentStatus, CONCAT(Teachers.FirstName , ' ' , Teachers.LastName) AS 'Teacher', Appointments.Classroom, Appointments.Beginning, Appointments.Ending
FROM Appointments
JOIN Courses
ON Courses.Id = Appointments.Course
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN StudentStatuses
ON Courses.StudentStatus = StudentStatuses.Id
JOIN Teachers
ON Teachers.PIN = Courses.Teacher
WHERE Appointments.Beginning BETWEEN '2021-06-01'
AND '2021-12-31'
ORDER BY Appointments.Beginning ASC

/*raspored održavanja tečaja za pojedinu grupu polaznika za određeni vremenski period*/
SELECT Languages.[Language], StudentStatuses.StudentStatus, CONCAT(Teachers.FirstName , ' ' , Teachers.LastName) AS 'Teacher', Appointments.Classroom, Appointments.Beginning, Appointments.Ending
FROM Appointments
JOIN Courses
ON Courses.Id = Appointments.Course
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN StudentStatuses
ON Courses.StudentStatus = StudentStatuses.Id
JOIN Teachers
ON Teachers.PIN = Courses.Teacher
WHERE Appointments.Beginning BETWEEN '2021-06-01'
AND '2021-12-31'
AND Courses.StudentStatus = 3
AND Courses.[Language] = 3
ORDER BY Appointments.Beginning ASC

/*raspored rada pojedinog nastavnika za određeni vremenski period*/
SELECT CONCAT(Teachers.FirstName , ' ' , Teachers.LastName) AS 'Teacher', Languages.[Language], StudentStatuses.StudentStatus, Appointments.Classroom, Appointments.Beginning, Appointments.Ending
FROM Appointments
JOIN Courses
ON Courses.Id = Appointments.Course
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN StudentStatuses
ON Courses.StudentStatus = StudentStatuses.Id
JOIN Teachers
ON Teachers.PIN = Courses.Teacher
WHERE Appointments.Beginning BETWEEN '2021-06-01'
AND '2021-12-31'
AND Teachers.PIN = '71696345783'
ORDER BY Appointments.Beginning ASC

/*izvještaj za pojedinog polaznika za određeni vremenski period, koji
uključuje podatke o tečajevima stranih jezika koje sluša,
stupnjevima koje je završio, nastavnicima koji mu predaju,
prisutnosti na nastavi te ratama koje je uplatio.*/
SELECT DISTINCT Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student', Languages.[Language], CONCAT(Teachers.FirstName , ' ' , Teachers.LastName) AS 'Teacher', Students.ProficiencyLevel, COUNT(StudentAppointments.Student) AS 'Number of appointments', SUM(CAST(StudentAppointments.Attended AS int)) AS 'Attended appointments', Students.NumberOfPaidInstallments AS 'Number of paid installments', Students.TotalNumberOfInstallments AS 'Total number of installments'
FROM Appointments
JOIN Courses
ON Courses.Id = Appointments.Course
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN Teachers
ON Teachers.PIN = Courses.Teacher
JOIN StudentAppointments
ON StudentAppointments.Appointment = Appointments.Id
JOIN Students
ON Students.PIN = StudentAppointments.Student
WHERE Appointments.Beginning BETWEEN '2021-06-01'
AND '2021-12-31'
AND Students.PIN = '61603296215'
GROUP BY Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName), Languages.[Language], CONCAT(Teachers.FirstName , ' ' , Teachers.LastName), Students.ProficiencyLevel, Students.NumberOfPaidInstallments, Students.TotalNumberOfInstallments

/*izvještaj o brojnosti polaznika i posjećenosti nastave na pojedinom
tečaju u određenom vremenskom periodu*/
SELECT Languages.[Language], StudentStatuses.StudentStatus, COUNT(StudentAppointments.Student) AS 'Total number of students', SUM(CAST(StudentAppointments.Attended AS int)) AS 'Number of students that attended'
FROM Courses
JOIN Appointments
ON Courses.Id = Appointments.Course
JOIN StudentAppointments
ON StudentAppointments.Appointment = Appointments.Id
JOIN Students
ON StudentAppointments.Student = Students.PIN
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN StudentStatuses
on StudentStatuses.Id = Courses.StudentStatus
WHERE Appointments.Beginning BETWEEN '2021-06-01'
AND '2021-12-31'
GROUP BY Languages.[Language], StudentStatuses.StudentStatus
ORDER BY Languages.[Language]

/*pregled brojnosti polaznika na pojedinim tečajevima po starosnim skupinama.*/
SELECT Languages.[Language], StudentStatuses.StudentStatus, COUNT(*) AS 'Number of students'
FROM Courses
JOIN StudentCourses
ON StudentCourses.Course = Courses.Id
JOIN Languages
ON Courses.[Language] = Languages.Id
JOIN StudentStatuses
ON StudentStatuses.Id = Courses.StudentStatus
GROUP BY Languages.[Language], StudentStatuses.StudentStatus
ORDER BY Languages.[Language] ASC

/*ispis imena najstarijeg polaznika koji pohađa više od dva jezika*/
SELECT TOP 1 CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student', Students.DateOfBirth
FROM StudentCourses
JOIN Students
ON StudentCourses.Student = Students.PIN
GROUP BY Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName), Students.DateOfBirth
HAVING COUNT(*) >= 2
ORDER BY Students.DateOfBirth ASC

/*sortiranje tečajeva po broju polaznika koji imaju manje od 20 godina*/
SELECT Languages.[Language], COUNT(*) AS 'Number of students younger than 20'
FROM Courses
JOIN StudentCourses
ON StudentCourses.Course = Courses.Id
JOIN Students
ON Students.PIN = StudentCourses.Student
JOIN Languages
ON Courses.[Language] = Languages.Id
WHERE DATEDIFF(YEAR, Students.DateOfBirth, CAST(GETDATE() AS date)) < 20
GROUP BY Languages.[Language]

/*ispis statusa polaznika*/
SELECT Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student', StudentStatuses.StudentStatus
FROM StudentStatuses
JOIN AgeGroups
ON AgeGroups.StudentStatus = StudentStatuses.Id
JOIN Students
ON AgeGroups.Student = Students.PIN

/*ispis svih polaznika koji polažu bilo koji od tečajeva za određen
jezik*/
SELECT Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student'
FROM Students
JOIN StudentCourses
ON Students.PIN = StudentCourses.Student
JOIN Courses
ON StudentCourses.Course = Courses.Id
WHERE Courses.[Language] = 1

/*ispis svih polaznika koji su bili u određenoj učionici*/
SELECT Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student'
FROM Students
JOIN StudentAppointments
ON StudentAppointments.Student = Students.PIN
JOIN Appointments
ON StudentAppointments.Appointment = Appointments.Id
WHERE Appointments.Classroom = 1

/*ispis svih polaznika i nastavnika na zadanom jeziku*/
SELECT Students.PIN, CONCAT(Students.FirstName , ' ' , Students.LastName) AS 'Student / Teacher'
FROM Students
JOIN StudentCourses
ON Students.PIN = StudentCourses.Student
JOIN Courses
ON StudentCourses.Course = Courses.Id
WHERE Courses.[Language] = 1
UNION
SELECT Teachers.PIN, CONCAT(Teachers.FirstName , ' ' , Teachers.LastName) AS 'Student / Teacher'
FROM Teachers
JOIN Courses
ON Courses.Teacher = Teachers.PIN
WHERE Courses.[Language] = 1
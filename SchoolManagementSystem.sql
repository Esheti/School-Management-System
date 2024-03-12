-- Creating the database schoolmanagement
CREATE DATABASE SchoolManagementSystem;

-- Using the schoolmanagement database
USE SchoolManagementSystem;

-- Creating student table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
	FullName varchar(50),
	Class INT
	);

-- Creating Course table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
	CourseName varchar(50)
	);

-- Creating Enrolments table
CREATE TABLE Enrolments (
    EnrolmentID INT PRIMARY KEY,
	StudentID INT,
	CourseID INT,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
	);

-- POPULATING THE THREE TABLES WITH DATA
INSERT INTO Students VALUES
(1, 'John Kennedy', 9),
(2, 'Fred Sterling', 8),
(3, 'Segun Ogunlana', 10),
(4, 'Steven Chike', 5),
(5, 'Stephen Esheti', 11),
(6, 'Armstrong Awuzie', 12),
(7, 'Blessing Chika', 7),
(8, 'chris Hamstel', 6),
(9, 'Musa Ismail', 4),
(10, 'Esther Nwodo', 3);

INSERT INTO Courses Values
(101, 'English'),
(102, 'Economics'),
(103, 'Accounting'),
(104, 'Math'),
(105, 'Art'),
(106, 'Literature'),
(107, 'Yoruba'),
(108, 'Engineering'),
(109, 'Polymer'),
(110, 'Biology');

INSERT INTO Enrolments VALUES
(1001, 1, 101),
(1002, 2, 102),
(1003, 3, 103),
(1004, 4, 104),
(1005, 5, 105),
(1006, 6, 106),
(1007, 7, 107),
(1008, 8, 108),
(1009, 9, 109),
(1010, 10, 110);

-- SIMULATING UPDATE AND COURSE REMOVAL
UPDATE Students
SET FullName = 'Micheal Chisom'
WHERE StudentID = 10;

DELETE FROM Courses
WHERE CourseID = 107;

-- LISTING ALL STUDENTS
SELECT *
FROM Students;

-- FILTERING STUDENTS BASED ON CLASS
SELECT *
FROM Students
WHERE Class = 12;

SELECT *
FROM Students
WHERE Class = 7;

-- LIST OF ENROLLED STUDENT COUNTS
SELECT
    Courses.CourseID,
    Courses.CourseName,
    COUNT(Enrolments.StudentID) AS EnrolledStudents
FROM Courses
LEFT JOIN Enrolments ON Courses.CourseID = Enrolments.CourseID
GROUP BY Courses.CourseID, Courses.CourseName;

--FINDING STUDENTS ENROLLED IN SPECIFIC COURSES
SELECT Students.*
FROM Students JOIN Enrolments ON Students.StudentID = Enrolments.StudentID
WHERE CourseID = 107;

SELECT Students.*
FROM Students JOIN Enrolments ON Students.StudentID = Enrolments.StudentID
WHERE CourseID = 105;


use Northwind

DROP TABLE IF EXISTS Absences;
DROP TABLE IF EXISTS Exams_Results;
DROP TABLE IF EXISTS Classroom;
DROP TABLE IF EXISTS Exams;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Language;
DROP TABLE IF EXISTS Type_Of_Course;
DROP TABLE IF EXISTS Students_Parents;
DROP TABLE IF EXISTS Persons;
DROP TABLE IF EXISTS Person_Types;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Accounts_Audit;



CREATE TABLE Accounts
(	Account_ID INTEGER NOT NULL PRIMARY KEY IDENTITY (1,1),
	Username NVARCHAR (50) NOT NULL,
	Email NVARCHAR (50) NOT NULL,
	Password NVARCHAR (50) NOT NULL,
	Creation_Date Date NOT NULL
) 



CREATE TABLE Accounts_Audit
(   Account_ID INTEGER NOT NULL,
	Username NVARCHAR (50) NOT NULL,
	Email NVARCHAR (50) NOT NULL,
	Password NVARCHAR (50) NOT NULL,
	Creation_Date Date NOT NULL,
	Operation_Date datetime  NOT NULL
) 





CREATE TABLE Person_Types
(
    Type_ID INTEGER NOT NULL PRIMARY KEY,
    Name NVARCHAR (50) NOT NULL 
)

CREATE TABLE Persons
(
    Person_ID INTEGER NOT NULL PRIMARY KEY,
    Name NVARCHAR (50) NOT NULL ,
    Surname NVARCHAR (50) NOT NULL ,
    Gender NVARCHAR (10) NOT NULL ,
    Phone_Number NVARCHAR (13) NOT NULL,
	Type_ID INTEGER NOT NULL,
	FOREIGN KEY (Person_ID) REFERENCES Accounts ( Account_ID),
	FOREIGN KEY (Type_ID) REFERENCES Person_Types ( Type_ID)
)

CREATE TABLE Students_Parents
	(
     Student_ID INTEGER NOT NULL ,
     Parent_ID INTEGER NOT NULL ,
	 PRIMARY KEY (Student_ID, Parent_ID),
	 FOREIGN KEY (Student_ID) REFERENCES Persons (Person_ID),
	 FOREIGN KEY (Parent_ID) REFERENCES Persons (Person_ID),
    )


CREATE TABLE Type_Of_Course
	(
     Type_ID INTEGER NOT NULL PRIMARY KEY,
     Name NVARCHAR (50) NOT NULL
	 )

CREATE TABLE Language
	(
     Language_ID INTEGER NOT NULL PRIMARY KEY,
     Name NVARCHAR (50) NOT NULL
	 )

CREATE TABLE Course
	(
     Course_ID INTEGER NOT NULL PRIMARY KEY,
	 Name NVARCHAR (50) NOT NULL ,
     Hours INTEGER NOT NULL ,
     Points INTEGER NOT NULL ,
     Type_ID INTEGER NOT NULL,
	 Language_ID INTEGER NOT NULL,
     FOREIGN KEY (Language_ID) REFERENCES Language (Language_ID),
	 FOREIGN KEY (Type_ID) REFERENCES Type_Of_Course (Type_ID)
    )


CREATE TABLE Class
	(
     Class_ID INTEGER NOT NULL PRIMARY KEY,
	 Course_ID INTEGER NOT NULL,
     Class_Name NVARCHAR (50) NOT NULL ,
     Teacher_ID INTEGER NOT NULL ,
     Start_Date Date NOT NULL ,
     End_Date Date NOT NULL
	 FOREIGN KEY (Course_ID) REFERENCES Course (Course_ID),
	 FOREIGN KEY (Teacher_ID) REFERENCES Persons (Person_ID),

    )



CREATE TABLE Exams
	(
     Exam_ID INTEGER NOT NULL PRIMARY KEY,
     Class_ID INTEGER NOT NULL ,
     Exam_Date Date NOT NULL ,
     Teacher_ID NVARCHAR (50) NOT NULL,
	 FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID)
    )



CREATE TABLE Classroom
	(
     Classroom_ID INTEGER NOT NULL PRIMARY KEY,
     Class_ID INTEGER NOT NULL,
	 Student_ID INTEGER NOT NULL,
	 FOREIGN KEY (Class_ID) REFERENCES Class (Class_ID),
	 FOREIGN KEY (Student_ID) REFERENCES Persons (Person_ID)
	 )

 CREATE TABLE Exams_Results
	(
     Mark_ID INTEGER NOT NULL PRIMARY KEY,
     Exam_ID INTEGER NOT NULL ,
     Student_ID INTEGER NOT NULL ,
     Teacher_ID INTEGER NOT NULL ,
	 Status NVARCHAR (50) NOT NULL ,
	 Mark INTEGER NOT NULL ,
	 Exam_Date Date NOT NULL ,
	 Resit_Date Date,
	 FOREIGN KEY (Exam_ID) REFERENCES Exams (Exam_ID),
	 FOREIGN KEY (Teacher_ID) REFERENCES Persons (Person_ID)
    )

	CREATE TABLE Absences
	(
     Classroom_ID INTEGER NOT NULL,
     Absence_Date Date NOT NULL,
	 Status NVARCHAR (50) NOT NULL,
	 PRIMARY KEY (Classroom_ID, Absence_Date),
	 FOREIGN KEY (Classroom_ID) REFERENCES Classroom (Classroom_ID)
    )



SELECT * From Accounts
SELECT * From Persons
SELECT * From Students_Parents
SELECT * From Person_Types
SELECT * From Class
SELECT * From Course
SELECT * From Type_Of_Course
SELECT * From Language
SELECT * From Exams
SELECT * From Classroom
SELECT * From Exams_Results
SELECT * From Absences





ALTER TABLE Accounts
ADD CONSTRAINT pass CHECK ( LEN(Password) > 8)

ALTER TABLE Course
ADD CONSTRAINT Points CHECK(Points > 0)

ALTER TABLE Course
ADD CONSTRAINT Hours CHECK(Hours > 0) 




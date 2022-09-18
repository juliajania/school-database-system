--the view shows the number of men in the class 


SELECT Gender, C.Class_ID, COUNT(*)
FROM Class AS C
JOIN Classroom AS Cl ON C.Class_ID = CL.Class_ID
JOIN Persons AS P ON P.Person_ID = CL.Classroom_ID
WHERE Gender = 'Male'
GROUP BY Gender, C.Class_ID



-- view shows statistics with breakdown of classes by gender
SELECT Gender, C.Class_ID, COUNT(*)
FROM Class AS C
JOIN Classroom AS Cl ON C.Class_ID = CL.Class_ID
JOIN Persons AS P ON P.Person_ID = CL.Classroom_ID
GROUP BY Gender, C.Class_ID


-- view displays students in a class that has classes in Polish

SELECT Distinct P.Person_ID, L.Name, P.Surname
FROM Persons AS P
JOIN Classroom AS CL ON P.Person_ID = CL.Student_ID 
JOIN Class AS C ON C.Class_ID = CL.Class_ID  
JOIN Course AS CO ON CO.Course_ID = C.Class_ID
JOIN Language AS L ON L.Language_ID = CO.Language_ID
WHERE L.Name = 'POLISH'



-- the view displays the language and the number of classes in which this language is taught

SELECT P1.Name, P2.*
FROM Language AS P1 
JOIN (
SELECT L.Language_ID, Count (Class_ID) AS Classes 
FROM Language AS L
JOIN Course AS CO ON L.Language_ID = CO.Language_ID
JOIN Class AS C ON C.Course_ID = CO.Course_ID
GROUP BY L.Language_ID ) AS P2
ON P1.Language_ID = P2.Language_ID



-- the view shows information about the student and the number of hours of all his/her activities

SELECT P1.*, number_of_hours
FROM Persons AS P1
JOIN
(
SELECT CL.Student_ID, SUM(Hours) AS number_of_hours
FROM Classroom AS CL 
JOIN Class AS C ON CL.Class_ID = C.Class_ID
JOIN Course CO ON CO.Course_ID = C.Course_ID
GROUP BY CL.Student_ID
) AS P2 ON P1.Person_ID = P2.Student_ID



-- view shows student account passwords starting with the number 8 

SELECT Password, P.*
FROM Accounts AS A
JOIN Persons AS P ON A.Account_ID = P.Person_ID
WHERE Password LIKE '8%'


-- the view shows the number of passwords that have fewer or 10 characters

SELECT COUNT(*)
FROM Accounts 
WHERE LEN (Password) <= '10'


-- view shows students who have failed the exam and number of failed exams

SELECT Student_ID, COUNT(Mark_ID)
FROM Exams_Results AS ER
WHERE Status = 'FAIL'
GROUP BY Student_ID



--view shows unjustified hours 

SELECT P.Person_ID, COUNT(Status) AS number_of_unexcused_hours
FROM Absences AS A
JOIN Classroom AS CL ON CL.Classroom_ID = A.Classroom_ID
JOIN Persons AS P ON P.Person_ID = CL.Student_ID 
WHERE Status = 'ABSENT'
GROUP BY P.Person_ID   


-- the student's average in all possible examinations 

SELECT *
FROM Persons AS P
JOIN
(SELECT Student_ID, AVG(Mark) AS average_mark
FROM Exams_Results 
GROUP BY Student_ID) 
AS P1 ON P.Person_ID = P1.Student_ID


-- For each group (class), we counted the number of attendances and absences and the percentage of non-attendance. 

SELECT *, FORMAT ( CAST (O2.number_of_absences AS DECIMAL(5, 2)) / (  number_of_absences + O1.number_of_presences) , 'P')
FROM Class AS C
JOIN
(SELECT CL.Class_ID, COUNT(*) AS number_of_presences
FROM Absences AS A
JOIN Classroom AS CL ON A.Classroom_ID = CL.Classroom_ID
WHERE Status = 'Present'
GROUP BY CL.Class_ID)
AS O1 ON C.Class_ID = O1.Class_ID
JOIN
(SELECT CL.Class_ID, COUNT(*) AS number_of_absences
FROM Absences AS A
JOIN Classroom AS CL ON A.Classroom_ID = CL.Classroom_ID
WHERE Status = 'Absent'
GROUP BY CL.Class_ID)
AS O2 ON C.Class_ID = O2.Class_ID

-- average grade in each class

SELECT Class_Name, C2.Class_ID, average_mark_in_class
FROM Class AS C1
JOIN
(SELECT C.Class_ID, AVG(ER.Mark) AS average_mark_in_class
FROM Class AS C 
JOIN Exams AS E ON E.Class_ID = C.Class_ID
JOIN Exams_Results AS ER ON ER.Exam_ID = E.Exam_ID
GROUP BY C.Class_ID
) AS C2 ON C1.Class_ID = C2.Class_ID        



-- statistics where there is a student and for each of his subjects his average is given 

SELECT P.*, CO1.Name, CO2.Student_ID, CO2.Course_ID, average_mark
FROM Course AS CO1
JOIN 
(SELECT ER.Student_ID, CO.Course_ID, AVG(ER.Mark) AS average_mark
FROM Course AS CO
JOIN Class AS C ON CO.Course_ID = C.Course_ID
JOIN Exams AS E ON E.Class_ID = C.Class_ID
JOIN Exams_Results AS ER ON ER.Exam_ID = ER.Exam_ID
GROUP BY ER.Student_ID, CO.Course_ID) AS CO2 ON CO1.Course_ID = CO2.Course_ID  
JOIN Persons AS P ON P.Person_ID = CO2.Student_ID 


-- how many classes (not courses) there are for a given language 

SELECT L.*, number_of_classes 
FROM Language AS L
JOIN
(SELECT CO.Language_ID, COUNT(C.Class_Name) AS number_of_classes 
FROM Course AS CO 
JOIN Class AS C ON C.Course_ID = CO.Course_ID
GROUP BY CO.Language_ID) AS L1 ON L.Language_ID = L1.Language_ID

 
 -- for each student count the number of unexcused absences

 SELECT CL.Student_ID, COUNT(Status) AS number_of_unexcused_absences
 FROM Absences AS A
 JOIN Classroom AS CL ON A.Classroom_ID = CL.Classroom_ID
 WHERE Status = 'Absent'
 GROUP BY CL.Student_ID  


 -- display all students who have no absences

 SELECT *
 FROM Persons AS P
 WHERE Person_ID NOT IN  
 (SELECT Distinct (Student_ID)
 FROM Absences AS A
 JOIN Classroom AS CL ON A.Classroom_ID = CL.Classroom_ID
 WHERE Status = 'ABSENT') 
 


 -- display the teacher's data (i.e. type of persons teacher and average marks of the exams he/she has taken)

 SELECT P.*, Teacher_ID, Exam_ID, average_mark
 FROM Persons AS P
 JOIN
 (SELECT Teacher_ID, Exam_ID, AVG(Mark) AS average_mark
 FROM Exams_Results AS ER
 GROUP BY Teacher_ID, Exam_ID)
 AS T ON T.Exam_ID = P.Person_ID
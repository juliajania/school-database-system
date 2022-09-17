CREATE PROCEDURE id_of_course 
@temp INT  
AS
 SELECT Distinct(CL.Student_ID)
 FROM Classroom AS CL
 JOIN Class AS C ON CL.Class_ID = C.Class_ID
 JOIN Course AS CO ON CO.Course_ID = C.Course_ID
 WHERE CO.Course_ID = @temp
 GO;

 EXEC id_of_course @temp = 3

 -------------------------------------------------------------------------------------
CREATE PROCEDURE course_average_for_student
@temp INT
AS
SELECT P.*, CO1.Name AS Course_Name, CO2.Student_ID, CO2.Course_ID, average
FROM Course AS CO1
JOIN 
	(SELECT ER.Student_ID, CO.Course_ID, AVG(ER.Mark) AS average
	FROM Course AS CO
	JOIN Class AS C ON CO.Course_ID = C.Course_ID
	JOIN Exams AS E ON E.Class_ID = C.Class_ID
	JOIN Exams_Results AS ER ON ER.Exam_ID = ER.Exam_ID
	GROUP BY ER.Student_ID, CO.Course_ID) AS CO2 ON CO1.Course_ID = CO2.Course_ID  
JOIN Persons AS P ON P.Person_ID = CO2.Student_ID 
WHERE Person_ID = @temp


EXEC course_average_for_student @temp = 6


------------------------------------------------------------------------------------------

CREATE PROCEDURE display_best_students
@Exam_ID INT,
@Highest_Score INT
AS
SELECT P.Name, P.Surname, ER.Mark
FROM Exams_Results AS ER
JOIN Exams AS E ON ER.Exam_ID = E.Exam_ID
JOIN Persons AS P ON P.Person_ID = ER.Mark_ID
WHERE  E.Exam_ID = @Exam_ID AND Mark = @Highest_Score
GROUP BY P.Name, P.Surname, ER.Mark


EXEC display_best_students @Exam_ID = 14, @Highest_Score = 6 



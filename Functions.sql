

CREATE FUNCTION person_having_course_in_language
(@Language_name NVARCHAR(10))
RETURNS TABLE
AS 
RETURN 
	(SELECT Distinct P.Person_ID, L.Name, P.Surname
	FROM Persons AS P
	JOIN Classroom AS CL ON P.Person_ID = CL.Student_ID 
	JOIN Class AS C ON C.Class_ID = CL.Class_ID  
	JOIN Course AS CO ON CO.Course_ID = C.Class_ID
	JOIN Language AS L ON L.Language_ID = CO.Language_ID
	WHERE L.Name = @Language_name)
GO

SELECT *
FROM person_having_course_in_language
('ENGLISH') GO;


-----------------------------------------------------------------------------------------------------

CREATE FUNCTION absences_data_by_student
(@Status NVARCHAR (10))
RETURNS TABLE
AS
RETURN 
	(SELECT P.Person_ID, COUNT(Status) AS number_of_hours
	FROM Absences AS A
	JOIN Classroom AS CL ON CL.Classroom_ID = A.Classroom_ID
	JOIN Persons AS P ON P.Person_ID = CL.Student_ID 
	WHERE Status = @Status
	GROUP BY P.Person_ID)   
	GO;

SELECT *
FROM absences_data_by_student
('ABSENT') GO;


CREATE FUNCTION average_mark_for_student
(@Mark INT)
RETURNS TABLE 
AS
RETURN (
SELECT *
FROM Persons AS P
JOIN
	(SELECT Student_ID, AVG(Mark) AS average_mark
	FROM Exams_Results
	WHERE Mark = @Mark
	GROUP BY Student_ID) 
AS P1 ON P.Person_ID = P1.Student_ID)
GO

SELECT * 
FROM average_mark_for_student                        
(2)
SELECT * 
FROM average_mark_for_student                        
(5)
SELECT * 
FROM average_mark_for_student                        
(6)

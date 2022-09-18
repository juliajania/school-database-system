-- trigger checks if created course has duration between 30 and 365 days 

CREATE TRIGGER check_lenght_of_course ON Class
FOR INSERT, UPDATE
AS
        DECLARE @start DATE
        DECLARE @end DATE
        DECLARE @number_of_days INT
        SELECT @start = (SELECT Start_Date FROM inserted)
        SELECT @end = (SELECT End_Date FROM inserted)
        SELECT  @number_of_days  = DATEDIFF(DAY, @start, @end)
                IF( @number_of_days < 30)
                        PRINT 'the course lasts less than 30 days'
                ELSE IF(@number_of_days > 365)
                        PRINT 'the course lasts more than 365 days'

---------------------------------------------------------------------------------------------------------------


-- auditing mechanism for Acccounts table. Changed data (before update and delete) are saved in Accounts_Audit table 

CREATE TRIGGER Accounts_Audit_Backup ON Accounts
FOR UPDATE, DELETE
AS
	INSERT INTO Accounts_Audit  
	SELECT *, GETDATE() FROM deleted
 

Select * from Accounts_Audit
SELECT GETDATE();

DELETE FROM Persons WHERE Person_ID = 11
DELETE FROM Accounts WHERE Account_ID = 11

-----------------------------------------------------------------------------------------------------------------------

-- trigger displays resit date for failded exams

CREATE TRIGGER display_resit_date ON Exams_Results 
FOR INSERT
AS 
	DECLARE @resit DATE 
	DECLARE @mark INT
	SELECT @mark = (select Mark from inserted)
	SELECT @resit =  (GETDATE() + 14) 
	IF( @mark = 1)
	PRINT 'mandatory resit by: ' + CONVERT(varchar(100), @resit)
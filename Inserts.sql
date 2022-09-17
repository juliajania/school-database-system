use Northwind

INSERT INTO Accounts VALUES 
('IzaPuj','alejna93@gmaıl.net','kw1jasd10234', '2022-09-01'),
('PawKli','pablo@gmaıl.com','$%567^&gH','2022-09-01'),
('DarDru','hokkaido@otpku.com','151abcd151','2022-09-01'),
('JacNow','vsolomonik@ianz.pro','a3c4e5gHd6$','2022-09-01'),
('NatDoz','olshevskiboy@asifboot.com','974464444','2022-09-01'),
('KlaKow','dulsiniaakhtiamova@mitakian.com','12634df56','2022-09-01'),
('MonWoj','7658@fashionsell.fun','85sd85ds85','2022-09-01'),
('BerKal','crna2004@cggup.com','HHHBB%^s85','2022-09-01'),
('BogKoz','kozakbogdan@gmailni.com','963214h587','2019-09-01'),
('MacPor','max78b@otpku.com','AAA346h567','2019-09-01'),
('PioTre','shtjjytr@nomnomca.com','85ds1hh234','2019-09-01'),
('AnnRab','dph039@24hinbox.com','85858566g','2021-09-01'),
('DarSam','severtan1967@nakiuha.com','%^&h*66q85','2021-09-01'),
('TomZaj','chincreamer@omtecha.com','85s2ds4sx','2021-09-01'),
('KlaJur','urlmayurs@hacktoy.com','25252h525','2021-09-01'),
('EdwDen','bleeble@technicloud.tech','85asdasdasd','2021-09-01'),
('JulBie','scooter1916@onlinecmail.com','klas66klas','2021-09-01');

INSERT INTO Person_Types VALUES 
(1, 'Teacher'),
(2, 'Student'),
(3, 'Parent');



INSERT INTO Persons VALUES 
(1, 'Kinga','Adamska','Female','3329824',1),
(2, 'Ania','Klimek','Female','8373474',2),
(3, 'Ania','Adamska','Female','4566666',2),
(4, 'Kinga','Milk','Female','332459824',2),
(5, 'Monika','Salamon','Female','8974783',3),
(6, 'Dominik','Szawarek', 'Male','5678934556',3),
(7, 'Arnold','Komorowski','Male','873456788',2),
(8, 'Kasia','Antko','Female',' 233456723',2),
(9, 'Jowita', 'Kokos','Female','345657890',2),
(10, 'Anna','Fostova','Female','298476387',2),
(11, 'Dominik', 'Monik', 'Male', '98364789',2),
(12, 'Dominik', 'Adeks', 'Male', '983634289',2),
(13, 'Lucjan', 'Monik', 'Male', '93214789',2),
(14, 'Monika', 'Kuzynek', 'Female', '67890789',2),
(15, 'Weronika', 'Duren', 'Female', '45674789',2),
(16, 'Dominik', 'Lelek', 'Male', '95364789',2),
(17, 'Brajan', 'Domek', 'Male', '98364789',2);

INSERT INTO Students_Parents VALUES 
(1,2),
(2,1),
(3,3),
(4,5),
(5,4),
(6,3),
(7,2);




INSERT INTO Language VALUES
(1, 'POLISH'),
(2, 'ENGLISH'),
(3, 'UKRAINIAN');


INSERT INTO Type_Of_Course VALUES
(1, 'e-learning'),
(2, 'lecture'),
(3, 'lessons'),
(4, 'practical');






INSERT INTO Course VALUES
(1, 'Mathematics',30,120,4,1),
(2, 'Informatics',30,80,4,1),
(3, 'Physics', 20,80,1,2),
(4, 'History' , 30,80,2,1);



INSERT INTO Class VALUES 
(1, 3, 'A', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(2, 3, 'A', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(3, 3, 'A', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(4, 2, 'B', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(5, 1, 'B', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(6, 1, 'A', 1,'2022-09-01','2025-06-26');
INSERT INTO Class VALUES
(7, 1, 'B', 1,'2022-09-01','2025-06-26');




INSERT INTO Exams VALUES 
(12, 1, '2023-06-21', 1),
(13, 4, '2023-06-21', 1),
(14, 6, '2023-06-21', 1),
(15, 7, '2023-06-21', 1);




INSERT INTO Classroom VALUES 
(1, 3, 5),
(2, 2, 5),
(3, 3, 4),
(4, 2, 3),
(5, 3, 3),
(6, 2, 3),
(7, 2, 7);



INSERT INTO Exams_Results VALUES
(1, 12, 4, 5, 'FAIL', 1,'2023-06-21',NULL);
INSERT INTO Exams_Results VALUES
(2, 14, 6, 3, 'PASS', 6,'2023-06-21',NULL);
INSERT INTO Exams_Results VALUES
(3, 13, 2, 1, 'PASS', 5,'2023-06-21',NULL);
INSERT INTO Exams_Results VALUES
(4, 13, 2, 5, 'PASS', 5,'2023-06-21',NULL);
INSERT INTO Exams_Results VALUES
(5, 15, 4, 1, 'FAIL', 2,'2023-06-19',NULL);
INSERT INTO Exams_Results VALUES
(6, 14, 4, 1, 'FAIL', 1,'2023-06-20',NULL);





INSERT INTO Absences VALUES
(1, '2023-01-20', 'PRESENT'),
(2, '2022-12-12', 'ABSENT'),
(3, '2023-03-22', 'ABSENT'),
(4, '2023-03-22', 'ABSENT'),
(5, '2023-03-22', 'ABSENT'),
(6, '2023-03-22', 'PRESENT');
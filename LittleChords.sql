CREATE DATABASE IF NOT EXISTS littlechordskindergarten;
USE littlechordskindergarten;

CREATE TABLE employee (
    employeeid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    position VARCHAR(30) NOT NULL,
    hiredate DATE NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);

CREATE TABLE section (
    sectionid INT PRIMARY KEY AUTO_INCREMENT,
    sectionname VARCHAR(30) NOT NULL,
    roomnumber VARCHAR(10) NOT NULL,
    employeeid INT,
    FOREIGN KEY (employeeid) REFERENCES employee(employeeid)
);

CREATE TABLE student (
    studentid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    enrolldate DATE NOT NULL,
    sectionid INT,
    FOREIGN KEY (sectionid) REFERENCES section(sectionid)
);

CREATE TABLE health_record (
    recordid INT PRIMARY KEY AUTO_INCREMENT,
    vaccinename VARCHAR(50) NOT NULL,
    vaccinedate DATE NOT NULL,
    allergynotes VARCHAR(255) NULL,
    studentid INT,
    FOREIGN KEY (studentid) REFERENCES student(studentid)
);

CREATE TABLE payment (
    paymentid INT PRIMARY KEY AUTO_INCREMENT,
    amount NUMERIC(8,2) NOT NULL,
    paymentdate DATE NOT NULL,
    paymentmethod VARCHAR(20) NOT NULL,
    studentid INT,
    FOREIGN KEY (studentid) REFERENCES student(studentid)
);

CREATE TABLE inventory_item (
    itemid INT PRIMARY KEY AUTO_INCREMENT,
    itemname VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL,
    quantity INT NOT NULL,
    reorderlevel INT NOT NULL
);

INSERT INTO employee (firstname, lastname, position, hiredate, salary) VALUES
('Maria', 'Gonzalez', 'Teacher', '2019-08-01', 42000.00),
('James', 'Carter', 'Teacher', '2020-01-15', 41000.00),
('Linda', 'Nguyen', 'Teacher', '2018-09-01', 43500.00),
('Robert', 'Kim', 'Teacher', '2021-03-10', 40000.00),
('Susan', 'Patel', 'Teacher', '2017-07-22', 45000.00),
('David', 'Brown', 'Assistant', '2022-02-14', 32000.00),
('Angela', 'Diaz', 'Assistant', '2021-11-01', 31500.00),
('Kevin', 'Wright', 'Assistant', '2023-01-09', 30500.00),
('Rachel', 'Lopez', 'Admin', '2016-06-01', 48000.00),
('Thomas', 'Scott', 'Admin', '2020-10-05', 46000.00),
('Emily', 'Turner', 'Teacher', '2019-04-18', 42500.00),
('Michael', 'Adams', 'Teacher', '2022-08-22', 39500.00),
('Karen', 'Bennett', 'Assistant', '2020-05-30', 31000.00),
('Steven', 'Coleman', 'Assistant', '2021-09-13', 32500.00),
('Nancy', 'Foster', 'Teacher', '2018-01-20', 44000.00),
('Brian', 'Hayes', 'Teacher', '2023-03-01', 38500.00),
('Laura', 'Jenkins', 'Assistant', '2019-12-02', 31200.00),
('Daniel', 'Morris', 'Teacher', '2021-06-16', 40500.00),
('Patricia', 'Reed', 'Admin', '2015-09-09', 49000.00),
('Christopher', 'Ward', 'Assistant', '2022-04-25', 30800.00);

INSERT INTO section (sectionname, roomnumber, employeeid) VALUES
('Section 1', '101', 1),
('Section 2', '102', 2),
('Section 3', '103', 3),
('Section 4', '104', 5),
('Section 5', '105', 11);

INSERT INTO student (firstname, lastname, dob, gender, enrolldate, sectionid) VALUES
('Ava', 'Smith', '2021-03-14', 'Female', '2025-08-01', 1),
('Liam', 'Johnson', '2021-05-22', 'Male', '2025-08-01', 1),
('Olivia', 'Williams', '2021-01-09', 'Female', '2025-08-01', 1),
('Noah', 'Jones', '2021-07-30', 'Male', '2025-08-01', 2),
('Emma', 'Garcia', '2021-02-18', 'Female', '2025-08-01', 2),
('Elijah', 'Martinez', '2021-06-11', 'Male', '2025-08-01', 2),
('Charlotte', 'Davis', '2021-04-25', 'Female', '2025-08-01', 3),
('James', 'Rodriguez', '2021-09-02', 'Male', '2025-08-01', 3),
('Amelia', 'Wilson', '2021-08-17', 'Female', '2025-08-01', 3),
('Benjamin', 'Anderson', '2021-03-29', 'Male', '2025-08-01', 4),
('Mia', 'Thomas', '2021-11-05', 'Female', '2025-08-01', 4),
('Lucas', 'Taylor', '2021-01-27', 'Male', '2025-08-01', 4),
('Harper', 'Moore', '2021-10-14', 'Female', '2025-08-01', 5),
('Henry', 'Jackson', '2021-05-08', 'Male', '2025-08-01', 5),
('Evelyn', 'Martin', '2021-12-19', 'Female', '2025-08-01', 5),
('Alexander', 'Lee', '2021-02-02', 'Male', '2026-01-12', 1),
('Ella', 'Perez', '2021-06-23', 'Female', '2026-01-12', 2),
('Michael', 'White', '2021-04-06', 'Male', '2026-01-12', 3),
('Scarlett', 'Harris', '2021-09-28', 'Female', '2026-01-12', 4),
('Daniel', 'Clark', '2021-07-15', 'Male', '2026-01-12', 5);

INSERT INTO health_record (vaccinename, vaccinedate, allergynotes, studentid) VALUES
('MMR', '2022-03-01', NULL, 1),
('Flu', '2025-09-15', 'Peanuts', 1),
('MMR', '2022-05-10', NULL, 2),
('MMR', '2022-01-20', 'None', 3),
('Flu', '2025-09-16', NULL, 4),
('MMR', '2022-07-05', 'Dairy', 5),
('Flu', '2025-09-15', NULL, 6),
('MMR', '2022-04-15', NULL, 7),
('Flu', '2025-09-20', 'Tree nuts', 8),
('MMR', '2022-09-01', NULL, 9),
('MMR', '2022-03-25', NULL, 10),
('Flu', '2025-09-18', NULL, 11),
('MMR', '2022-11-02', 'Eggs', 12),
('MMR', '2022-10-10', NULL, 13),
('Flu', '2025-09-15', NULL, 14),
('MMR', '2022-12-15', NULL, 15),
('MMR', '2022-02-02', 'Shellfish', 16),
('MMR', '2022-06-20', NULL, 17),
('MMR', '2022-04-06', NULL, 18),
('MMR', '2022-09-25', 'None', 19);

INSERT INTO payment (amount, paymentdate, paymentmethod, studentid) VALUES
(500.00, '2025-08-05', 'Card', 1),
(500.00, '2025-08-05', 'Cash', 2),
(500.00, '2025-08-06', 'Check', 3),
(500.00, '2025-08-06', 'Card', 4),
(500.00, '2025-08-07', 'Card', 5),
(500.00, '2025-08-07', 'Cash', 6),
(500.00, '2025-08-08', 'Card', 7),
(500.00, '2025-08-08', 'Check', 8),
(500.00, '2025-08-09', 'Card', 9),
(500.00, '2025-08-09', 'Cash', 10),
(500.00, '2025-09-05', 'Card', 1),
(500.00, '2025-09-05', 'Cash', 2),
(500.00, '2025-09-06', 'Card', 3),
(500.00, '2025-09-06', 'Check', 4),
(500.00, '2025-09-07', 'Card', 5),
(500.00, '2025-09-08', 'Cash', 11),
(500.00, '2025-09-08', 'Card', 12),
(500.00, '2025-09-09', 'Card', 13),
(500.00, '2025-09-09', 'Check', 14),
(500.00, '2025-09-10', 'Cash', 15);

INSERT INTO inventory_item (itemname, category, quantity, reorderlevel) VALUES
('Crayons (24-pack)', 'Supplies', 40, 10),
('Construction Paper', 'Supplies', 8, 15),
('Building Blocks', 'Toys', 25, 5),
('Puzzle Set', 'Toys', 12, 5),
('Finger Paint', 'Supplies', 6, 10),
('Glue Sticks', 'Supplies', 50, 20),
('Story Books', 'Toys', 30, 10),
('Nap Mats', 'Supplies', 22, 20),
('Snack Crackers', 'Food', 5, 15),
('Juice Boxes', 'Food', 60, 25),
('Milk Cartons', 'Food', 4, 20),
('Play Dough', 'Toys', 18, 8),
('Whiteboard Markers', 'Supplies', 15, 10),
('Scissors (kid-safe)', 'Supplies', 20, 10),
('Alphabet Chart', 'Supplies', 10, 5),
('Building Bricks', 'Toys', 3, 10),
('Coloring Books', 'Supplies', 35, 15),
('Rest Blankets', 'Supplies', 16, 10),
('Fruit Snacks', 'Food', 45, 20),
('Water Bottles', 'Supplies', 28, 10);

SELECT studentid, firstname, lastname, enrolldate
FROM student
ORDER BY lastname ASC;

SELECT studentid, firstname, lastname, dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS ageinyears
FROM student
WHERE YEAR(dob) = 2021 AND MONTH(enrolldate) >= 8;

SELECT position, COUNT(*) AS numemployees, AVG(salary) AS avgsalary
FROM employee
GROUP BY position;

SELECT studentid, firstname, lastname
FROM student
WHERE studentid NOT IN (
    SELECT studentid FROM health_record WHERE vaccinename = 'Flu'
);

SELECT s.sectionname, s.roomnumber, e.firstname, e.lastname
FROM section s
INNER JOIN employee e ON s.employeeid = e.employeeid;

SELECT st.studentid, st.firstname, st.lastname, hr.vaccinename, hr.vaccinedate
FROM student st
LEFT JOIN health_record hr ON st.studentid = hr.studentid;

CREATE VIEW studentpaymentsummary AS
SELECT st.studentid, st.firstname, st.lastname, sec.sectionname,
       SUM(p.amount) AS totalpaid
FROM student st
JOIN section sec ON st.sectionid = sec.sectionid
JOIN payment p ON st.studentid = p.studentid
GROUP BY st.studentid, st.firstname, st.lastname, sec.sectionname;

SELECT * FROM studentpaymentsummary ORDER BY totalpaid DESC;

SELECT firstname, lastname, 'Senior Staff' AS reason FROM employee WHERE hiredate < '2020-01-01'
UNION
SELECT firstname, lastname, 'High Earner' AS reason FROM employee WHERE salary > 44000;

DELIMITER //
CREATE FUNCTION getstudentage(p_studentid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT TIMESTAMPDIFF(YEAR, dob, CURDATE()) FROM student WHERE studentid = p_studentid);
END //
DELIMITER ;

SELECT studentid, firstname, lastname, getstudentage(studentid) AS age
FROM student;

DELIMITER //
CREATE PROCEDURE getsectionroster(p_sectionid INT)
BEGIN
    SELECT studentid, firstname, lastname, enrolldate
    FROM student
    WHERE sectionid = p_sectionid
    ORDER BY lastname;
END //
DELIMITER ;

CALL getsectionroster(1);
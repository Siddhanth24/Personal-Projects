CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  address VARCHAR(200) NOT NULL,
  admission_date DATE NOT NULL,
  graduation_date DATE,
  program_id INT NOT NULL,
  FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE programs (
  program_id INT PRIMARY KEY,
  program_name VARCHAR(100) NOT NULL,
  program_code VARCHAR(10) NOT NULL
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  course_code VARCHAR(10) NOT NULL,
  program_id INT NOT NULL,
  FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  grade DECIMAL(4,2),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO programs (program_id, program_name, program_code) VALUES
  (1, 'Computer Science', 'CSC'),
  (2, 'Electronics Engineering', 'ECE'),
  (3, 'Business Administration', 'BBA'),
  (4, 'Bachelor of Technology', 'BTech');
  
INSERT INTO courses (course_id, course_name, course_code, program_id)
VALUES
(201, 'Introduction to Computer Science', 'CS101', 1),
(202, 'Financial Accounting', 'ACC201', 3),
(203, 'Marketing Management', 'MKT301', 2),
(204, 'Data Structures and Algorithms', 'CS201', 1),
(205, 'Managerial Economics', 'ECO301', 2),
(206, 'Business Statistics', 'STAT401', 2),
(207, 'Financial Management', 'FIN401', 2),
(208, 'Microeconomics', 'ECO201', 3),
(209, 'Macroeconomics', 'ECO301', 3),
(210, 'Database Systems', 'CS301', 1);

INSERT INTO students (student_id, first_name, last_name, email, phone_number, address, admission_date, graduation_date, program_id) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '+91 9876543210', '123 Main St, Bengaluru, Karnataka', '2020-08-01', NULL, 1),
(2, 'Aditi', 'Patel', 'aditi.patel@example.com', '+91 9876543211', '456 First Ave, Mumbai, Maharashtra', '2020-08-01', NULL, 1),
(3, 'Alok', 'Singh', 'alok.singh@example.com', '+91 9876543212', '789 Second St, Delhi, Delhi', '2020-08-01', NULL, 2),
(4, 'Anjali', 'Gupta', 'anjali.gupta@example.com', '+91 9876543213', '456 Third Ave, Pune, Maharashtra', '2020-08-01', NULL, 2),
(5, 'Arnav', 'Kumar', 'arnav.kumar@example.com', '+91 9876543214', '123 Fourth St, Kolkata, West Bengal', '2020-08-01', NULL, 3),
(6, 'Aryan', 'Verma', 'aryan.verma@example.com', '+91 9876543215', '789 Fifth Ave, Chennai, Tamil Nadu', '2020-08-01', NULL, 3),
(7, 'Avni', 'Nair', 'avni.nair@example.com', '+91 9876543216', '123 Sixth St, Hyderabad, Telangana', '2020-08-01', NULL, 1),
(8, 'Chirag', 'Rao', 'chirag.rao@example.com', '+91 9876543217', '456 Seventh Ave, Mumbai, Maharashtra', '2020-08-01', NULL, 2),
(9, 'Devanshi', 'Krishna', 'devanshi.krishna@example.com', '+91 9876543218', '789 Eighth St, Ahmedabad, Gujarat', '2020-08-01', NULL, 3),
(10, 'Dhruv', 'Saxena', 'dhruv.saxena@example.com', '+91 9876543219', '123 Ninth Ave, Bengaluru, Karnataka', '2020-08-01', NULL, 1);

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date, grade)
VALUES (101, 1, 201, '2022-09-01', 3.5),
(102, 2, 202, '2022-09-01', 4.0),
(103, 3, 203, '2022-09-01', 3.2),
(104, 4, 201, '2022-09-01', 3.8),
(105, 5, 202, '2022-09-01', 3.0),
(106, 6, 203, '2022-09-01', 3.5),
(107, 7, 201, '2022-09-01', 2.7),
(108, 8, 202, '2022-09-01', 3.9),
(109, 9, 203, '2022-09-01', 4.0),
(110, 10, 201, '2022-09-01', 3.6);

--Get the list of courses in a program.
SELECT program_name, course_name, course_code
FROM programs p
INNER JOIN courses c ON p.program_id = c.program_id;

--Get the details of all the students who are enrolled in a course.
SELECT s.student_id, s.first_name, s.last_name, s.email, c.course_id, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

--Retrieve the number of students enrolled in each program:
SELECT p.program_name, COUNT(DISTINCT s.student_id) AS num_students
FROM programs p
JOIN courses c ON p.program_id = c.program_id
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
GROUP BY p.program_name;

--Retrieve the average grade for a specific course:
SELECT AVG(e.grade) AS average_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Introduction to Computer Science';

--Retrieve all courses that a specific student is enrolled in:
SELECT c.course_name, c.course_code
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE e.student_id = 1;

--Retrieve all students who are enrolled in a specific course:
SELECT s.first_name, s.last_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Introduction to Computer Science';

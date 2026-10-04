-- hospital_management.sql
-- Practical Exam Set C
DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

-- 1. TABLES
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(150),
    registration_date DATE
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status ENUM('Scheduled','Completed','Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(150),
    prescription VARCHAR(200),
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Hospital_Stays (
    stay_id INT PRIMARY KEY,
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status ENUM('Paid','Pending','Cancelled'),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Patients (patient_id, name, age, gender, phone_number, email, address, registration_date) VALUES
(1, 'Aarav Shah', 21, 'Female', '9810000001', 'patient1@mail.com', 'Navsari', '2024-01-09'),
(2, 'Diya Patel', 22, 'Male', '9810000002', 'patient2@mail.com', 'Valsad', '2024-01-17'),
(3, 'Riya Desai', 23, 'Female', '9810000003', 'patient3@mail.com', 'Chikhli', '2024-01-25'),
(4, 'Kabir Mehta', 24, 'Male', '9810000004', 'patient4@mail.com', 'Bilimora', '2024-02-02'),
(5, 'Anaya Joshi', 25, 'Female', NULL, 'patient5@mail.com', 'Surat', '2024-02-10'),
(6, 'Arjun Shah', 26, 'Male', '9810000006', 'patient6@mail.com', 'Navsari', '2024-02-18'),
(7, 'Isha Patel', 27, 'Female', '9810000007', 'patient7@mail.com', 'Valsad', '2024-02-26'),
(8, 'Vivaan Desai', 28, 'Male', '9810000008', 'patient8@mail.com', 'Chikhli', '2024-03-05'),
(9, 'Myra Mehta', 29, 'Female', '9810000009', 'patient9@mail.com', 'Bilimora', '2024-03-13'),
(10, 'Rehan Khan', 30, 'Male', '9810000010', 'patient10@mail.com', 'Surat', '2024-03-21'),
(11, 'Zoya Sheikh', 31, 'Female', '9810000011', 'patient11@mail.com', 'Navsari', '2024-03-29'),
(12, 'Ayaan Patel', 32, 'Male', '9810000012', 'patient12@mail.com', 'Valsad', '2024-04-06'),
(13, 'Sara Desai', 33, 'Female', '9810000013', 'patient13@mail.com', 'Chikhli', '2024-04-14'),
(14, 'Omar Khan', 34, 'Male', '9810000014', 'patient14@mail.com', 'Bilimora', '2024-04-22'),
(15, 'Mahi Shah', 35, 'Female', '9810000015', 'patient15@mail.com', 'Surat', '2024-04-30'),
(16, 'Dev Mehta', 36, 'Male', '9810000016', 'patient16@mail.com', 'Navsari', '2024-05-08'),
(17, 'Aisha Khan', 37, 'Female', '9810000017', 'patient17@mail.com', 'Valsad', '2024-05-16'),
(18, 'Neil Patel', 38, 'Male', NULL, 'patient18@mail.com', 'Chikhli', '2024-05-24'),
(19, 'Hiba Sheikh', 39, 'Female', '9810000019', 'patient19@mail.com', 'Bilimora', '2024-06-01'),
(20, 'Yash Desai', 40, 'Male', '9810000020', 'patient20@mail.com', 'Surat', '2024-06-09'),
(21, 'Meera Joshi', 41, 'Female', '9810000021', 'patient21@mail.com', 'Navsari', '2024-06-17'),
(22, 'Rayaan Khan', 42, 'Male', '9810000022', 'patient22@mail.com', 'Valsad', '2024-06-25'),
(23, 'Kiara Shah', 43, 'Female', '9810000023', 'patient23@mail.com', 'Chikhli', '2024-07-03'),
(24, 'Adnan Patel', 44, 'Male', '9810000024', 'patient24@mail.com', 'Bilimora', '2024-07-11'),
(25, 'Tara Desai', 45, 'Female', '9810000025', 'patient25@mail.com', 'Surat', '2024-07-19'),
(26, 'Aarush Mehta', 46, 'Male', '9810000026', 'patient26@mail.com', 'Navsari', '2024-07-27'),
(27, 'Sana Khan', 47, 'Female', '9810000027', 'patient27@mail.com', 'Valsad', '2024-08-04'),
(28, 'Ibrahim Sheikh', 48, 'Male', '9810000028', 'patient28@mail.com', 'Chikhli', '2024-08-12'),
(29, 'Nisha Patel', 49, 'Female', '9810000029', 'patient29@mail.com', 'Bilimora', '2024-08-20'),
(30, 'Farhan Shah', 50, 'Male', '9810000030', 'patient30@mail.com', 'Surat', '2024-08-28'),
(31, 'Alina Desai', 51, 'Female', '9810000031', 'patient31@mail.com', 'Navsari', '2024-09-05'),
(32, 'Rohan Mehta', 52, 'Male', '9810000032', 'patient32@mail.com', 'Valsad', '2024-09-13'),
(33, 'Inaya Khan', 53, 'Female', '9810000033', 'patient33@mail.com', 'Chikhli', '2024-09-21'),
(34, 'Sameer Patel', 54, 'Male', '9810000034', 'patient34@mail.com', 'Bilimora', '2024-09-29'),
(35, 'Aditi Shah', 55, 'Female', '9810000035', 'patient35@mail.com', 'Surat', '2024-10-07'),
(36, 'Hamza Khan', 56, 'Male', '9810000036', 'patient36@mail.com', 'Navsari', '2024-10-15'),
(37, 'Pooja Desai', 57, 'Female', '9810000037', 'patient37@mail.com', 'Valsad', '2024-10-23'),
(38, 'Karan Patel', 58, 'Male', '9810000038', 'patient38@mail.com', 'Chikhli', '2024-10-31'),
(39, 'Maryam Sheikh', 59, 'Female', NULL, 'patient39@mail.com', 'Bilimora', '2024-11-08'),
(40, 'Rudra Mehta', 60, 'Male', '9810000040', 'patient40@mail.com', 'Surat', '2024-11-16'),
(41, 'Nida Khan', 61, 'Female', '9810000041', 'patient41@mail.com', 'Navsari', '2024-11-24'),
(42, 'Manav Shah', 62, 'Male', '9810000042', 'patient42@mail.com', 'Valsad', '2024-12-02'),
(43, 'Saira Patel', 63, 'Female', '9810000043', 'patient43@mail.com', 'Chikhli', '2024-12-10'),
(44, 'Dhruv Desai', 64, 'Male', '9810000044', 'patient44@mail.com', 'Bilimora', '2024-12-18'),
(45, 'Alisha Mehta', 20, 'Female', '9810000045', 'patient45@mail.com', 'Surat', '2024-12-26'),
(46, 'Imran Khan', 21, 'Male', '9810000046', 'patient46@mail.com', 'Navsari', '2025-01-03'),
(47, 'Ira Shah', 22, 'Female', '9810000047', 'patient47@mail.com', 'Valsad', '2025-01-11'),
(48, 'Parth Patel', 23, 'Male', '9810000048', 'patient48@mail.com', 'Chikhli', '2025-01-19'),
(49, 'Amina Sheikh', 24, 'Female', '9810000049', 'patient49@mail.com', 'Bilimora', '2025-01-27'),
(50, 'Krish Desai', 25, 'Male', '9810000050', 'patient50@mail.com', 'Surat', '2025-02-04'),
(51, 'Sahil Mehta', 26, 'Female', '9810000051', 'patient51@mail.com', 'Navsari', '2025-02-12'),
(52, 'Hana Khan', 27, 'Male', NULL, 'patient52@mail.com', 'Valsad', '2025-02-20'),
(53, 'Nayan Shah', 28, 'Female', '9810000053', 'patient53@mail.com', 'Chikhli', '2025-02-28'),
(54, 'Fatima Patel', 29, 'Male', '9810000054', 'patient54@mail.com', 'Bilimora', '2025-03-08'),
(55, 'Raj Desai', 30, 'Female', '9810000055', 'patient55@mail.com', 'Surat', '2025-03-16'),
(56, 'Sia Mehta', 31, 'Male', '9810000056', 'patient56@mail.com', 'Navsari', '2025-03-24'),
(57, 'Aman Khan', 32, 'Female', '9810000057', 'patient57@mail.com', 'Valsad', '2025-04-01'),
(58, 'Noor Sheikh', 33, 'Male', '9810000058', 'patient58@mail.com', 'Chikhli', '2025-04-09'),
(59, 'Kavya Patel', 34, 'Female', '9810000059', 'patient59@mail.com', 'Bilimora', '2025-04-17'),
(60, 'Zain Shah', 35, 'Male', '9810000060', 'patient60@mail.com', 'Surat', '2025-04-25');

INSERT INTO Doctors (doctor_id, name, specialization, phone_number, email, available_days, consultation_fee) VALUES
(1, '  Dr. Mehul Shah  ', 'Cardiology', '9876500001', 'mehul@hospital.com', 'Mon,Tue,Thu', 1500),
(2, 'Dr. Riya Patel', 'Neurology', '9876500002', 'riya@hospital.com', 'Mon,Wed,Fri', 1800),
(3, ' Dr. Arjun Desai ', 'Dermatology', '9876500003', 'arjun@hospital.com', 'Tue,Thu,Sat', 1200),
(4, 'Dr. Sana Khan', 'Pediatrics', NULL, 'sana@hospital.com', 'Mon,Tue,Wed', 900),
(5, 'Dr. Kabir Mehta', 'Orthopedics', '9876500005', 'kabir@hospital.com', 'Wed,Thu,Fri', 1400),
(6, 'Dr. Aisha Sheikh', 'Gynecology', '9876500006', 'aisha@hospital.com', 'Mon,Thu,Sat', 1600),
(7, 'Dr. Omar Patel', 'General Medicine', '9876500007', 'omar@hospital.com', 'Tue,Wed,Sat', 800),
(8, 'Dr. Neha Shah', 'Dermatology', '9876500008', 'neha@hospital.com', 'Mon,Fri,Sat', 1300);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Dermatology'),
(4, 'Pediatrics'),
(5, 'Orthopedics'),
(6, 'Gynecology'),
(7, 'General Medicine');

INSERT INTO Doctor_Department (doctor_id, department_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 3);

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1, 8, 4, '2024-01-19', 'Scheduled'),
(2, 15, 7, '2024-01-28', 'Cancelled'),
(3, 22, 2, '2024-02-06', 'Completed'),
(4, 29, 5, '2024-02-15', 'Scheduled'),
(5, 36, 8, '2024-02-24', 'Cancelled'),
(6, 43, 3, '2024-03-04', 'Completed'),
(7, 50, 6, '2024-03-13', 'Scheduled'),
(8, 57, 1, '2024-03-22', 'Cancelled'),
(9, 4, 4, '2024-03-31', 'Completed'),
(10, 11, 7, '2024-04-09', 'Scheduled'),
(11, 18, 2, '2024-04-18', 'Cancelled'),
(12, 25, 5, '2024-04-27', 'Completed'),
(13, 32, 8, '2024-05-06', 'Scheduled'),
(14, 39, 3, '2024-05-15', 'Cancelled'),
(15, 46, 6, '2024-05-24', 'Completed'),
(16, 53, 1, '2024-06-02', 'Scheduled'),
(17, 60, 4, '2024-06-11', 'Cancelled'),
(18, 7, 7, '2024-06-20', 'Completed'),
(19, 14, 2, '2024-06-29', 'Scheduled'),
(20, 21, 5, '2024-07-08', 'Cancelled'),
(21, 28, 8, '2024-07-17', 'Completed'),
(22, 35, 3, '2024-07-26', 'Scheduled'),
(23, 42, 6, '2024-08-04', 'Cancelled'),
(24, 49, 1, '2024-08-13', 'Completed'),
(25, 56, 4, '2024-08-22', 'Scheduled'),
(26, 3, 7, '2024-08-31', 'Cancelled'),
(27, 10, 2, '2024-09-09', 'Completed'),
(28, 17, 5, '2024-09-18', 'Scheduled'),
(29, 24, 8, '2024-09-27', 'Cancelled'),
(30, 31, 3, '2024-10-06', 'Completed'),
(31, 38, 6, '2024-10-15', 'Scheduled'),
(32, 45, 1, '2024-10-24', 'Cancelled'),
(33, 52, 4, '2024-11-02', 'Completed'),
(34, 59, 7, '2024-11-11', 'Scheduled'),
(35, 6, 2, '2024-11-20', 'Cancelled'),
(36, 13, 5, '2024-11-29', 'Completed'),
(37, 20, 8, '2024-12-08', 'Scheduled'),
(38, 27, 3, '2024-12-17', 'Cancelled'),
(39, 34, 6, '2024-12-26', 'Completed'),
(40, 41, 1, '2025-01-04', 'Scheduled'),
(41, 48, 4, '2025-01-13', 'Cancelled'),
(42, 55, 7, '2025-01-22', 'Completed'),
(43, 2, 2, '2025-01-31', 'Scheduled'),
(44, 9, 5, '2025-02-09', 'Cancelled'),
(45, 16, 8, '2025-02-18', 'Completed'),
(46, 23, 3, '2025-02-27', 'Scheduled'),
(47, 30, 6, '2025-03-08', 'Cancelled'),
(48, 37, 1, '2025-03-17', 'Completed'),
(49, 44, 4, '2025-03-26', 'Scheduled'),
(50, 51, 7, '2025-04-04', 'Cancelled'),
(51, 58, 2, '2025-04-13', 'Completed'),
(52, 5, 5, '2025-04-22', 'Scheduled'),
(53, 12, 8, '2025-05-01', 'Cancelled'),
(54, 19, 3, '2025-05-10', 'Completed'),
(55, 26, 6, '2025-05-19', 'Scheduled'),
(56, 33, 1, '2025-05-28', 'Cancelled'),
(57, 40, 4, '2025-06-06', 'Completed'),
(58, 47, 7, '2025-06-15', 'Scheduled'),
(59, 54, 2, '2025-06-24', 'Cancelled'),
(60, 1, 5, '2025-07-03', 'Completed'),
(61, 8, 8, '2025-07-12', 'Scheduled'),
(62, 15, 3, '2025-07-21', 'Cancelled'),
(63, 22, 6, '2025-07-30', 'Completed'),
(64, 29, 1, '2025-08-08', 'Scheduled'),
(65, 36, 4, '2025-08-17', 'Cancelled'),
(66, 43, 7, '2025-08-26', 'Completed'),
(67, 50, 2, '2025-09-04', 'Scheduled'),
(68, 57, 5, '2025-09-13', 'Cancelled'),
(69, 4, 8, '2025-09-22', 'Completed'),
(70, 11, 3, '2025-10-01', 'Scheduled'),
(71, 18, 6, '2025-10-10', 'Cancelled'),
(72, 25, 1, '2025-10-19', 'Completed'),
(73, 32, 4, '2025-10-28', 'Scheduled'),
(74, 39, 7, '2025-11-06', 'Cancelled'),
(75, 46, 2, '2025-11-15', 'Completed'),
(76, 53, 5, '2025-11-24', 'Scheduled'),
(77, 60, 8, '2025-12-03', 'Cancelled'),
(78, 7, 3, '2025-12-12', 'Completed'),
(79, 14, 6, '2025-12-21', 'Scheduled'),
(80, 21, 1, '2025-12-30', 'Cancelled'),
(81, 28, 4, '2026-01-08', 'Completed'),
(82, 35, 7, '2026-01-17', 'Scheduled'),
(83, 42, 2, '2026-01-26', 'Cancelled'),
(84, 49, 5, '2026-02-04', 'Completed'),
(85, 56, 8, '2026-02-13', 'Scheduled'),
(86, 3, 3, '2026-02-22', 'Cancelled'),
(87, 10, 6, '2026-03-03', 'Completed'),
(88, 17, 1, '2026-03-12', 'Scheduled'),
(89, 24, 4, '2026-03-21', 'Cancelled'),
(90, 31, 7, '2026-03-30', 'Completed'),
(91, 38, 2, '2026-04-08', 'Scheduled'),
(92, 45, 5, '2026-04-17', 'Cancelled'),
(93, 52, 8, '2026-04-26', 'Completed'),
(94, 59, 3, '2026-05-05', 'Scheduled'),
(95, 6, 6, '2026-05-14', 'Cancelled'),
(96, 13, 1, '2026-05-23', 'Completed'),
(97, 20, 4, '2026-06-01', 'Scheduled'),
(98, 27, 7, '2026-06-10', 'Cancelled'),
(99, 34, 2, '2026-06-19', 'Completed'),
(100, 41, 5, '2026-06-28', 'Scheduled');

INSERT INTO Medical_Records (record_id, patient_id, doctor_id, diagnosis, prescription, treatment_date) VALUES
(1, 22, 2, 'Migraine', 'Prescription 2', '2024-02-06'),
(2, 43, 3, 'Skin Allergy', 'Prescription 3', '2024-03-04'),
(3, 4, 4, 'Fracture', 'Prescription 4', '2024-03-31'),
(4, 25, 5, 'Diabetes', 'Prescription 5', '2024-04-27'),
(5, 46, 6, 'Fever', 'Prescription 1', '2024-05-24'),
(6, 7, 7, 'PCOS', 'Prescription 2', '2024-06-20'),
(7, 28, 8, 'Back Pain', 'Prescription 3', '2024-07-17'),
(8, 49, 1, 'Acne', 'Prescription 4', '2024-08-13'),
(9, 10, 2, 'Asthma', 'Prescription 5', '2024-09-09'),
(10, 31, 3, 'Hypertension', 'Prescription 1', '2024-10-06'),
(11, 52, 4, 'Migraine', 'Prescription 2', '2024-11-02'),
(12, 13, 5, 'Skin Allergy', 'Prescription 3', '2024-11-29'),
(13, 34, 6, 'Fracture', 'Prescription 4', '2024-12-26'),
(14, 55, 7, 'Diabetes', 'Prescription 5', '2025-01-22'),
(15, 16, 8, 'Fever', 'Prescription 1', '2025-02-18'),
(16, 37, 1, 'PCOS', 'Prescription 2', '2025-03-17'),
(17, 58, 2, 'Back Pain', 'Prescription 3', '2025-04-13'),
(18, 19, 3, 'Acne', 'Prescription 4', '2025-05-10'),
(19, 40, 4, 'Asthma', 'Prescription 5', '2025-06-06'),
(20, 1, 5, 'Hypertension', 'Prescription 1', '2025-07-03'),
(21, 22, 6, 'Migraine', 'Prescription 2', '2025-07-30'),
(22, 43, 7, 'Skin Allergy', 'Prescription 3', '2025-08-26'),
(23, 4, 8, 'Fracture', 'Prescription 4', '2025-09-22'),
(24, 25, 1, 'Diabetes', 'Prescription 5', '2025-10-19'),
(25, 46, 2, 'Fever', 'Prescription 1', '2025-11-15'),
(26, 7, 3, 'PCOS', 'Prescription 2', '2025-12-12'),
(27, 28, 4, 'Back Pain', 'Prescription 3', '2026-01-08'),
(28, 49, 5, 'Acne', 'Prescription 4', '2026-02-04'),
(29, 10, 6, 'Asthma', 'Prescription 5', '2026-03-03'),
(30, 31, 7, 'Hypertension', 'Prescription 1', '2026-03-30'),
(31, 52, 8, 'Migraine', 'Prescription 2', '2026-04-26'),
(32, 13, 1, 'Skin Allergy', 'Prescription 3', '2026-05-23'),
(33, 34, 2, 'Fracture', 'Prescription 4', '2026-06-19');

INSERT INTO Hospital_Stays (stay_id, patient_id, admission_date, discharge_date) VALUES
(1, 6, '2025-01-26', '2025-01-29'),
(2, 11, '2025-02-20', '2025-02-24'),
(3, 16, '2025-03-17', '2025-03-22'),
(4, 21, '2025-04-11', '2025-04-17'),
(5, 26, '2025-05-06', '2025-05-13'),
(6, 31, '2025-05-31', '2025-06-02'),
(7, 36, '2025-06-25', '2025-06-28'),
(8, 41, '2025-07-20', '2025-07-24'),
(9, 46, '2025-08-14', '2025-08-19'),
(10, 51, '2025-09-08', '2025-09-14'),
(11, 56, '2025-10-03', '2025-10-10'),
(12, 1, '2025-10-28', '2025-10-30'),
(13, 6, '2025-11-22', '2025-11-25'),
(14, 11, '2025-12-17', '2025-12-21'),
(15, 16, '2026-01-11', '2026-01-16');

INSERT INTO Billing (invoice_id, patient_id, appointment_id, amount, payment_status, payment_date) VALUES
(1, 8, 1, 1000, 'Paid', '2024-01-19'),
(2, 15, 2, 1000, 'Cancelled', '2024-01-28'),
(3, 22, 3, 2100, 'Paid', '2024-02-06'),
(4, 29, 4, 1400, 'Pending', NULL),
(5, 36, 5, 1400, 'Cancelled', '2024-02-24'),
(6, 43, 6, 1400, 'Paid', '2024-03-04'),
(7, 57, 8, 1500, 'Cancelled', '2024-03-22'),
(8, 4, 9, 1000, 'Paid', '2024-03-31'),
(9, 11, 10, 1000, 'Paid', '2024-04-09'),
(10, 18, 11, 2100, 'Cancelled', '2024-04-18'),
(11, 25, 12, 1400, 'Pending', NULL),
(12, 32, 13, 1400, 'Paid', '2024-05-06'),
(13, 46, 15, 1900, 'Paid', '2024-05-24'),
(14, 53, 16, 1500, 'Pending', NULL),
(15, 60, 17, 1000, 'Cancelled', '2024-06-11'),
(16, 7, 18, 1000, 'Paid', '2024-06-20'),
(17, 14, 19, 2100, 'Paid', '2024-06-29'),
(18, 21, 20, 1400, 'Cancelled', '2024-07-08'),
(19, 35, 22, 1400, 'Paid', '2024-07-26'),
(20, 42, 23, 1900, 'Cancelled', '2024-08-04'),
(21, 49, 24, 1500, 'Pending', NULL),
(22, 56, 25, 1000, 'Paid', '2024-08-22'),
(23, 3, 26, 1000, 'Cancelled', '2024-08-31'),
(24, 10, 27, 2100, 'Paid', '2024-09-09'),
(25, 24, 29, 1400, 'Cancelled', '2024-09-27'),
(26, 31, 30, 1400, 'Paid', '2024-10-06'),
(27, 38, 31, 1900, 'Paid', '2024-10-15'),
(28, 45, 32, 1500, 'Cancelled', '2024-10-24'),
(29, 52, 33, 1000, 'Paid', '2024-11-02'),
(30, 59, 34, 1000, 'Paid', '2024-11-11'),
(31, 13, 36, 1400, 'Pending', NULL),
(32, 20, 37, 1400, 'Paid', '2024-12-08'),
(33, 27, 38, 1400, 'Cancelled', '2024-12-17'),
(34, 34, 39, 1900, 'Paid', '2024-12-26'),
(35, 41, 40, 1500, 'Pending', NULL),
(36, 48, 41, 1000, 'Cancelled', '2025-01-13'),
(37, 2, 43, 2100, 'Paid', '2025-01-31'),
(38, 9, 44, 1400, 'Cancelled', '2025-02-09'),
(39, 16, 45, 1400, 'Paid', '2025-02-18'),
(40, 23, 46, 1400, 'Paid', '2025-02-27'),
(41, 30, 47, 1900, 'Cancelled', '2025-03-08'),
(42, 37, 48, 1500, 'Pending', NULL),
(43, 51, 50, 1000, 'Cancelled', '2025-04-04'),
(44, 58, 51, 2100, 'Paid', '2025-04-13'),
(45, 5, 52, 1400, 'Pending', NULL),
(46, 12, 53, 1400, 'Cancelled', '2025-05-01'),
(47, 19, 54, 1400, 'Paid', '2025-05-10'),
(48, 26, 55, 1900, 'Paid', '2025-05-19'),
(49, 40, 57, 1000, 'Paid', '2025-06-06'),
(50, 47, 58, 1000, 'Paid', '2025-06-15'),
(51, 54, 59, 2100, 'Cancelled', '2025-06-24'),
(52, 1, 60, 1400, 'Pending', NULL),
(53, 8, 61, 1400, 'Paid', '2025-07-12'),
(54, 15, 62, 1400, 'Cancelled', '2025-07-21'),
(55, 29, 64, 1500, 'Pending', NULL),
(56, 36, 65, 1000, 'Cancelled', '2025-08-17'),
(57, 43, 66, 1000, 'Paid', '2025-08-26'),
(58, 50, 67, 2100, 'Paid', '2025-09-04'),
(59, 57, 68, 1400, 'Cancelled', '2025-09-13'),
(60, 4, 69, 1400, 'Paid', '2025-09-22'),
(61, 18, 71, 1900, 'Cancelled', '2025-10-10'),
(62, 25, 72, 1500, 'Pending', NULL),
(63, 32, 73, 1000, 'Paid', '2025-10-28'),
(64, 39, 74, 1000, 'Cancelled', '2025-11-06'),
(65, 46, 75, 2100, 'Paid', '2025-11-15'),
(66, 53, 76, 1400, 'Pending', NULL),
(67, 7, 78, 1400, 'Paid', '2025-12-12'),
(68, 14, 79, 1900, 'Paid', '2025-12-21'),
(69, 21, 80, 1500, 'Cancelled', '2025-12-30'),
(70, 28, 81, 1000, 'Paid', '2026-01-08'),
(71, 35, 82, 1000, 'Paid', '2026-01-17'),
(72, 42, 83, 2100, 'Cancelled', '2026-01-26'),
(73, 56, 85, 1400, 'Paid', '2026-02-13'),
(74, 3, 86, 1400, 'Cancelled', '2026-02-22'),
(75, 10, 87, 1900, 'Paid', '2026-03-03'),
(76, 17, 88, 1500, 'Pending', NULL),
(77, 24, 89, 1000, 'Cancelled', '2026-03-21'),
(78, 31, 90, 1000, 'Paid', '2026-03-30'),
(79, 45, 92, 1400, 'Cancelled', '2026-04-17'),
(80, 52, 93, 1400, 'Paid', '2026-04-26'),
(81, 59, 94, 1400, 'Paid', '2026-05-05'),
(82, 6, 95, 1900, 'Cancelled', '2026-05-14'),
(83, 13, 96, 1500, 'Pending', NULL),
(84, 20, 97, 1000, 'Paid', '2026-06-01'),
(85, 34, 99, 2100, 'Paid', '2026-06-19'),
(86, 41, 100, 1400, 'Pending', NULL);


-- 1. CRUD OPERATIONS
INSERT INTO Patients VALUES (61,'New Patient',30,'Female','9999999999','newpatient@mail.com','Surat','2026-10-04');
INSERT INTO Doctors VALUES (9,'Dr. New Doctor','Cardiology','9999999998','newdoctor@hospital.com','Mon,Wed',1100);
INSERT INTO Appointments VALUES (101,61,9,'2026-10-10','Scheduled');
UPDATE Patients SET address='Navsari' WHERE patient_id=61;
DELETE FROM Appointments WHERE status='Cancelled' AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 2. WHERE, HAVING, LIMIT
SELECT * FROM Patients WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
SELECT p.patient_id,p.name,SUM(b.amount) AS total_spent
FROM Patients p JOIN Billing b ON p.patient_id=b.patient_id
GROUP BY p.patient_id,p.name ORDER BY total_spent DESC LIMIT 5;
SELECT * FROM Doctors WHERE consultation_fee > 1000;

-- 3. AND, OR, NOT
SELECT * FROM Appointments WHERE status='Scheduled' AND doctor_id=3;
SELECT * FROM Doctors WHERE specialization IN ('Cardiology','Neurology');
SELECT * FROM Patients p
WHERE NOT EXISTS (
    SELECT 1 FROM Appointments a
    WHERE a.patient_id=p.patient_id
      AND a.appointment_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- 4. ORDER BY, GROUP BY
SELECT * FROM Doctors ORDER BY specialization;
SELECT d.doctor_id,d.name,COUNT(a.patient_id) AS patient_count
FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name ORDER BY patient_count DESC;
SELECT dep.department_name,SUM(b.amount) AS total_revenue
FROM Departments dep
JOIN Doctor_Department dd ON dep.department_id=dd.department_id
JOIN Doctors d ON dd.doctor_id=d.doctor_id
JOIN Appointments a ON d.doctor_id=a.doctor_id
JOIN Billing b ON a.appointment_id=b.appointment_id
WHERE b.payment_status='Paid'
GROUP BY dep.department_id,dep.department_name ORDER BY total_revenue DESC;

-- 5. SUM, AVG, MAX, MIN, COUNT
SELECT SUM(amount) AS total_revenue FROM Billing WHERE payment_status='Paid';
SELECT d.doctor_id,d.name,COUNT(a.appointment_id) AS visit_count
FROM Doctors d JOIN Appointments a ON d.doctor_id=a.doctor_id
WHERE a.status='Completed'
GROUP BY d.doctor_id,d.name ORDER BY visit_count DESC LIMIT 1;
SELECT AVG(consultation_fee) AS average_consultation_fee FROM Doctors;

-- 6. PRIMARY & FOREIGN KEY RELATIONSHIPS
-- Relationships are implemented in CREATE TABLE statements above.

-- 7. JOINS
SELECT d.name AS doctor_name,dep.department_name
FROM Doctors d JOIN Doctor_Department dd ON d.doctor_id=dd.doctor_id
JOIN Departments dep ON dd.department_id=dep.department_id;

SELECT p.patient_id,p.name,a.appointment_id,a.appointment_date
FROM Patients p LEFT JOIN Appointments a ON p.patient_id=a.patient_id
WHERE a.status='Completed';

SELECT a.appointment_id,a.patient_id,b.invoice_id,b.payment_status
FROM Billing b RIGHT JOIN Appointments a ON b.appointment_id=a.appointment_id
WHERE b.invoice_id IS NULL;

-- MySQL has no FULL OUTER JOIN; use UNION:
SELECT p.patient_id,p.name,a.appointment_id
FROM Patients p LEFT JOIN Appointments a ON p.patient_id=a.patient_id
WHERE a.appointment_id IS NULL
UNION
SELECT p.patient_id,p.name,a.appointment_id
FROM Appointments a LEFT JOIN Patients p ON p.patient_id=a.patient_id
WHERE p.patient_id IS NULL;

-- 8. SUBQUERIES
SELECT d.doctor_id,d.name,COUNT(a.patient_id) AS patients_handled
FROM Doctors d JOIN Appointments a ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name
HAVING COUNT(a.patient_id) > 50;

SELECT p.patient_id,p.name,SUM(b.amount) AS total_spent
FROM Patients p JOIN Billing b ON p.patient_id=b.patient_id
GROUP BY p.patient_id,p.name
HAVING SUM(b.amount)=(SELECT MAX(total_spent) FROM
    (SELECT SUM(amount) AS total_spent FROM Billing GROUP BY patient_id) x);

SELECT a.*
FROM Appointments a
WHERE a.doctor_id IN (SELECT doctor_id FROM Doctors WHERE specialization='Dermatology');

-- 9. DATE & TIME FUNCTIONS
SELECT MONTH(appointment_date) AS appointment_month,COUNT(*) AS visit_count
FROM Appointments GROUP BY MONTH(appointment_date) ORDER BY appointment_month;
SELECT patient_id,DATEDIFF(discharge_date,admission_date) AS stay_days
FROM Hospital_Stays;
SELECT record_id,DATE_FORMAT(treatment_date,'%d-%m-%Y') AS formatted_treatment_date
FROM Medical_Records;

-- 10. STRING FUNCTIONS
SELECT UPPER(name) AS patient_name_upper FROM Patients;
SELECT TRIM(name) AS doctor_name_trimmed FROM Doctors;
SELECT doctor_id,COALESCE(phone_number,'Not Available') AS phone_number FROM Doctors;

-- 11. WINDOW FUNCTIONS
SELECT d.doctor_id,d.name,
       COUNT(a.patient_id) AS patient_count,
       RANK() OVER (ORDER BY COUNT(a.patient_id) DESC) AS doctor_rank
FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name;

SELECT DATE_FORMAT(payment_date,'%Y-%m') AS month,
       SUM(amount) AS monthly_revenue,
       SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date,'%Y-%m')) AS cumulative_revenue
FROM Billing
WHERE payment_status='Paid'
GROUP BY DATE_FORMAT(payment_date,'%Y-%m')
ORDER BY month;

SELECT appointment_id,patient_id,appointment_date,
       COUNT(*) OVER (ORDER BY appointment_date,appointment_id) AS running_total_appointments
FROM Appointments ORDER BY appointment_date,appointment_id;

-- 12. CASE EXPRESSION
SELECT p.patient_id,p.name,COUNT(m.record_id) AS medical_records,
CASE
    WHEN COUNT(m.record_id)>5 THEN 'High'
    WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium'
    ELSE 'Low'
END AS Patient_Risk_Level
FROM Patients p LEFT JOIN Medical_Records m ON p.patient_id=m.patient_id
GROUP BY p.patient_id,p.name;

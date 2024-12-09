CREATE DATABASE hospitalmanagements;
USE Hospitalmanagements

CREATE TABLE patients(
patient_id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (patient_id) ,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender ENUM('Male','Female','Other'),
date_of_birth  DATE,
phone_number  VARCHAR(15),
email  VARCHAR(100),
address VARCHAR(255));

CREATE TABLE departments(
department_id INT(11) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (department_id),
department_name VARCHAR(50),
location VARCHAR(100));

CREATE TABLE doctors(
doctor_id INT(11) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (doctor_id),
department_id INT(11),
FOREIGN KEY (department_id) REFERENCES departments (department_id),
first_name VARCHAR(50),
last_name VARCHAR(50),
specialization varchar(50),
phone_number varchar(15),
email  VARCHAR(100));

CREATE TABLE staff(
staff_id INT(11) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (staff_id),
department_id INT(11),
FOREIGN KEY (department_id) REFERENCES departments (department_id),
first_name VARCHAR(50),
last_name VARCHAR(50),
job_title varchar(50),
phone_number varchar(15),
email  VARCHAR(100));

CREATE TABLE medications(
medication_id INT(11) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (medication_id),
medication_name VARCHAR(100),
dosage VARCHAR(50));

CREATE TABLE prescriptions(
prescription_id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (prescription_id),
patient_id INT(11),
FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
doctor_id INT(11),
FOREIGN KEY (doctor_id) REFERENCEs doctors (doctor_id),
medication_id INT(11),
FOREIGN KEY (medication_id) REFERENCEs medications (medication_id),
prescription_date  DATE,
dosage_instrufctions VARCHAR(255));

CREATE TABLE appointments(
appointment_id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (appointment_id),
appointment_date  DATE,
appointment_time  time,
patient_id INT(11),
FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
doctor_id INT(11),
FOREIGN KEY (doctor_id) REFERENCEs doctors (doctor_id),
reason VARCHAR(255));

CREATE TABLE rooms(
room_id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (room_id) ,
room_number VARCHAR(10),
room_type enum('General','Private','ICU'),
availability TINYINT(1));

CREATE TABLE admissions(
admission_id INT(11) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (admission_id),
admission_date  DATE,
discharge_date  date,
patient_id INT(11),
FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
room_id INT(11),
FOREIGN KEY (room_id) REFERENCEs rooms (room_id));

INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number, email, address)
VALUES
('khlid', 'hada', 'Male', '1990-01-01', '1234567890', 'khlid.doe@example.com', '123 Elm Street'),
('monir', 'lkadi', 'Female', '1985-05-15', '9876543210', 'monir.smith@example.com', '456 Oak Avenue'),
('hamou', 'jbran', 'Male', '1992-07-20', '1122334455', 'hamou.brown@example.com', '789 Pine Lane'),
('soufian', 'oulhage', 'Female', '2000-11-30', '5566778899', 'soufian.davis@example.com', '101 Maple Drive'),
('mohammed', 'riahi', 'Other', '1998-09-12', '6677889900', 'mohammed.wilson@example.com', '202 Birch Road');

INSERT INTO departments (department_name, location)
VALUES
('Cardiology', 'Building A'),
('Orthopedics', 'Building B'),
('Neurology', 'Building C'),
('Pediatrics', 'Building D'),
('General Medicine', 'Building E');

INSERT INTO doctors (department_id, first_name, last_name, specialization, phone_number, email)
VALUES
(1, 'Alan', 'Grant', 'Cardiologist', '3216549870', 'alan.grant@example.com'),
(2, 'Sarah', 'Connor', 'Orthopedic Surgeon', '1234567891', 'sarah.connor@example.com'),
(3, 'Henry', 'Jones', 'Neurologist', '9876543211', 'henry.jones@example.com'),
(4, 'Laura', 'Croft', 'Pediatrician', '4561237890', 'laura.croft@example.com'),
(5, 'Bruce', 'Wayne', 'General Physician', '7890123456', 'bruce.wayne@example.com');

INSERT INTO staff (department_id, first_name, last_name, job_title, phone_number, email)
VALUES
(1, 'Anna', 'Bell', 'Nurse', '1231231234', 'anna.bell@example.com'),
(2, 'Mark', 'Smith', 'Technician', '2342342345', 'mark.smith@example.com'),
(3, 'Sophia', 'Lee', 'Receptionist', '3453453456', 'sophia.lee@example.com'),
(4, 'Jacob', 'Taylor', 'Lab Assistant', '4564564567', 'jacob.taylor@example.com'),
(5, 'Olivia', 'Moore', 'Pharmacist', '5675675678', 'olivia.moore@example.com');

INSERT INTO medications (medication_name, dosage)
VALUES
('Aspirin', '500mg'),
('Ibuprofen', '200mg'),
('Amoxicillin', '250mg'),
('Metformin', '850mg'),
('Losartan', '50mg');

INSERT INTO prescriptions (patient_id, doctor_id, medication_id, prescription_date, dosage_instructions)
VALUES
(1, 1, 1, '2024-12-01', 'Take one tablet daily after meals'),
(2, 2, 2, '2024-12-02', 'Take two tablets daily before meals'),
(3, 3, 3, '2024-12-03', 'Take one capsule three times a day'),
(4, 4, 4, '2024-12-04', 'Take one tablet in the morning'),
(5, 5, 5, '2024-12-05', 'Take one tablet at night');

INSERT INTO appointments (appointment_date, appointment_time, patient_id, doctor_id, reason)
VALUES
('2024-12-10', '10:00:00', 1, 1, 'Routine checkup'),
('2024-12-11', '11:00:00', 2, 2, 'Back pain consultation'),
('2024-12-12', '12:00:00', 3, 3, 'Headache assessment'),
('2024-12-13', '13:00:00', 4, 4, 'Child vaccination'),
('2024-12-14', '14:00:00', 5, 5, 'General health check');

INSERT INTO rooms (room_number, room_type, availability)
VALUES
('101', 'General', 1),
('102', 'Private', 1),
('103', 'ICU', 1),
('104', 'General', 0),
('105', 'Private', 1);

INSERT INTO admissions (admission_date, discharge_date, patient_id, room_id)
VALUES
('2024-12-01', '2024-12-05', 1, 1),
('2024-12-06', '2024-12-10', 2, 2),
('2024-12-11', '2024-12-15', 3, 3),
('2024-12-16', '2024-12-20', 4, 4),
('2024-12-21', '2024-12-25', 5, 5);

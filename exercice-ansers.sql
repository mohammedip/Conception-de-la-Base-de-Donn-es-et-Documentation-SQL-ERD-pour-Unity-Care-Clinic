USE Hospitalmanagements

1-

INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number, email, address)
VALUES
('reida', 'boumanjaal', 'Male', '1995-01-01', '2587413694', 'reida.doe@example.com', '457 wafiq')

2-

SELECT * from departments

3-

SELECT *  from patients ORDER BY date_of_birth ASC;

4-

select DISTINCT gender from patients

5-

SELECT * from doctors LIMIT 3

6-

SELECT * from patients WHERE date_of_birth>'2000-12-31'

7-

SELECT * from doctors WHERE department_id IN (SELECT department_id from departments WHERE department_name = 'Cardiology' OR department_name = 'Neurology')

8-

SELECT * from admissions WHERE admission_date BETWEEN '2024-12-01' and '2024-12-07'

9-

SELECT TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) as age ,
CASE
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) < 14 THEN 'Enfant'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) < 21 THEN 'Adulte'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) > 21 THEN 'Senior'
    
END AS age_categorie
FROM patients;

10-

SELECT COUNT(*) AS appointments_number from appointments 

11-

SELECT COUNT(*) as doctor_number,(SELECT department_name from departments WHERE departments.department_id = doctors.department_id ) as categorie_name  from doctors GROUP BY department_id 

12-

SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, NOW())) as avrege_age FROM patients

13-

SELECT MAX(appointment_date)as later_date , MAX(appointment_time)as later_heure FROM appointments

14-

SELECT SUM(*) as admissions_number,(SELECT room_id from rooms WHERE admissions.room_id = rooms.room_id ) as room  from admissions GROUP BY room_id 

15-

SELECT * from patients where email IS NULL

17-

DELETE FROM appointments WHERE appointment_date<'2024-01-01'

18-

UPDATE departments SET department_name='Cancer Treatment'  WHERE department_name='Orthopedics'

19-

SELECT gender,COUNT(gender)as how_match_gerders  from patients GROUP BY gender HAVING COUNT(gender)>=2 

20-

CREATE VIEW admissions_en_cours AS SELECT * from admissions WHERE admission_date>'2024-12-10'
SELECT * from admissions_en_cours 

Bonus : 
16-

SELECT patients.first_name as First_name, patients.last_name AS Last_name, appointments.appointment_date as appointment_date, appointments.appointment_time as appointment_time ,appointments.reason ,doctors.first_name as doctors_first_name,doctors.last_name as doctors_last_name FROM appointments JOIN patients on patients.patient_id=appointments.patient_id JOIN doctors on doctors.doctor_id=appointments.doctor_id

1-

SELECT patients.first_name , doctors.first_name from appointments  JOIN patients on appointments.patient_id=patients.patient_id  JOIN doctors on appointments.doctor_id=doctors.doctor_id

2-

select appointment_id,appointment_date,appointment_time,reason , departments.department_name from doctors JOIN appointments on appointments.doctor_id=doctors.doctor_id JOIN departments on departments.department_id=doctors.department_id

3-

select  doctors.first_name,doctors.last_name,medications.medication_id,medications.medication_name,medications.dosage,prescriptions.dosage_instrufctions from prescriptions JOIN medications on medications.medication_id=prescriptions.medication_id JOIN doctors on doctors.doctor_id=prescriptions.doctor_id

4-

SELECT rooms.room_number as Room,patients.first_name as first_name,patients.last_name as last_name ,admissions.admission_date as Admission , admissions.discharge_date as Discharge FROM admissions JOIN rooms on admissions.room_id=rooms.room_id JOIN patients on patients.patient_id=admissions.patient_id

5-

SELECT 
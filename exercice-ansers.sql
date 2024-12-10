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

SELECT SUM(admissions.ROWS) as admissions_number,(SELECT room_id from rooms WHERE admissions.room_id = rooms.room_id ) as room  from admissions GROUP BY room_id


SELECT (SELECT room_id from rooms WHERE admissions.room_id = rooms.room_id ) as room, COUNT(*) as admissions_number from admissions GROUP BY 

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
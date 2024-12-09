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



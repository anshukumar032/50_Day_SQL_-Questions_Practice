--------------------------------------Day 2--------------------------------------------------------

Q1. Show unique birth years from patients and order them by ascending.

SELECT DISTINCT
    (YEAR(birth_date))
FROM
    patients
ORDER BY birth_date ASC

Q2. Show unique first names from the patients table which only occurs once in the list.

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name = 'John') = 1;


Q3. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

SELECT 
    patient_id, first_name
FROM
    patients
WHERE
    first_name LIKE 's____%s'
ORDER BY first_name

Q4. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

SELECT 
    p.patient_id, p.first_name, p.last_name
FROM
    patients p
        JOIN
    admissions a ON p.patient_id = a.patient_id
WHERE
    diagnosis = 'Dementia'
    
    
Q5. Display every patient's first_name. Order the list by the length of each name and then by alphabetically'.

SELECT 
    first_name
FROM
    patients
ORDER BY LEN(first_name) , first_name ASC


Q6. Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.	


select SUM(gender = 'M') as male_count, 
	   sum(gender = 'F') as female_count
from patients;

Q7. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. 
Show results ordered ascending by allergies then by first_name then by last_name.


SELECT 
    first_name, last_name, allergies
FROM
    patients
WHERE
    allergies = 'Penicillin'
        OR allergies = 'Morphine'
ORDER BY allergies ASC , first_name ASC , last_name ASC;



Q8. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

SELECT 
    patient_id, diagnosis
FROM
    admissions
GROUP BY patient_id , diagnosis
HAVING COUNT(diagnosis = discharge_date) > 1







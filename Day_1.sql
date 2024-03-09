/*--Day1-- /*

Q1.  Show first name, last name, and gender of patients whose gender is 'M'

SELECT first_name,last_name,gender FROM patients where gender = "M";


Q2. Show first name and last name of patients who does not have allergies. (null)

select first_name, last_name from patients where allergies is null;

Q3. Show first name of patients that start with the letter 'C'

select first_name from patients where first_name like 'C%'

Q4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

select first_name, last_name from patients where weight between 100 and 120

Q5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

update patients set allergies = 'NKA'  where allergies is NULL;

Q6. Show first name and last name concatinated into one column to show their full name.

select  concat(first_name," ",last_name) as full_name from patients

Q7. Show first name, last name, and the full province name of each patient. Example: 'Ontario' instead of 'ON'

SELECT first_name, last_name, province_name
FROM patients
         JOIN province_names ON patients.province_id = province_names.province_id;

Q8. Show how many patients have a birth_date with 2010 as the birth year.

select count(patient_id) from patients where birth_date like '2010%'


Q9. Show the first_name, last_name, and height of the patient with the greatest height.

select first_name, last_name, height from patients  order by height desc LIMIT 1

SELECT first_name, last_name, MAX(height) AS height
FROM patients
GROUP BY first_name, last_name
ORDER BY height DESC
LIMIT 1;


Q10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000

select * from patients where patient_id in (1,45,534,879,1000)

Q11. Show the total number of admissions

select count(patient_id) from admissions


Q12. Show all the columns from admissions where the patient was admitted and discharged on the same day.


Q13. Show all the columns from admissions where the patient was admitted and discharged on the same day.

select * from admissions where admission_date = discharge_date


Q14. Show the patient id and the total number of admissions for patient_id 579.

select patient_id ,count(patient_id) from admissions where patient_id = 579 group by patient_id;

Q15. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?

select distinct(city) from patients where province_id = "NS"

Q16. Write a query to find the first_name, last name and birth date of patients who has height greater 
than 160 and weight greater than 70

select first_name, last_name, birth_date from patients where height > 160 and weight >70

Q17.  Write a query to find list of patients first_name, last_name, and allergies where allergies are not null 
and are from the city of 'Hamilton'

select first_name, last_name , allergies from patients where 
 city = 'Hamilton' and allergies is not null 



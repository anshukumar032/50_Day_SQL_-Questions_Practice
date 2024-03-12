--------------------------------------------- Day 3 ------------------------------------------------------------------- 

Q1. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.

SELECT 
    city, COUNT(patient_id) AS_COUNTOFPATIENT
FROM
    patients
GROUP BY city
ORDER BY AS_COUNTOFPATIENT DESC , city ASC



Q2. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"

SELECT 
    first_name, last_name, 'Patient' AS role
FROM
    patients 
UNION ALL SELECT 
    first_name, last_name, 'Doctor' AS role
FROM
    doctors
    
    
Q3. Show all allergies ordered by popularity. Remove NULL values from query.


SELECT 
    allergies, COUNT(allergies) AS count_allergies
FROM
    patients
WHERE
    allergies IS NOT NULL
GROUP BY allergies
ORDER BY count_allergies DESC


Q4. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade.' 
Sort the list starting from the earliest birth_date.

SELECT 
    first_name, last_name, birth_date
FROM
    patients
WHERE
    YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC


Q5. We want to display each patient's full name in a single column. Their last_name in all upper'
letters must appear first, then first_name in all lower case letters. Separate the last_name and 
first_name with a comma. Order the list by the first_name in decending order EX: SMITH,jane

SELECT 
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS new_name_foramt
FROM
    patients
ORDER BY first_name DESC



Q6. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.'

SELECT 
    province_id, SUM(height) AS sumofheight
FROM
    patients
GROUP BY province_id
HAVING sumofheight > 7000;




Q7. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

SELECT 
    (MAX(weight) - MIN(weight)) diffweight
FROM
    patients
WHERE
    last_name = 'Maroni'
    
    
Q8. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. 
Sort by the day with most admissions to least admissions.

	
SELECT 
    DAY(admission_date) AS Day_number,
    COUNT(patient_id) AS counts
FROM
    admissions
GROUP BY Day_number
ORDER BY counts DESC



Q9. Show all columns for patient_id 542's most recent admission_date.'

SELECT 
    *
FROM
    admissions
WHERE
    patient_id = 542
ORDER BY admission_date DESC
LIMIT 1;



Q10. Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria 1. patient_id 
is an odd number and attending_doctor_id is either 1, 5, or 19. attending_doctor_id contains a 2 and the length 
of patient_id is 3 characters.

SELECT 
    patient_id, attending_doctor_id, diagnosis
FROM
    admissions
WHERE
    patient_id % 2 = 1
        AND attending_doctor_id IN (1 , 5, 19)
        OR (attending_doctor_id LIKE '%2%'
        AND LENGTH(patient_id) = 3);
        
        
        
Q11. Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been 
attended by a doctor.

select d.first_name, d.last_name , a. count(patient_id) as counts
from doctors d 
admissions a on d.patient_id = a.patient_id 



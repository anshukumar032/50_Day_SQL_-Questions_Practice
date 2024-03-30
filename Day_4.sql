---------------------------------------------------------Day 4 ---------------------------------------------------------------------

Q1. display the first name, last name and number of duplicate patients based on their first name and last name.
Ex: A patient with an identical name can be considered a duplicate.
=========================================================================================================
SELECT 
    first_name, last_name, COUNT(*) AS Count_of_number
FROM
    patients
GROUP BY first_name , last_name
HAVING COUNT(*) > 1

==========================================================================================================

Q2. Display patient's full name,'  height in the units feet rounded to 1 decimal, weight in the unit pounds 
rounded to 0 decimals, birth_date, gender non abbreviated. Convert CM to feet by dividing by 30.48.
Convert KG to pounds by multiplying by 2.205.

select 
    concat(first_name, " " , last_name) as full_name, 
    round(height / 30.48, 1) as height,
    round(weight * 2.205,0) as weight, 
    birth_date, 
    case 
        when gender = 'M' then 'MALE'
        when gender = 'F' then 'FEMALE'
    
    end as gender
from 
    patients;

==========================================================================================================

Q3. Show patient_id, first_name, last_name from patients whose does not have any records in 
the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)

select p.patient_id, p.first_name, p.last_name 
from patients p
left join admissions a 
on p.patient_id = a.patient_id
WHERE a.patient_id IS NULL;


===========================================================================================================

Q4. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1.
Obese is defined as weight(kg)/(height(m)2) >= 30. weight is in units kg. height is in units cm.

select 
	patient_id,
	weight, 
	height,
	case 
    	when (weight / power(height / 100.0, 2)) >= 30 then 1 
	else 0 
    end as isobese
from patients;


==============================================================================================================

Q5. Show patient_id, first_name, last_name, and attending doctor's specialty.` Show only the 
patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'Check 
patients, admissions, and doctors tables for required information.


select p.patient_id, p.first_name, p.last_name, d.specialty
from patients p 
		join admissions a on p.patient_id = a.patient_id
        join doctors d on a.attending_doctor_id = d.doctor_id
where a.diagnosis = 'Epilepsy'
	and d.first_name = 'Lisa';
        
        
        
================================================================================================================

Q6. All patients who have gone through admissions, can see their medical documents on our site. Those patients are 
given a temporary password after their first admission. Show the patient_id and temp_password.
The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date
        
select distinct p.patient_id, concat(a.patient_id, LENGTH(p.last_name), year(p.birth_date)) 
as temp_password
from patients p 
join admissions a 
on p.patient_id = a.patient_id;


================================================================================================================

Q7. Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients 
with an even patient_id have insurance. Give each patient a 'Yes' if they have insurance, 
and a 'No' if they don't have insurance. Add up the' admission_total cost for each has_insurance group.

select case when a.patient_id % 2 = 0 then 'Yes' else 'no' End as has_insurance,
	sum( case when a.patient_id % 2 = 0 then 10 else 50 end) as cost_after_insurance
from admissions a 
group by has_insurance;


=====================================================================================================================

Q8. Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

SELECT pr.province_name
FROM province_names pr
         JOIN patients p ON pr.province_id = p.province_id
GROUP BY province_name
HAVING SUM(CASE WHEN p.gender = 'M' THEN 1 ELSE 0 END) >
SUM(CASE WHEN p.gender = 'F' THEN 1 ELSE 0 END);


==============================================================================================================

Q9. We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, 
doctor_full_name, specialty, year, total_admissions for that year.

SELECT d.doctor_id, CONCAT(d.first_name,' ',d.last_name) AS doctor_full_name,
		 d.specialty,
       YEAR(a.admission_date) AS selected_year,
       COUNT(*) AS total_admissions
FROM admissions a
LEFT JOIN doctors d ON a.attending_doctor_id = d.doctor_id
GROUP BY doctor_id, selected_year


Q 10. 
We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston'


SELECT *
FROM patients
WHERE first_name LIKE '__r%' --first_name LIKE '^[a-zA-Z]{2}r'
  AND gender = 'F'
  AND month(birth_date) IN (2, 5, 12)
  AND weight BETWEEN 60 AND 80
  AND patient_id % 2 = 1
  AND city = 'Kingston';		










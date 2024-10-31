USE company;

SELECT * FROM employee;

SELECT
	employee_id,
    first_name,
    last_name,
    position
FROM
	employee;
    
SELECT
	employee_id,
    first_name,
    last_name,
    position
FROM
	employee
LIMIT 7;

SELECT DISTINCT 
	position
FROM
	employee;
    
SELECT DISTINCT 
	position
FROM
	employee
ORDER BY
	position ASC;
    
SELECT 
	employee_id,
    last_name,
    first_name,
    position,
    employment_date
FROM 
	employee
WHERE 
	position = 'Seller'
ORDER BY 
	employment_date ASC;
    
SELECT 
	employee_id,
    last_name,
    first_name,
    position,
    employment_date
FROM 
	employee
WHERE 
(
	position = 'Seller'
OR
	position = 'Consultant'
)
ORDER BY 
	employment_date DESC;
    
SELECT 
    last_name,
    first_name,
    position,
    employment_date
FROM
	employee
WHERE
(
	position LIKE 'Seller'
OR
	position IN ('Senior Consultant','Consultant')
)
AND
	employment_date > '2013-01-01'
ORDER BY
	employment_date DESC;

SELECT 
	employee_id,
    last_name,
    first_name,
    position,
    manager_id,
    department_id
FROM
	employee
WHERE
	manager_id IS NULL
OR
	department_id IS NOT NULL
ORDER BY 
	manager_id ASC;
    
SELECT
	last_name,
    first_name,
    position,
    employment_date,
    bonus
FROM
	employee
WHERE
	bonus IS NOT NULL
AND
	employment_date 
    BETWEEN '2015-12-31'
    AND '2016-12-31'
ORDER BY 
	last_name ASC;
    
SELECT 
	last_name,
    first_name,
    position,
CASE
	WHEN position = 'Senior Consultant' THEN 'Can Sales, Consulting and Lead'
	WHEN position IN ('Senior Consultant', 'Consultant') THEN 'Can Sales and Consulting'
	WHEN position LIKE 'Assistant Consultant' THEN 'Can only Consulting'
	WHEN position LIKE 'Seller' THEN 'Can only Sale'
	ELSE 'Service Roles'
    END AS 'Relation to Customer'
FROM 
	employee
ORDER BY last_name;

SELECT 
	last_name "Last Name",
    first_name 'First Name',
    position Title,
    employment_date AS 'Hire Date'
FROM
	employee;
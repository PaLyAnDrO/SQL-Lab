USE company;

SELECT 
	employee_id "Manager ID",
    last_name "Manager Last Name",
    first_name "Manager First Name",
    position "Manager Title",
    employment_date "Manager Hire Date"
FROM
	employee AS Managers
WHERE
	position IN ('CEO', 'Manager');
    
SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    e.employment_date "Employee Hire Date",
    e.manager_id "Employee Manager ID",
    m.employee_id "Manager ID",
    m.last_name "Manager Last Name",
    m.first_name "Manager First Name",
    m.position "Manager Title",
    m.employment_date "Manager Hire Date"
FROM
	employee AS e,
    employee AS m
WHERE
	e.manager_id = m.employee_id;
    
SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    e.department_id "Employee Department ID",
    d.department_id "Department ID",
    d.department_name "Department name"
FROM 
	employee AS e,
    department AS d
WHERE
	e.department_id = d.department_id;
    
SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.transaction_moment "Transaction moment"
FROM
	employee AS e
JOIN
	invoice AS i
ON 
	e.employee_id = i.employee_id
ORDER BY
	i.transaction_moment;
    
SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.transaction_moment "Transaction moment"
FROM 
	employee AS e
NATURAL JOIN 
	invoice AS i
ORDER BY 
	i.transaction_moment;
    
SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.customer_id "Invoice Customer ID",
    i.transaction_moment "Transaction moment",
    c.customer_id "Customer ID",
    c.last_name "Customer Last Name",
    c.first_name "Customer First Name"
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
JOIN 
	customer AS c
USING (customer_id)
ORDER BY 
	transaction_moment;

SELECT
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.customer_id "Invoice Customer ID",
    i.transaction_moment "Transaction moment",
    c.customer_id "Customer ID",
    c.last_name "Customer Last Name",
    c.first_name "Customer First Name"
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
LEFT JOIN 
	customer AS c
USING (customer_id)
WHERE customer_id IS NULL
ORDER BY i.transaction_moment;

SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    e.manager_id "Employee Manager ID",
    e.department_id "Employee department ID",
	m.employee_id "Manager ID",
    m.last_name "Manager Last Name",
    m.first_name "Manager First Name",
    m.position "Manager Title",
    m.department_id "Manager Department ID",
    d.department_id "Department ID",
    d.department_name "Department Name",
    d.city "Department City"
FROM 
	department AS d
RIGHT JOIN 
	employee AS e
ON e.department_id = d.department_id
LEFT JOIN
	employee AS m
ON e.manager_id = m.employee_id;

SELECT
	employee_id,
    first_name,
    last_name,
    position,
    'Consulting' AS Responsibility
FROM 
	employee
WHERE
	position LIKE '%Consultant%'
UNION
SELECT
	employee_id,
    first_name,
    last_name,
    position,
    'Not Consulting' AS Responsibility
FROM
	employee
WHERE
	position NOT LIKE '%Consultant%'
ORDER BY last_name;
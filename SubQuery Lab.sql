SELECT 
	first_name,
    last_name,
    rate
FROM
	employee
WHERE
	rate > (
    SELECT
    AVG(rate) AS "Avarage Rate"
    FROM 
		employee);
        
SELECT
	first_name,
    last_name,
    position,
    department_id
FROM
	employee AS e
WHERE
	e.department_id IN (
    SELECT
    department_id
    FROM
    department AS d
    WHERE
    city NOT IN ('Lviv')
    )
AND
	position LIKE "Manager%"
ORDER BY first_name;

SELECT 
	employee_id,
    first_name,
    last_name,
    position
FROM
	employee
WHERE
	employee_id IN (
    SELECT DISTINCT
		employee_id
	FROM 
		invoice);
        
SELECT
	first_name,
    last_name,
    position,
    d.department_id,
    d.department_name,
    d.city
FROM
	(SELECT
		first_name,
        last_name,
        position,
        department_id
	FROM
		employee
	WHERE
		position LIKE "Manager%"
	) AS m
JOIN
	department AS d ON d.department_id = m.department_id
WHERE
	city = "Lviv";

SELECT
	department_name,
    department_id,
    city,
    (
    SELECT COUNT(*)
    FROM
		employee
	WHERE 
		department_id = department.department_id
	) AS "Count of Employee"
FROM
	department;
    
SELECT
	department_name,
    department_id,
    city,
    (
    SELECT COUNT(*)
    FROM
		employee
	WHERE 
		department_id = department.department_id
	) AS "Count of Employee"
FROM
	department
GROUP BY department_id
HAVING (
		SELECT COUNT(*)
    FROM
		employee
	WHERE 
		department_id = department.department_id
	) > 5;
    
SELECT 
	invoice_id,
    product_name,
    category,
    order_datetime,
    quantity
FROM 
	orders, product
WHERE 
	(orders.product_id, quantity) IN 
(
	SELECT product_id, MAX(quantity)
    FROM orders
    GROUP BY orders.product_id
    HAVING 
	MAX(quantity) < (
					SELECT 
                    AVG(quantity)
                    FROM orders)
)
AND orders.product_id = product.product_id
ORDER BY
	orders.quantity, orders.product_id;
    
SELECT 
	MIN(quantity)
FROM
	orders;
    
SELECT 
	employee_id,
    first_name,
    last_name,
    position,
    manager_id
FROM
	employee AS e
WHERE EXISTS (
		SELECT
			employee_id
		FROM
			employee
		WHERE
			manager_id = e.employee_id);
            
SELECT
	department_name,
    department_id
FROM 
	department AS d
WHERE NOT EXISTS (
	SELECT *
    FROM
		employee
	WHERE
		department_id = d.department_id);
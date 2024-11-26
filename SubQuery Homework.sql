SELECT 
	AVG(rate) AS "Avarage Rate",
    MAX(rate) AS "Biggest Rate"
FROM
	employee
WHERE department_id IN (
	SELECT 
	department_id
    FROM 
    department
    WHERE city NOT IN ("Lviv")
    );
    
    
SELECT
	d.department_name AS "Department",
	e1.position AS "Position",
	AVG(e1.rate) AS "Avarage Rate"
FROM
	employee AS e1
JOIN
	department AS d ON e1.department_id = d.department_id
GROUP BY
	`Department`, `Position`
HAVING
	`Avarage Rate` < (
		SELECT
			AVG(rate)
		FROM
			employee AS e2
		WHERE
			e2.position = e1.position
		);

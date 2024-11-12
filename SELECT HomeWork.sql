SELECT
	o.orders_id "Orders ID",
    p.product_name "Product name",
    p.category "Product category",
    i.invoice_id "Invoice ID",
    i.transaction_moment "Transaction moment",
    c.last_name "Customer last name",
    c.first_name "Customer first name"
FROM 
	orders AS o
JOIN 
	product AS p ON o.product_id = p.product_id
JOIN 
	invoice AS i ON o.invoice_id = i.invoice_id
LEFT JOIN 
	customer AS c ON i.customer_id = c.customer_id
ORDER BY 
	o.orders_id;


SELECT
	o.orders_id "Orders ID",
    d.department_name "Department name",
    e.user_name "User name",
    p.product_name "Product name",
	p.category "Product category",
    i.invoice_id "Invoice ID",
    i.transaction_moment "Transaction moment",
    c.last_name "Customer last name",
    c.first_name "Customer first name"
FROM 
	orders AS o 
JOIN 
	product AS p ON o.product_id = p.product_id
JOIN 
	invoice AS i ON o.invoice_id = i.invoice_id
LEFT JOIN 
	customer AS c ON i.customer_id = c.customer_id
JOIN 
	employee AS e ON i.employee_id = e.employee_id
JOIN 
	department AS d ON e.department_id = d.department_id
WHERE
	department_name = "Mercury"
AND
	transaction_moment BETWEEN "2023-07-01" AND "2023-10-01"
ORDER BY 
	orders_id;


SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM 
    customer AS c
LEFT JOIN 
    invoice AS i ON c.customer_id = i.customer_id
UNION
SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM 
    customer AS c
RIGHT JOIN 
    invoice AS i ON c.customer_id = i.customer_id
ORDER BY 
    `Invoice ID`;
    
/* В mysql немає операторів full join чи outer join. І для того щоб виконати запит ми використовуємо Right Join і Left Join, а потім їх об'єднуємо.
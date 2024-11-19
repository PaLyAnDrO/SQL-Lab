SELECT
	LPAD(product_id, 4, '0') AS "Product ID",
	CONCAT_WS(" :: ", manufacture, product_name) AS "Product Name",
    UPPER(CONCAT(product_type, " - ", category))
FROM
	product
ORDER BY 
	manufacture;
  
  
SELECT
	DATE_FORMAT(o.order_datetime, '%m') AS 'Month',
    ROUND(SUM(o.quantity * p.price), 2) AS "Total revenue",
    CONCAT("Quater ", QUARTER(o.order_datetime), " - ", YEAR(o.order_datetime)) AS "Sales Period"
FROM
    orders AS o
JOIN
	product AS p ON o.product_id = p.product_id
GROUP BY
	`Sales Period`, `Month`;


SELECT  
	p.product_id AS "Product ID",  
	p.product_name AS "Product name",     
    p.price AS "Product price",
    sum(o.quantity) AS "Product quantity",
    ROUND(SUM(p.price * o.quantity), 2) AS "Total amount" 
FROM  
	orders AS o 
JOIN  
	product AS p ON o.product_id = p.product_id 
GROUP BY  
	`Product ID`
ORDER BY
	`Product ID`;


SELECT 
    c.customer_id AS "Customer ID",
    c.last_name AS "Customer last name",
    c.first_name AS "Customer first name",
    ROUND(SUM(o.quantity * p.price), 2) AS "Total Amount"
FROM 
    customer c
JOIN 
    invoice i ON c.customer_id = i.customer_id
JOIN 
    orders o ON i.invoice_id = o.invoice_id
JOIN 
    product p ON o.product_id = p.product_id
GROUP BY 
    c.customer_id, c.last_name, c.first_name
ORDER BY 
    `Total Amount` DESC LIMIT 10;

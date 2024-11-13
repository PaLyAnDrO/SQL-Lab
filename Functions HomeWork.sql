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
	product_id AS "Product ID",
    product_name AS "Product name",
    price AS "Product price",
    amount AS "Product Quantity",
    ROUND(price * amount, 2) AS "Total amount"
FROM
	product
HAVING 
	(price * amount) > 50000;

SELECT
	LPAD(c.customer_id, 3, '0') AS "Customer ID",
    c.last_name AS "Customer last name",
    c.first_name AS "Customer first name",
    ROUND(SUM(o.quantity * p.price), 2) AS "Total amount"
FROM
	customer AS c
JOIN
	invoice AS i ON c.customer_id = i.customer_id
JOIN
	orders AS o ON o.invoice_id = i.invoice_id
JOIN
	product AS p ON o.product_id = p.product_id
GROUP BY
	`Customer ID`, c.last_name, c.first_name
ORDER BY
	`Total amount` DESC;
SELECT * FROM customer
ORDER BY last_name;

SELECT DISTINCT
	manufacture
FROM 
	product
ORDER BY
	manufacture ASC;

SELECT
	product_name,
    manufacture,
    category,
	product_type,
    price
FROM
	product
WHERE
	manufacture = 'Dell'
ORDER BY
	product_name;
    
SELECT
	first_name AS 'First name',
    last_name AS 'Last name',
    gender 'Gender',
    birth_date 'Birth date',
    phone_number 'Phone number'
FROM
	customer
WHERE
	gender = 'f'
AND
	birth_date 
    BETWEEN '1989-12-31'
    AND '2000-12-31';
    
SELECT 
	-- product_id,
	product_name,
    category,
    manufacture,
    price,
    product_description
FROM 
	product
WHERE
	category = 'NOTEBOOK'
AND
	product_description LIKE '%512GB%';

SELECT 
	product_id,
	product_name,
    category,
    manufacture,
    price,
    product_description
FROM 
	product
WHERE
	category in ('NOTEBOOK','Desktops')
AND
	(product_description LIKE '%512GB%'
OR
	product_description LIKE '%1TB%')
ORDER BY
	product_name;
    
SELECT
	*
FROM
	invoice
WHERE 
	customer_id IS NULL;
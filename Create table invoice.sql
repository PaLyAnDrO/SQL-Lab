USE company;

CREATE TABLE IF NOT EXISTS `invoice` (
	`invoice_id` BIGINT(15) NOT NULL,
    `employee_id` INT NOT NULL,
    `customer_id` INT,
    `payment_method` INT NOT NULL,
    `transaction_moment` DATETIME NOT NULL,
    `status` varchar(10) NOT NULL
);

-- Add new columns
ALTER TABLE orders ADD invoice_id BIGINT(15) NOT NULL;
ALTER TABLE orders ADD order_datetime DATETIME NOT NULL;
ALTER TABLE orders ADD quantity INT NOT NULL;

-- Delete columns
ALTER TABLE orders DROP transaction_type;
ALTER TABLE orders DROP transaction_moment;
ALTER TABLE orders DROP amount;
ALTER TABLE orders DROP customer_id;
ALTER TABLE orders DROP employee_id;

-- Modify column
ALTER TABLE customer MODIFY phone_number BIGINT(15) NOT NULL;
ALTER TABLE employee MODIFY position VARCHAR(30) NOT NULL;

-- Modify department
ALTER TABLE department MODIFY street varchar(50) NOT NULL;
ALTER TABLE department MODIFY building_no INT(4);

-- Primary key 
ALTER TABLE invoice ADD PRIMARY KEY (invoice_id);

-- Foreings keys
ALTER TABLE orders DROP FOREIGN KEY orders_fk1;
ALTER TABLE orders DROP FOREIGN KEY orders_fk3;
ALTER TABLE orders ADD CONSTRAINT orders_fk2 FOREIGN KEY (product_id) REFERENCES product(product_id);
ALTER TABLE invoice ADD CONSTRAINT invoice_fk0 FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
ALTER TABLE invoice ADD CONSTRAINT invoice_fk1 FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
 
 
 -- UNIQUE Constraint
 ALTER TABLE department ALTER city SET DEFAULT 'Lviv';
 ALTER TABLE employee ADD UNIQUE (user_name);
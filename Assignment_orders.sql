-- Step 1. Creating the new database--
CREATE database Assignment;

-- Step 2. Creating the table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY not null, 
    customer_id INT not null, 
    order_date DATE not null,
    amount FLOAT not null
);

-- Step 3. Inserting the Values to the table
insert into orders(customer_id, order_date, amount)
values (101, "2023-01-01", 250.00),
	   (102, "2023-01-02", 150.00),
       (101, "2023-01-05", 100.00),
       (103, "2023-01-07", 300.00);

select * from orders;

-- a) Get the total amount spent by each customer. --
SELECT customer_id, SUM(amount) from orders group by customer_id;

-- b) List all orders placed after '2023-01-03'. --
SELECT * FROM orders WHERE order_date > '2023-01-03';

-- c) Get the customer(s) who made more than one order. --
SELECT customer_id, COUNT(customer_id) AS order_times FROM orders 
GROUP BY customer_id
HAVING order_times > 1;
CREATE TABLE customers (customer_id INT PRIMARY KEY, customer_name VARCHAR(100));
     CREATE TABLE sales (sale_id INT PRIMARY KEY, customer_id INT, store_name VARCHAR(100), sale_date DATE, amount DECIMAL(10,2));
     INSERT INTO customers VALUES (1, 'John Smith'), (2, 'Emma Jones'), (3, 'Oliver Brown');
     INSERT INTO sales VALUES
		 (1, 1, 'Tesco', '2023-01-15', 100.00), 
                            (2, 1, 'Sainsburys', '2023-01-20', 150.00), 
                              (3, 2, 'Tesco', '2023-02-12', 75.00);


SELECT * FROM CUSTOMERS
SELECT * FROM SALES

/*
List all customers who purchased products from both Tesco and Sainsbury's in the same month.
*/
SELECT c.customer_name
FROM customers c
JOIN sales s1 ON c.customer_id = s1.customer_id
JOIN sales s2 ON c.customer_id = s2.customer_id
WHERE EXTRACT(MONTH FROM s1.sale_date) = EXTRACT(MONTH FROM s2.sale_date)
AND EXTRACT(YEAR FROM s1.sale_date) = EXTRACT(YEAR FROM s2.sale_date)
AND s1.store_name = 'Tesco'
AND s2.store_name = 'Sainsburys';

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Mumbai');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM
customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM
customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM
customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM
customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT * FROM
customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM 
customers
CROSS JOIN orders;

SELECT * FROM
customers as A
JOIN customers as B
on A.customer_id=B.customer_id;

SELECT * 
FROM customers AS A
LEFT JOIN  orders AS B 
ON A.customer_id = B.customer_id
WHERE B.customer_id IS NULL;

SELECT * 
FROM customers AS A
RIGHT JOIN orders AS B
ON A.customer_id = B.customer_id
WHERE A.customer_id IS NULL;

SELECT * 
FROM orders
WHERE amount > (
	SELECT AVG(amount)
    FROM orders
); 

SELECT name,(
	SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id=c.customer_id
)AS Count_order
FROM customers c;

SELECT summary.customer_id,summary.avg_amount
FROM
(SELECT customer_id,AVG(amount) as avg_amount
FROM orders
GROUP BY customer_id)
AS summary;
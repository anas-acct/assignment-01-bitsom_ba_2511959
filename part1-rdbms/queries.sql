SELECT * FROM customers;

SELECT * FROM products
WHERE price > 500;

SELECT orders.order_id, customers.name, orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

SELECT SUM(quantity * price) AS total_sales
FROM orders
JOIN products ON orders.product_id = products.product_id;

SELECT sales_reps.name, COUNT(orders.order_id) AS total_orders
FROM orders
JOIN sales_reps ON orders.sales_rep_id = sales_reps.sales_rep_id
GROUP BY sales_reps.name;

-- Q1: List all customers from Mumbai along with their total order value
SELECT * FROM customers;

-- Q2: Find the top 3 products by total quantity sold
SELECT * FROM products
WHERE price > 500;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT orders.order_id, customers.name, orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT SUM(price) AS total_sales
FROM orders
JOIN products ON orders.product_id = products.product_id;

-- Q5: Identify any products that have never been ordered
SELECT sales_reps.name, COUNT(orders.order_id) AS total_orders
FROM orders
JOIN sales_reps ON orders.sales_rep_id = sales_reps.sales_rep_id
GROUP BY sales_reps.name;

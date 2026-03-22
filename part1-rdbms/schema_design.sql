CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(150) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    
    customer_id INT,
    product_id INT,
    sales_rep_id INT,
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Mumbai'),
(2, 'Priya Singh', 'priya@gmail.com', 'Delhi'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Bangalore'),
(4, 'Sneha Khan', 'sneha@gmail.com', 'Mumbai'),
(5, 'Arjun Patel', 'arjun@gmail.com', 'Ahmedabad');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Mobile Phone', 'Electronics', 20000.00),
(103, 'T-Shirt', 'Clothing', 800.00),
(104, 'Washing Machine', 'Appliances', 30000.00),
(105, 'Headphones', 'Electronics', 1500.00);

INSERT INTO sales_reps VALUES
(201, 'Raj Mehta', 'raj@company.com', 'Mumbai Office'),
(202, 'Neha Gupta', 'neha@company.com', 'Delhi Office'),
(203, 'Vikas Rao', 'vikas@company.com', 'Bangalore Office'),
(204, 'Anita Das', 'anita@company.com', 'Kolkata Office'),
(205, 'Suresh Iyer', 'suresh@company.com', 'Chennai Office');

INSERT INTO orders VALUES
(1001, '2024-01-10', 2, 1, 101, 201),
(1002, '2024-01-12', 1, 2, 102, 202),
(1003, '2024-01-15', 3, 3, 103, 203),
(1004, '2024-01-18', 1, 4, 104, 204),
(1005, '2024-01-20', 2, 5, 105, 205);


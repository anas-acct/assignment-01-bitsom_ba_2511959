-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Fact Table
CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Insert into dim_date (cleaned YYYY-MM-DD format)
INSERT INTO dim_date VALUES
(1, '2023-08-29', 8, 2023),
(2, '2023-12-12', 12, 2023),
(3, '2023-02-05', 2, 2023),
(4, '2023-02-20', 2, 2023),
(5, '2023-01-15', 1, 2023);

-- Insert into dim_store
INSERT INTO dim_store VALUES
(101, 'Chennai Anna', 'Chennai'),
(102, 'Delhi South', 'Delhi'),
(103, 'Mumbai Central', 'Mumbai');

-- Insert into dim_product (standardized category casing)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mobile', 'Electronics'),
(203, 'T-Shirt', 'Clothing');

-- Insert into fact_sales (at least 10 rows)
INSERT INTO fact_sales VALUES
('TXN5000', 1, 101, 201, 3, 49262.78, 147788.34),
('TXN5001', 2, 101, 202, 11, 23226.12, 255487.32),
('TXN5002', 3, 101, 201, 20, 48703.39, 974067.80),
('TXN5003', 4, 102, 202, 14, 23226.12, 325165.68),
('TXN5004', 5, 101, 201, 10, 58851.01, 588510.10),
('TXN5005', 1, 103, 203, 5, 800.00, 4000.00),
('TXN5006', 2, 102, 203, 8, 800.00, 6400.00),
('TXN5007', 3, 103, 202, 6, 20000.00, 120000.00),
('TXN5008', 4, 101, 203, 7, 800.00, 5600.00),
('TXN5009', 5, 102, 201, 2, 55000.00, 110000.00);

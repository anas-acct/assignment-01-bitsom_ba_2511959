## Anomaly Analysis

### Insert Anomaly
In the orders_flat.csv table, a new product cannot be added unless an order exists. For example, to insert a new product, fields like order_id, customer_id, and order_date are required, even if no order has been placed yet. This makes it impossible to store product information independently.

### Update Anomaly
Customer and sales representative details are repeated across multiple rows. For example, if a customer's email changes, it must be updated in every row where that customer appears. If some rows are missed, it will lead to inconsistent data.

### Delete Anomaly
If a row representing an order is deleted, all related information such as customer details, product details, and sales representative information is also lost. For example, if a customer has only one order and that row is deleted, the entire record of that customer is removed from the database.


## Normalization Justification

Keeping all data in a single table may appear simpler initially, but it leads to serious data integrity issues. In the provided dataset, customer, product, and sales representative information is repeated across multiple rows. This redundancy increases storage usage and creates a high risk of inconsistencies.
For instance, if the price of a product such as a Laptop changes, it must be updated in every row where it appears. If even one row is missed, the database will contain conflicting information. Similarly, deleting a single order may result in the loss of important customer or product data, which is unacceptable in real-world systems.
Normalization to Third Normal Form (3NF) eliminates these problems by separating data into logical tables such as customers, products, orders, and sales representatives. Each table stores only relevant attributes, and relationships are maintained using foreign keys. This ensures data consistency, reduces redundancy, and improves scalability.
Therefore, normalization is not over-engineering but a necessary step for building reliable and maintainable database systems.

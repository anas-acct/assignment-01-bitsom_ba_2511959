## Anomaly Analysis

### Insert Anomaly
In the orders_flat.csv table, a new product cannot be added unless an order exists. For example, to insert a new product, fields like order_id, customer_id, and order_date are required, even if no order has been placed yet. This makes it impossible to store product information independently.

### Update Anomaly
Customer and sales representative details are repeated across multiple rows. For example, if a customer's email changes, it must be updated in every row where that customer appears. If some rows are missed, it will lead to inconsistent data.

### Delete Anomaly
If a row representing an order is deleted, all related information such as customer details, product details, and sales representative information is also lost. For example, if a customer has only one order and that row is deleted, the entire record of that customer is removed from the database.

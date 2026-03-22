## ETL Decisions

### Decision 1 — Normalizing Category Names
Problem: Product categories appeared in inconsistent formats such as "electronics", "Electronics", and "ELECTRONICS".
Resolution: All category values were standardized to a uniform format (e.g., "Electronics") before inserting into the dim_product table.

### Decision 2 — Handling Missing Values
Problem: Some records contained NULL or missing values in key fields such as store or category.
Resolution: Missing values were either cleaned using appropriate defaults or excluded where necessary to maintain data quality.

### Decision 3 — Derived Total Amount
Problem: The dataset provided units_sold and unit_price but did not explicitly include total revenue per transaction.
Resolution: A new column total_amount was derived by multiplying units_sold and unit_price, enabling efficient revenue-based analysis.

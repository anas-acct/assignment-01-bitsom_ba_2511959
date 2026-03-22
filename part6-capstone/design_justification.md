## Storage Systems

The system uses a combination of OLTP database, Data Lake, and Data Warehouse to support different requirements. The OLTP database (such as PostgreSQL) is used to store structured patient data, treatment history, and transactional records. This is essential for day-to-day hospital operations and ensures fast read/write performance.

A Data Lake (such as Amazon S3 or Hadoop HDFS) is used to store raw and unstructured data, especially real-time ICU monitoring data. Since ICU devices generate continuous high-volume streams, a scalable storage solution is required. The Data Lake allows storing this data in its original format for future processing and machine learning use.

A Data Warehouse (such as Snowflake or BigQuery) is used for analytical purposes like generating monthly reports. It stores cleaned and aggregated data, making it efficient for queries related to bed occupancy, department costs, and hospital performance metrics.

For AI applications, historical data from the Data Lake and Warehouse is used to train the readmission prediction model. Additionally, an NLP model is integrated to process doctor queries in natural language.

## OLTP vs OLAP Boundary

The OLTP system handles real-time transactional data such as patient records, doctor interactions, and treatment updates. This layer is optimized for fast inserts and updates.

The OLAP system begins once the data is moved from the OLTP database and Data Lake into the Data Warehouse through ETL processes. The Data Warehouse is designed for complex queries, aggregations, and reporting.

Thus, the boundary lies at the ETL layer, where transactional data is transformed and loaded into analytical storage systems.

## Trade-offs

One major trade-off in this architecture is between real-time processing and system complexity. Supporting real-time ICU data streaming alongside batch processing increases system complexity and cost.

To mitigate this, a hybrid approach is used where only critical real-time data (such as abnormal vitals) is processed immediately for alerts, while the rest is stored and processed in batches. This reduces unnecessary load on the system while still ensuring timely responses for critical situations.

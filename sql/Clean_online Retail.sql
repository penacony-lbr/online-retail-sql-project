CREATE OR REPLACE TABLE `online-retail-project-478107.online_retail.retail_clean` AS
SELECT
  CAST(Invoice AS STRING) AS invoice_no,
  CAST(StockCode AS STRING) AS stock_code,
  Description AS description,
  CAST(Quantity AS INT64) AS quantity,
  DATETIME(InvoiceDate) AS invoice_datetime,
  CAST(Price AS NUMERIC) AS price,
  CAST(`Customer ID` AS INT64) AS customer_id,
  Country AS country,
  -- tạo cột doanh thu từng dòng
  CAST(Quantity AS INT64) * CAST(Price AS NUMERIC) AS line_amount
FROM `online-retail-project-478107.online_retail.raw_online_retail`
WHERE
  Quantity IS NOT NULL
  AND Price IS NOT NULL
  AND Quantity > 0
  AND Price > 0
  AND Invoice IS NOT NULL
  AND `Customer ID` IS NOT NULL;

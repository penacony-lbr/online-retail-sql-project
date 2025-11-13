-- Purpose:
-- Identify the top 10 best-selling products based on total quantity sold.
-- Helps understand customer demand and supports inventory/marketing decisions.

-- Notes:
-- 1. ANY_VALUE(description) is used because some StockCodes have inconsistent descriptions.
-- 2. Sorting by DESC quantity helps highlight high-demand SKUs.
-- 3. total_revenue is included to compare popularity vs revenue contribution.

SELECT
  stock_code,
  ANY_VALUE(description) AS product_name,     -- representative product name
  SUM(quantity) AS total_quantity_sold,       -- total units sold
  SUM(line_amount) AS total_revenue           -- revenue generated
FROM `online-retail-project-478107.online_retail.retail_clean`
GROUP BY stock_code
ORDER BY total_quantity_sold DESC             -- best-selling by quantity
LIMIT 10;

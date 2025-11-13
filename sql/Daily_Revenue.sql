-- Purpose:
-- Compute daily revenue and cumulative running revenue.
-- Helps visualize growth trend and seasonal patterns.

WITH daily_sales AS (
  SELECT
    DATE(invoice_datetime) AS date,
    SUM(line_amount) AS daily_revenue
  FROM `online-retail-project-478107.online_retail.retail_clean`
  GROUP BY date
)
SELECT
  date,
  daily_revenue,
  SUM(daily_revenue) OVER (ORDER BY date) AS cumulative_revenue
FROM daily_sales
ORDER BY date;

-- Purpose:
-- Identify top customers by total revenue.
-- Helps understand high-value customers and supports segmentation.

-- Notes:
-- 1. SUM(line_amount) shows customer monetary value.
-- 2. RANK() highlights the relative standing of each customer.
-- 3. LIMIT 10 returns the top 10 customers (VIP).

WITH customer_revenue AS (
  SELECT
    customer_id,
    SUM(line_amount) AS total_revenue
  FROM `online-retail-project-478107.online_retail.retail_clean`
  GROUP BY customer_id
)
SELECT
  customer_id,
  total_revenue,
  RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank
LIMIT 10;

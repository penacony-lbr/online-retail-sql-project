-- Purpose:
-- Analyze revenue contribution by country (excluding UK which dominates dataset).
-- Useful for identifying international opportunities.

SELECT
  country,
  SUM(line_amount) AS total_revenue,
  COUNT(DISTINCT customer_id) AS unique_customers
FROM `online-retail-project-478107.online_retail.retail_clean`
WHERE country != 'United Kingdom'
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

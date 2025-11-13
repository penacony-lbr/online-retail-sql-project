-- Purpose:
-- Build cohort table based on the customer's first purchase month.
-- Helps analyze customer retention over time.

WITH base AS (
  SELECT
    customer_id,
    DATE_TRUNC(MIN(invoice_datetime), MONTH) AS cohort_month,
    DATE_TRUNC(invoice_datetime, MONTH) AS activity_month
  FROM `online-retail-project-478107.online_retail.retail_clean`
  GROUP BY customer_id, invoice_datetime
),
cohort AS (
  SELECT
    cohort_month,
    activity_month,
    COUNT(DISTINCT customer_id) AS active_customers
  FROM base
  GROUP BY cohort_month, activity_month
)
SELECT *
FROM cohort
ORDER BY cohort_month, activity_month;

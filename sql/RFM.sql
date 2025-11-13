-- Purpose:
-- Perform RFM (Recency, Frequency, Monetary) segmentation.
-- Helps classify customers and identify high-value groups.

WITH base AS (
  SELECT
    customer_id,
    MAX(DATE(invoice_datetime)) AS last_purchase,
    COUNT(DISTINCT invoice_no) AS frequency,
    SUM(line_amount) AS monetary
  FROM `online-retail-project-478107.online_retail.retail_clean`
  GROUP BY customer_id
),
rfm AS (
  SELECT
    customer_id,
    DATE_DIFF('2011-12-31', last_purchase, DAY) AS recency, -- reference end date
    frequency,
    monetary,
    NTILE(5) OVER (ORDER BY DATE_DIFF('2011-12-31', last_purchase, DAY)) AS R_score,
    NTILE(5) OVER (ORDER BY frequency DESC) AS F_score,
    NTILE(5) OVER (ORDER BY monetary DESC) AS M_score
  FROM base
)
SELECT
  *,
  (R_score * 100 + F_score * 10 + M_score) AS rfm_score
FROM rfm
ORDER BY rfm_score DESC
LIMIT 20;

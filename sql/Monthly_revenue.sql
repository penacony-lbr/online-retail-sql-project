-- Purpose:
-- Analyze monthly revenue, invoice count, and active customers
-- to understand sales trends and seasonality.

-- Key Insights (expected):
-- 1. Revenue typically ranges between ~500K–700K per month.
-- 2. Strong seasonal pattern with peaks around Mar–Jun.
-- 3. Customer activity remains stable across months.

SELECT
  DATE_TRUNC(invoice_datetime, MONTH) AS month,   -- normalize to first day of each month
  SUM(line_amount) AS total_revenue,               -- total sales for the month
  COUNT(DISTINCT invoice_no) AS total_invoices,    -- number of unique invoices
  COUNT(DISTINCT customer_id) AS total_customers   -- active customers in the month
FROM `online-retail-project-478107.online_retail.retail_clean`
GROUP BY month
ORDER BY month;

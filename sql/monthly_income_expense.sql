-- Monthly income and expense analysis
-- This query aggregates transactions by month and type

SELECT
  DATE_TRUNC(date, MONTH) AS month,
  transaction_type,
  SUM(amount) AS total_amount
FROM `julia-learning-122.financial_transactions.financial_transactions`
GROUP BY month, transaction_type
ORDER BY month, transaction_type;


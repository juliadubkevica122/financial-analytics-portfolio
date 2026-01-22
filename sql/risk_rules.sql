-- Compliance / Risk Analytics
-- Rule-based risk flags for transactions

SELECT
  transaction_id,
  transaction_date,
  amount,
  category,
  country,
  CASE
    WHEN amount > 10000 AND category = 'crypto'
      THEN 'High risk: large crypto'
    WHEN category = 'casino'
      THEN 'High risk: gambling'
    WHEN country <> 'IE'
      THEN 'Medium risk: foreign country'
    ELSE 'Low risk'
  END AS risk_flag
FROM transactions;

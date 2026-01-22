-- Compliance / Risk Analytics
-- Risk distribution summary

SELECT
  risk_flag,
  COUNT(*) AS transaction_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM (
  SELECT
    CASE
      WHEN amount > 10000 AND category = 'crypto'
        THEN 'High risk: large crypto'
      WHEN category = 'casino'
        THEN 'High risk: gambling'
      WHEN country <> 'IE'
        THEN 'Medium risk: foreign country'
      ELSE 'Low risk'
    END AS risk_flag
  FROM transactions
) t
GROUP BY risk_flag
ORDER BY transaction_count DESC;

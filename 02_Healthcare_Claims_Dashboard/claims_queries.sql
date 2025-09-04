-- Starter SQL queries for healthcare claims analysis

-- 1) Cost by region & month
SELECT region, DATE_TRUNC('month', claim_date) AS month, SUM(allowed_amount) AS total_cost
FROM claims
GROUP BY 1,2
ORDER BY 2,1;

-- 2) Cycle time by status
SELECT status, AVG(EXTRACT(EPOCH FROM (processed_at - submitted_at))/86400.0) AS avg_cycle_days
FROM claims
GROUP BY 1
ORDER BY 2 DESC;

-- 3) High-cost members (top 5%)
WITH ranked AS (
  SELECT member_id, SUM(allowed_amount) AS member_cost,
         NTILE(20) OVER (ORDER BY SUM(allowed_amount) DESC) AS vingtile
  FROM claims
  GROUP BY member_id
)
SELECT * FROM ranked WHERE vingtile = 1;

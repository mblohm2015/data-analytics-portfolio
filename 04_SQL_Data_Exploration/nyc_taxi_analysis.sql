-- NYC Taxi data exploration starters

-- Trips per month by pickup borough
SELECT pickup_borough, DATE_TRUNC('month', pickup_datetime) AS month, COUNT(*) AS trips
FROM trips
GROUP BY 1,2
ORDER BY 2 DESC;

-- Repeat rider cohorts (pseudo if rider_id exists)
WITH first_trip AS (
  SELECT rider_id, MIN(pickup_datetime) AS first_date
  FROM trips GROUP BY rider_id
),
cohorts AS (
  SELECT t.rider_id,
         DATE_TRUNC('month', f.first_date) AS cohort_month,
         DATE_TRUNC('month', t.pickup_datetime) AS month,
         COUNT(*) AS rides
  FROM trips t
  JOIN first_trip f ON t.rider_id = f.rider_id
  GROUP BY 1,2,3
)
SELECT cohort_month, month, SUM(rides) AS rides
FROM cohorts
GROUP BY 1,2
ORDER BY 1,2;

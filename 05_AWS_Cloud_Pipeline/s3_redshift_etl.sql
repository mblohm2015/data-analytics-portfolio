-- Redshift COPY + transform starter (assumes IAM role & S3 bucket set)

-- Stage raw
COPY staging_claims
FROM 's3://your-bucket/claims/'
IAM_ROLE 'arn:aws:iam::123456789012:role/YourRedshiftRole'
CSV IGNOREHEADER 1;

-- Transform into analytics schema
INSERT INTO analytics.claims_clean (...)
SELECT ... FROM staging_claims
WHERE allowed_amount IS NOT NULL;

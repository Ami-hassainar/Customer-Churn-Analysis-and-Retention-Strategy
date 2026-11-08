CREATE DATABASE churn_db;
use churn_db;
show tables;
SELECT * FROM cleaned_churn_data LIMIT 10;

-- TOTAL CUSTOMERS
SELECT COUNT(*) AS total_customers
FROM cleaned_churn_data;

-- CHURN COUNT
SELECT COUNT(*) AS churned_customers
FROM cleaned_churn_data
WHERE `Churn Label` = 'Yes';

-- CHURN RATE
SELECT 
COUNT(CASE WHEN `Churn Label`='Yes' THEN 1 END)*100.0/COUNT(*) AS churn_rate
FROM cleaned_churn_data;

-- TOP 10 CHURN REASONS
SELECT 
`Churn Reason`,
COUNT(*) AS churn_count
FROM cleaned_churn_data
WHERE `Churn Label`='Yes'
GROUP BY `Churn Reason`
ORDER BY churn_count DESC
LIMIT 10;

-- SENIOR VS NON-SENIOR
SELECT 
`Senior Citizen`,
COUNT(*) AS churn_count
FROM cleaned_churn_data
WHERE `Churn Label`='Yes'
GROUP BY `Senior Citizen`;
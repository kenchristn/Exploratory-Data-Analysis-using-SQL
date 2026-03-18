USE ds;

DESCRIBE ds_salaries;

SELECT * FROM ds_salaries;

-- 1. Cek baris yang mengandung NULL
SELECT *
FROM ds_salaries
WHERE 
    work_year IS NULL OR
    experience_level IS NULL OR
    employment_type IS NULL OR
    job_title IS NULL OR
    salary IS NULL OR
    salary_currency IS NULL OR
    salary_in_usd IS NULL OR
    employee_residence IS NULL OR
    remote_ratio IS NULL OR
    company_location IS NULL OR
    company_size IS NULL;

-- 2. Overview Salary
SELECT 
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    AVG(salary_in_usd) AS avg_salary,
    COUNT(*) AS total_data
FROM ds_salaries;

-- 3. Salary berdasarkan Experience Level
SELECT 
    experience_level,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- 4. Salary berdasarkan Job Title
SELECT 
    job_title,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY job_title
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC
LIMIT 10;

-- 5. Salary Bedasarkan Company Size
SELECT 
    company_size,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY company_size
ORDER BY avg_salary DESC;

-- 6. Remote vs Onsite Salary
SELECT 
    remote_ratio,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- 7. Salary bedasarkan lokasi berusahaan
SELECT 
    company_location,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY company_location
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC
LIMIT 10;

-- 8. Trend Salary per Tahun
SELECT 
    work_year,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary,
    COUNT(*) AS total
FROM ds_salaries
GROUP BY work_year
ORDER BY work_year;

-- 9. Salary per Experience + Company Size
SELECT 
    experience_level,
    company_size,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY experience_level, company_size
ORDER BY experience_level, avg_salary DESC;

-- 10. Top Paying Country untuk Senior Level
SELECT 
    company_location,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
WHERE experience_level = 'SE'
GROUP BY company_location
ORDER BY avg_salary DESC;

-- 11. Salary Bucket (segmentasi market)
SELECT 
    CASE 
        WHEN salary_in_usd < 80000 THEN 'Low'
        WHEN salary_in_usd BETWEEN 80000 AND 150000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category,
    COUNT(*) AS total,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM ds_salaries
GROUP BY salary_category
ORDER BY avg_salary;

-- 12. Distribusi Salary per Experience
SELECT 
    experience_level,
    CASE 
        WHEN salary_in_usd < 80000 THEN 'Low'
        WHEN salary_in_usd BETWEEN 80000 AND 150000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category,
    COUNT(*) AS total
FROM ds_salaries
GROUP BY experience_level, salary_category
ORDER BY experience_level, salary_category;

-- 13. Growth Salary YoY (%)
WITH yearly AS (
    SELECT 
        work_year,
        AVG(salary_in_usd) AS avg_salary
    FROM ds_salaries
    GROUP BY work_year
)
SELECT 
    work_year,
    ROUND(avg_salary, 0) AS avg_salary,
    ROUND(
        (avg_salary - LAG(avg_salary) OVER (ORDER BY work_year)) 
        / LAG(avg_salary) OVER (ORDER BY work_year) * 100
    ,2) AS growth_pct
FROM yearly;

-- 14. Median Salary
SELECT 
    AVG(salary_in_usd) AS median_salary
FROM (
    SELECT 
        salary_in_usd,
        ROW_NUMBER() OVER (ORDER BY salary_in_usd) AS rn,
        COUNT(*) OVER () AS total
    FROM ds_salaries
) t
WHERE rn IN (FLOOR((total+1)/2), FLOOR((total+2)/2));

-- 15. Outlier Detection (IQR)
SELECT 
    MAX(CASE WHEN rn = FLOOR(total * 0.25) THEN salary_in_usd END) AS Q1,
    MAX(CASE WHEN rn = FLOOR(total * 0.75) THEN salary_in_usd END) AS Q3
FROM (
    SELECT 
        salary_in_usd,
        ROW_NUMBER() OVER (ORDER BY salary_in_usd) AS rn,
        COUNT(*) OVER () AS total
    FROM ds_salaries
) t;

-- 16. Salary Distribution (Histogram sederhana)
SELECT 
    FLOOR(salary_in_usd / 50000) * 50000 AS salary_range,
    COUNT(*) AS total
FROM ds_salaries
GROUP BY salary_range
ORDER BY salary_range;

-- 17. Top Country vs Global Avg
SELECT 
    company_location,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary,
    ROUND(
        AVG(salary_in_usd) - 
        (SELECT AVG(salary_in_usd) FROM ds_salaries)
    ,0) AS diff_global
FROM ds_salaries
GROUP BY company_location
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC;

-- 18. Remote Premium (%)
SELECT 
    remote_ratio,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary,
    ROUND(
        (AVG(salary_in_usd) / 
        (SELECT AVG(salary_in_usd) FROM ds_salaries) - 1) * 100
    ,2) AS premium_pct
FROM ds_salaries
GROUP BY remote_ratio;

-- 19. Dominasi Role per Salary Level
SELECT 
    role_group,
    salary_category,
    COUNT(*) AS total
FROM (
    SELECT 
        CASE 
            WHEN job_title LIKE '%Data Scientist%' THEN 'Data Scientist'
            WHEN job_title LIKE '%Data Engineer%' THEN 'Data Engineer'
            WHEN job_title LIKE '%Analyst%' THEN 'Data Analyst'
            ELSE 'Other'
        END AS role_group,
        CASE 
            WHEN salary_in_usd < 80000 THEN 'Low'
            WHEN salary_in_usd < 150000 THEN 'Medium'
            ELSE 'High'
        END AS salary_category
    FROM ds_salaries
) t
GROUP BY role_group, salary_category
ORDER BY role_group, salary_category;

-- 20. Top Job per Country
SELECT *
FROM (
    SELECT 
        company_location,
        job_title,
        ROUND(AVG(salary_in_usd),0) AS avg_salary,
        RANK() OVER (
            PARTITION BY company_location 
            ORDER BY AVG(salary_in_usd) DESC
        ) AS rnk
    FROM ds_salaries
    GROUP BY company_location, job_title
) t
WHERE rnk <= 3;
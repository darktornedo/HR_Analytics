-- create database 
CREATE DATABASE HR_db;

-- create table 
CREATE TABLE hr_analytics (
emp_id VARCHAR(15) ,
age INT,
age_group VARCHAR(10),
attrition VARCHAR(10),
business_travel VARCHAR(20),
daily_rate INT,
department VARCHAR(30),
distance_from_home INT,
education INT,
education_field VARCHAR(20),
employee_count INT,
employee_number INT,
environment_satisfaction INT,
gender VARCHAR(10),
hourly_rate INT,
job_involvement INT,
job_level INT,
job_role VARCHAR(30),
job_satisfaction INT,
marital_status VARCHAR(10),
monthy_income INT,
salary_slab VARCHAR(20),
monthly_rate INT,
num_of_companies_worked INT,
over_18 VARCHAR(3),
over_time VARCHAR(5),
salary_hike INT,
performance_rating INT,
relationship_satisfaction INT,
standard_hours INT,
stock_option_level INT,
total_working_years INT,
traning_times_last_year INT,
work_life_balance INT,
years_at_company INT,
years_in_current_role INT,
years_since_last_promotion INT,
years_with_curr_manager INT 
);

-- Then Import the csv file through Table Data Import Wizard

-- Data Exploration 

SELECT COUNT(*) FROM hr_analytics;

SELECT COUNT(DISTINCT emp_id) FROM hr_analytics;

SELECT DISTINCT department FROM hr_analytics;

-- Data Analysis 

-- Basic Level Queries 

-- Task 1: write a query to find how many employees are male vs. female
SELECT gender, COUNT(emp_id) as total_count
FROM hr_analytics
GROUP BY gender
ORDER BY total_count DESC;

-- Task 2: write a query to find what is the average age and monthly income of employees
SELECT gender, ROUND(AVG(age),2) as avg_age, ROUND(AVG(monthy_income),2) as avg_income
FROM hr_analytics
GROUP BY gender;

-- Task 3: write a query to find how many employees are there in each department
SELECT department, COUNT(emp_id) AS total_employees
FROM hr_analytics
GROUP BY department
ORDER BY total_employees DESC;

-- Task 4: write a query to find what are the most common job roles
SELECT job_role, COUNT(emp_id) as total_count
FROM hr_analytics
GROUP BY job_role
ORDER BY total_count DESC;

-- Task 5: write a query to find what is the most common education field
SELECT education_field, COUNT(emp_id) as total_count
FROM hr_analytics
GROUP BY education_field
ORDER BY total_count DESC;

-- Task 6: write a query to find how many employees are married vs. single vs. divorced
SELECT marital_status, COUNT(emp_id) as total_count
FROM hr_analytics
GROUP BY marital_status
ORDER BY total_count DESC;

-- Intermediate Level Queries 

-- Task 1: write a query to find what is the overall attrition rate
SELECT 
ROUND(SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*),2) as attrition_rate
FROM hr_analytics;
	
-- Task 2: write a query to find what is the attrition rate by gender
SELECT gender,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*),2) as attrition_rate
FROM hr_analytics
GROUP BY gender;

-- Task 3: write a query to find what is the attrition rate in each department
SELECT department,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100/ COUNT(*),2) as attrition_rate
FROM hr_analytics
GROUP BY department;

-- Task 4: write a query to find What is the average monthly income by job role
SELECT job_role, ROUND(AVG(monthy_income),2) as avg_income
FROM hr_analytics
GROUP BY job_role;

-- Task 5: write a query to find What is the average years at company by department
SELECT department, ROUND(AVG(years_at_company),2) as avg_year_at_company
FROM hr_analytics
GROUP BY department;

-- Task 6: write a query to find What is the average job satisfaction by department or job role
SELECT department, job_role, AVG(job_satisfaction) as avg_job_satisfaction,
DENSE_RANK() OVER(PARTITION BY department ORDER BY AVG(job_satisfaction) DESC) as rnk
FROM hr_analytics
GROUP BY department, job_role;

-- Task 7: Do employees with low performance ratings have higher attrition?
SELECT performance_rating, COUNT(emp_id) as count_of_emp, 
SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS emp_attrition,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100 / count(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY performance_rating
ORDER BY count_of_emp DESC;

-- Task 8: What’s the distribution of overtime work by job role
SELECT job_role, COUNT(*) as total_count_of_emp,
SUM(CASE WHEN over_time = 'Yes' THEN 1 ELSE 0 END) AS over_time_employees,
SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY job_role
ORDER BY attrition_rate DESC;

-- Task 9: How many employees have not been promoted in the last 3+ years
SELECT department, COUNT(*) AS emp_count, 
SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left
FROM hr_analytics
WHERE years_since_last_promotion >=3
GROUP BY department;

-- Task 10: Do employees with High distance from home have higher attrition ?
SELECT distance_from_home, COUNT(*) AS emp_count,
SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY distance_from_home
ORDER BY attrition_rate DESC;

-- Task 11: Are employees with fewer years at the company more likely to leave
SELECT years_at_company, COUNT(*) as emp_count,
SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END) as employee_left,
ROUND(SUM(CASE WHEN attrition ='Yes' THEN 1 ELSE 0 END) *100 / COUNT(*),2) as attrition_rate
FROM hr_analytics
GROUP BY years_at_company
ORDER BY employee_left DESC
LIMIT 10;

-- Advance Level Queries 

-- Task 1: Do employees with low job satisfaction have a higher attrition rate?
SELECT job_satisfaction, COUNT(*) as emp_count,
SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) AS emp_attrition
FROM hr_analytics
group by job_satisfaction;

-- Task 2: What’s the average years at company of employees who left vs. stayed?
SELECT attrition, ROUND(AVG(years_at_company),2) AS avg_years_at_company
FROM hr_analytics
GROUP BY attrition;

-- Task 3: Are younger employees more likely to leave?
SELECT age_group, COUNT(*) as emp_count,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM( CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) AS attrition_rate
FROM hr_analytics
group by age_group;

-- Task 4: write a query to find is Work-Life Balance linked to Attrition?
SELECT work_life_balance, COUNT(*) as emp_count,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) as attrition_rate
FROM hr_analytics
GROUP BY Work_life_balance;

-- Task 5: Who are the top "at-risk" employees based on low satisfaction, low income, high overtime, and no promotion?
SELECT emp_id, employee_number, job_satisfaction, monthy_income, over_time, years_since_last_promotion, attrition
FROM hr_analytics
WHERE job_satisfaction<=2 
AND monthy_income <4000 
AND over_time = 'Yes' 
AND years_since_last_promotion >=3;

-- Task 6: Which combination of factors (e.g., job role, overtime, income, satisfaction) is most associated with attrition?

SELECT department, job_role, over_time, 
CASE 
    WHEN monthy_income <4000 THEN 'Low Income'
    ELSE 'High Income'
    END AS Income_level,
job_satisfaction, years_since_last_promotion, work_life_balance,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) AS employee_left,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ) *100 / COUNT(*),2) as attrition_rate
FROM hr_analytics
GROUP BY department, job_role, over_time, Income_level,job_satisfaction,years_since_last_promotion,work_life_balance
ORDER BY employee_left DESC
LIMIT 10;

-- Task 7; What patterns exist among high performers who left the company
SELECT performance_rating, attrition, over_time, monthy_income,job_satisfaction,years_since_last_promotion
FROM hr_analytics
WHERE attrition ='Yes' AND performance_rating BETWEEN 3 AND 4 
ORDER BY performance_rating DESC;

-- End of the Project
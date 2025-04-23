# HR Analytics SQL Project 
## Project Overview

**Project Title**: Employee Attrition & Performance Analysis

**Database**: `hr_db`


This project explores HR data from a fictional company to identify factors driving employee attrition, analyze departmental performance, and recommend actionable strategies to improve employee satisfaction and retention. The analysis is conducted using SQL, focusing on data-driven insights to help HR make informed decisions.


## Objectives

1. **Set up a database**: Create and populate a database with the provided dataset.
2. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
3. **Data Analysis**: Use SQL to answer specific questions and derive insights from the dataset.

## Dataset overview

Key Columns :
```
emp_id : Unique employee Id

Age : Age of the employee (in years)

Attrition : Whether the employee left the company (Yes or No)

BusinessTravel : Frequency of business travel (Rarely, Frequently, Non-Travel)

DailyRate : Daily salary rate of the employee

Department : Department in which the employee works (e.g., Sales, HR, R&D)

DistanceFromHome : Distance between employee’s home and office (in km)

Education : Education level (1 = Below College, 2 = College, 3 = Bachelor, etc.)

EducationField : Field of education (e.g., Life Sciences, Marketing, Technical Degree, etc.)

EmployeeCount : Always 1 (can be ignored – redundant)

EmployeeNumber : Unique ID assigned to each employee

EnvironmentSatisfaction : Satisfaction with the environment (1 = Low to 4 = Very High)

Gender : Gender of the employee (Male / Female)

HourlyRate : Hourly salary rate

JobInvolvement : Level of involvement in job (1 = Low to 4 = Very High)

JobLevel : Level of the job in the organization (1 = Entry Level to 5 = Executive)

JobRole : Specific job role (e.g., Sales Executive, Research Scientist, HR, etc.)

JobSatisfaction : Job satisfaction score (1 = Low to 4 = Very High)

MaritalStatus : Marital status of the employee (Single, Married, Divorced)

MonthlyIncome : Monthly salary (in currency)

MonthlyRate : Monthly salary rate

NumCompaniesWorked : Number of companies the employee has worked at

Over18 : Whether employee is over 18 (always "Y", can be ignored)

OverTime : Whether the employee works overtime (Yes or No)

PercentSalaryHike : Percentage increase in salary

PerformanceRating : Performance rating (1 = Low to 4 = Outstanding)

RelationshipSatisfaction : Satisfaction with relationships at work (1 to 4 scale)

StandardHours : Standard working hours (always 80, can be ignored)

StockOptionLevel : Level of stock option granted (0 to 3)

TotalWorkingYears : Total number of years of professional experience

TrainingTimesLastYear : Number of training sessions attended in the last year

WorkLifeBalance ; Work-life balance rating (1 = Bad to 4 = Best)

YearsAtCompany ; Number of years the employee has been at the company

YearsInCurrentRole : Number of years in the current job role

YearsSinceLastPromotion ; Years since last promotion

YearsWithCurrManager : Number of years with the current manager
```

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `hr_db`.
- **Table Creation**: A table named `hr_analytics` is created to store the HR data.

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

### 3. Data Analysis & Findings
[Questions](HR_Analytics_questions.txt)

## Conclusion

This project demonstrates how structured SQL queries can uncover hidden patterns in HR data. Identifying key drivers of attrition and performance enables the company to take strategic action and create a more positive and productive workplace.

## Key Insights & Recommendations

  1. High attrition in certain departments HR should investigate workload, Leadership or environment in those departments

  2. Overtime correlates with higher attrition Consider reducing overtime or compensating it better

  3. Employees with low satisfaction & income are more likely to leave Launch employee wellness programs or revise salary bands

  4. Long time since promotion can reduce morale Implement structured promotion tracking

  5. Certain roles show low job satisfaction Conduct job role-specific engagement surveys

  6. Employees with Low work life balance and High Distance from home are leaving Console those employees and Provide them Transport Services
  7. Employees with Higher Education Level has Low Level jobes are likely to Leave Implement a development and promotion pathway aligned with education level and skill to retain top talent, and ensure roles utilize employees’ full potential.

## Tools Used

  1. **MySQL :** Data querying & analysis
  2. **Kaggle Dataset :** [Dataset Link](https://www.kaggle.com/datasets/anshika2301/hr-analytics-dataset?select=HR_Analytics.csv)


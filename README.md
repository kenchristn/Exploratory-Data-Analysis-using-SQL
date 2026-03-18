# 📊 Salary Data Analysis using SQL

## 📌 Overview
This project performs an Exploratory Data Analysis (EDA) on salary data in the data industry using SQL.  
The objective is to identify key factors that influence salary, including experience level, job role, company characteristics, and remote work conditions.

---

## 🎯 Objectives
- Analyze salary distribution across different segments
- Identify the impact of experience level on salary
- Compare salary across job roles and company sizes
- Evaluate the effect of remote work on salary
- Analyze salary trends over time
- Detect outliers in salary data

---

## 📂 Dataset
- Source: ds_salaries dataset  
- Total records: 607  

### Key Columns:
- `salary_in_usd` → standardized salary for comparison
- `experience_level` → EN (Entry), MI (Mid), SE (Senior), EX (Executive)
- `job_title` → role of the employee
- `company_size` → S (Small), M (Medium), L (Large)
- `remote_ratio` → 0 (Onsite), 50 (Hybrid), 100 (Remote)
- `company_location` → country of the company
- `work_year` → year of salary record

---

## 🛠 Tools & Technologies
- MySQL
- SQL (Aggregation, Window Functions, CTE)
- Data Visualization (Canva / PowerPoint)

---

## 🔍 Analysis Workflow

### 1. Data Cleaning
- Checked for missing values
- Validated key columns
- Ensured data consistency

### 2. Salary Overview
- Calculated min, max, average, and median salary
- Identified high variance in salary distribution

### 3. Salary by Experience Level
- Compared salary across different seniority levels
- Observed significant increase from mid to senior roles

### 4. Salary by Job Role
- Identified top-paying roles
- Compared technical vs managerial positions

### 5. Company & Work Type Analysis
- Analyzed salary based on company size
- Compared remote, hybrid, and onsite roles

### 6. Salary Distribution
- Created salary segmentation:
  - Low (<80K)
  - Medium (80K–150K)
  - High (>150K)
- Built histogram to understand distribution

### 7. Trend Analysis
- Analyzed Year-over-Year (YoY) salary growth

### 8. Outlier Detection
- Used IQR method to detect extreme salary values

---

## 📊 Key Findings

- **Experience level is the strongest factor influencing salary**
- Salary increases significantly at senior and executive levels
- **Remote jobs offer higher average salaries**
- The **United States has the highest salary levels globally**
- Salary distribution is **right-skewed** due to high-value outliers
- Most salaries fall within the **medium range (80K–150K USD)**

---

## 💡 Insights

- Transitioning from mid-level to senior roles leads to the largest salary increase
- High-paying jobs are limited and represent a small portion of the market
- Remote work enables access to higher-paying global opportunities
- Technical and strategic roles (e.g., Data Engineer, Data Architect) have higher earning potential

---

## 🚀 Recommendations

### For Professionals
- Focus on advancing to senior-level roles
- Develop high-value technical skills (Data Engineering, Machine Learning)
- Consider remote opportunities for better salary prospects

### For Companies
- Offer competitive salaries to attract top talent
- Leverage remote hiring to access global talent pools
- Benchmark salaries against leading markets (e.g., US)

---

## 📁 Project Structure
# 📊 Salary Data Analysis using SQL

## 📌 Overview
This project performs an Exploratory Data Analysis (EDA) on salary data in the data industry using SQL.  
The objective is to identify key factors that influence salary, including experience level, job role, company characteristics, and remote work conditions.

---

## 🎯 Objectives
- Analyze salary distribution across different segments
- Identify the impact of experience level on salary
- Compare salary across job roles and company sizes
- Evaluate the effect of remote work on salary
- Analyze salary trends over time
- Detect outliers in salary data

---

## 📂 Dataset
- Source: ds_salaries dataset  
- Total records: 607  

### Key Columns:
- `salary_in_usd` → standardized salary for comparison
- `experience_level` → EN (Entry), MI (Mid), SE (Senior), EX (Executive)
- `job_title` → role of the employee
- `company_size` → S (Small), M (Medium), L (Large)
- `remote_ratio` → 0 (Onsite), 50 (Hybrid), 100 (Remote)
- `company_location` → country of the company
- `work_year` → year of salary record

---

## 🛠 Tools & Technologies
- MySQL
- SQL (Aggregation, Window Functions, CTE)
- Data Visualization (Canva / PowerPoint)

---

## 🔍 Analysis Workflow

### 1. Data Cleaning
- Checked for missing values
- Validated key columns
- Ensured data consistency

### 2. Salary Overview
- Calculated min, max, average, and median salary
- Identified high variance in salary distribution

### 3. Salary by Experience Level
- Compared salary across different seniority levels
- Observed significant increase from mid to senior roles

### 4. Salary by Job Role
- Identified top-paying roles
- Compared technical vs managerial positions

### 5. Company & Work Type Analysis
- Analyzed salary based on company size
- Compared remote, hybrid, and onsite roles

### 6. Salary Distribution
- Created salary segmentation:
  - Low (<80K)
  - Medium (80K–150K)
  - High (>150K)
- Built histogram to understand distribution

### 7. Trend Analysis
- Analyzed Year-over-Year (YoY) salary growth

### 8. Outlier Detection
- Used IQR method to detect extreme salary values

---

## 📊 Key Findings

- **Experience level is the strongest factor influencing salary**
- Salary increases significantly at senior and executive levels
- **Remote jobs offer higher average salaries**
- The **United States has the highest salary levels globally**
- Salary distribution is **right-skewed** due to high-value outliers
- Most salaries fall within the **medium range (80K–150K USD)**

---

## 💡 Insights

- Transitioning from mid-level to senior roles leads to the largest salary increase
- High-paying jobs are limited and represent a small portion of the market
- Remote work enables access to higher-paying global opportunities
- Technical and strategic roles (e.g., Data Engineer, Data Architect) have higher earning potential

---

## 🚀 Recommendations

### For Professionals
- Focus on advancing to senior-level roles
- Develop high-value technical skills (Data Engineering, Machine Learning)
- Consider remote opportunities for better salary prospects

### For Companies
- Offer competitive salaries to attract top talent
- Leverage remote hiring to access global talent pools
- Benchmark salaries against leading markets (e.g., US)

---

## 📁 Project Structure
Exploratory-Data-Analysis-using-SQL/
│
├── project_salary.sql
├── ds_salaries.csv
├── README.md

---

## 📸 Visualization
Visualizations were created using Canva and PowerPoint to support data storytelling.

---

## 👤 Author
Kenneth

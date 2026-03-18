# 📊 Salary Data Analysis using SQL

## 📌 Overview
This project performs an Exploratory Data Analysis (EDA) on a dataset of data industry salaries using SQL.  
The goal is to identify key factors that influence salary levels, such as experience, job role, company characteristics, and remote work conditions.

---

## 📂 Dataset
- Source: ds_salaries dataset  
- Total records: 607  
- Key features:
  - `salary_in_usd` (standardized salary)
  - `experience_level`
  - `job_title`
  - `company_size`
  - `remote_ratio`
  - `company_location`
  - `work_year`

---

## 🛠 Tools Used
- MySQL
- SQL (Window Functions, Aggregations, CTE)

---

## 🔍 Analysis Performed

### 1. Data Cleaning
- Checked for NULL values
- Validated salary consistency
- Ensured data readiness for analysis

### 2. Salary Overview
- Identified min, max, average, and median salary
- Detected high salary variance and potential outliers

### 3. Salary by Experience Level
- Compared salary across EN, MI, SE, EX levels
- Analyzed career progression impact on salary

### 4. Salary by Job Role
- Identified top-paying roles
- Compared technical vs strategic roles

### 5. Company & Work Type Analysis
- Salary by company size
- Remote vs onsite salary comparison

### 6. Salary Distribution
- Created salary segmentation (Low, Medium, High)
- Built histogram to understand distribution

### 7. Trend Analysis
- Year-over-Year (YoY) salary growth

### 8. Outlier Detection
- Used IQR method to identify extreme salary values

---

## 💡 Key Insights

- **Experience level is the strongest driver of salary**
- **Senior and executive roles show exponential salary growth**
- **Remote jobs offer higher average salaries compared to onsite roles**
- **The United States dominates global salary levels**
- **Salary distribution is right-skewed due to high-paying outliers**
- **Most jobs fall within the medium salary range (50K–150K USD)**

---

## 📈 Business Implications

### For Professionals
- Focus on advancing to senior-level roles
- Consider high-value career paths (Data Engineer, ML Engineer, Data Architect)
- Explore remote opportunities for better compensation

### For Companies
- Competitive salary is critical to attract data talent
- Remote hiring expands access to global talent
- Salary benchmarking is essential in a competitive market

---

## 📁 Project Structure

# Telco Customer Churn Analysis

## 📌 Project Overview

This project analyzes customer churn for a telecommunications company using **SQL and Power BI**.

The objective is to understand customer behavior, identify factors associated with churn, analyze revenue impact, and identify customer segments that should be targeted for retention campaigns.

---

## 🎯 Business Objectives

* Analyze overall customer churn and retention.
* Understand customer demographics and service usage.
* Identify customer groups with higher churn rates.
* Analyze the relationship between contract type, tenure, services, and churn.
* Identify high-value and high-risk customers.
* Analyze revenue impact from customer churn.
* Provide data-driven recommendations to improve customer retention.

---

## 🛠️ Tools & Technologies

* **SQL (PostgreSQL)** – Data analysis and business queries
* **Power BI** – Data visualization and dashboard development
* **GitHub** – Project documentation and version control

---

## 🗄️ Dataset

The dataset contains customer-level information including:

* Customer demographics
* Tenure
* Contract type
* Internet and phone services
* Online security and support services
* Payment methods
* Monthly charges
* Total charges
* Customer churn status

---

## 🔎 SQL Analysis

The SQL analysis covers:

### Customer Overview

* Total customers
* Churned and retained customers
* Overall churn rate
* Average tenure
* Average monthly charges
* Revenue analysis
* Payment methods

### Customer Demographics

* Gender distribution
* Senior citizens
* Partners
* Dependents

### Service Analysis

* Internet services
* Phone services
* Multiple lines
* Online security
* Online backup
* Device protection
* Tech support
* Streaming services

### Churn Analysis

* Churn by contract
* Churn by internet service
* Churn by payment method
* Churn by customer demographics
* Churn by support and security services

### Customer Behavior

* Tenure-based churn
* Monthly charge-based churn
* Churned vs retained customer behavior

### Revenue Analysis

* Revenue associated with churn
* Revenue by contract
* Average charges by service
* High-value churned customers

### Advanced SQL Analysis

* Customer segmentation
* High-risk customer identification
* Window functions
* Ranking
* CTEs and subqueries
* Business-focused customer analysis

---

# 📊 Power BI Dashboard

The Power BI dashboard contains three pages designed to provide an interactive view of customer churn and business performance.

## Page 1 – Churn Overview

Provides an overall view of:

* Customer base
* Churn and retention
* Customer demographics
* Tenure
* Monthly charges
* Service usage

<img width="1162" height="647" alt="page1_churn_overview" src="https://github.com/user-attachments/assets/a7ec316e-ba6f-4ebe-b07f-5d016a2a6595" />


## Page 2 – Customer Risk Analysis

Focuses on the major factors associated with customer churn, including:

* Contract type
* Internet service
* Payment method
* Tenure
* Monthly charges
* Customer demographics
* Support and security services

<img width="1157" height="641" alt="page2_Customer_risk_analysis" src="https://github.com/user-attachments/assets/96c2c215-3a48-432d-9ef1-9b018b51b83c" />

---

## Page 3 – Retention

Focuses on customer segmentation, revenue impact, high-risk customers, and retention opportunities.

<img width="1145" height="637" alt="page3_Retention_analysis" src="https://github.com/user-attachments/assets/e2c4ab5f-52e0-4988-81ce-686779e85431" />


# 🔍 Key Business Insights

The analysis highlights several important patterns:

* Month-to-month customers show substantially higher churn than customers with longer-term contracts.
* Customers with lower tenure require greater attention because early-stage customers are more likely to churn.
* Higher monthly charges are associated with higher churn in several customer groups.
* Fiber-optic customers show relatively high churn compared with other internet service groups.
* Electronic-check customers show relatively high churn compared with other payment methods.
* Customers using services such as Online Security and Tech Support generally show lower churn.
* Customers combining multiple risk characteristics should be prioritized for retention campaigns.

---

# 💡 Business Recommendations

Based on the analysis, the company should:

1. Encourage month-to-month customers to move to longer-term contracts through loyalty benefits and targeted discounts.

2. Strengthen onboarding and engagement during the first year of the customer relationship.

3. Identify high-risk customers early and provide proactive retention offers.

4. Promote services such as Online Security and Tech Support where the analysis indicates lower churn among subscribers.

5. Investigate the reasons behind relatively high churn among fiber-optic customers.

6. Review payment-method patterns and encourage convenient automatic payment options where appropriate.

7. Focus retention campaigns on customer groups with multiple high-risk characteristics.

8. Track churn reduction, customers retained, revenue saved, and campaign ROI to measure the effectiveness of retention strategies.

---

# 📁 Project Structure

```text
telco-customer-churn-analysis/
│
├── README.md
│
├── SQL/
│   └── telco_churn_analysis.sql
│
└── PowerBI/
    ├── Telco_Customer_Churn_Dashboard.pbix
    │
    └── screenshots/
        ├── page1_customer_overview.png
        ├── page2_churn_analysis.png
        └── page3_business_insights.png
```

---

## 👤 Project Focus

This project demonstrates practical skills in:

**SQL → Data Analysis → Business Insights → Power BI Visualization → Business Recommendations**

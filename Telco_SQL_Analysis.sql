
CREATE TABLE telco_churn(
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(10)
);

select * from telco_churn limit 5;



                                 --Customer Overview

--How many total customers are present in the dataset?
 select count(customerid) as total_customer from telco_churn;
 
--How many customers have churned and how many are still active?
select count(ye)

--What is the overall customer churn rate?
select 
--What is the average customer tenure?
select avg(tenure) from telco_churn;

--What is the average monthly charge of customers?
select avg(monthlycharges) from telco_churn;

--What is the maximum and minimum monthly charge?
select max(monthlycharges),min(monthlycharges) from telco_churn;

--What is the total revenue generated from monthly charges?

select sum(monthlycharges) as total_revenue from telco_churn ;

--How many unique payment methods are used by customers?
select distinct (paymentmethod) from telco_churn;

                                       --Customer Demographics
--How many customers are male and female?
select gender ,
       count(customerid) as cust_gender 
from 
telco_churn 
group by gender;

--How many senior citizens are there compared to non-senior citizens?

select seniorcitizen,
       count(customerid) 
from telco_churn 
group by seniorcitizen;

--How many customers have partners?
select * from telco_churn limit 5;
select partner,
       count(customerid) 
from telco_churn 
where partner='Yes' 
group by partner;

--How many customers have dependents?
select dependents ,
       count(customerid) 
from telco_churn 
where dependents='Yes' 
group by dependents;

--What percentage of customers are senior citizens?
select seniorcitizen,
       count(customerid) as total_customer,
	   count(case when seniorcitizen=1 then 1 end)*100.0/count(customerid)
from telco_churn
group by senio;
                                             --Service Analysis
											 
--How many customers use each internet service type?
select * from telco_churn limit 5;

select internetservice,
       count(customerid) 
from telco_churn 
group by internetservice ;

--How many customers use phone services?
select phoneservice ,
       count(customerid) as total_customer 
from telco_churn 
where phoneservice='Yes' 
group by phoneservice;

--How many customers have multiple lines?
select multiplelines ,
       count(customerid) as total_customer 
from telco_churn 
where multiplelines='Yes'
group by multiplelines

--How many customers are subscribed to online security?
select onlinesecurity ,
       count(customerid) as total_customer 
from telco_churn 
where onlinesecurity='Yes'
group by onlinesecurity;

--How many customers are subscribed to online backup?
select onlinebackup ,
       count(customerid) as total_customer 
from telco_churn 
where onlinebackup='Yes'
group by onlinebackup;

--How many customers use tech support services?

select techsupport,
       count(customerid) as tech_support 
from telco_churn 
where techsupport='Yes'
group by techsupport;


--How many customers use streaming TV and streaming movies services?
select* from telco_churn limit 5;

select streamingTV,
	   streamingmovies,
	   count(customerid) as total_customer
from telco_churn
where streamingtv='Yes'
and streamingmovies='Yes'
group by streamingTV,streamingmovies;

                       
                               **Churn Analysis
  
--Which contract type has the highest number of churned customers?
select contract,
       count(case when churn='Yes' then 1 end) as churned_customer 
from telco_churn 
group by contract 
order by churned_customer desc ;

--Which contract type has the highest churn rate?
select contract,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   count(case when churn='Yes' then 1 end)*100.0/count(customerid) as churn_rate
from telco_churn 
group by contract 
order by churn_rate desc ;

--What is the churn rate for each internet service type?
select internetservice,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   count(case when churn='Yes' then 1 end)*100.0/count(customerid) as churn_rate
from telco_churn 
group by internetservice 
order by churn_rate desc ;

--What is the churn rate among customers with and without tech support?
select techsupport,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   count(case when churn='Yes' then 1 end)*100.0/count(customerid) as churn_rate
from telco_churn 
group by techsupport 
order by churn_rate desc ;

--What is the churn rate among customers with and without online security?

select onlinesecurity,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by onlinesecurity
order by churn_rate desc ;

--Which payment method has the highest customer churn?
select paymentmethod,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by paymentmethod 
order by churn_rate desc ;

--Does having a partner affect customer churn?
select partner,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by partner
order by churn_rate desc ;

--Does having dependents affect customer churn?
select dependents,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by dependents
order by churn_rate desc ;


--Are senior citizens more likely to churn compared to younger customers?
select seniorcitizen,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by seniorcitizen
order by churn_rate desc ;


--Which gender has a higher churn rate?
select gender,
       count(case when churn='Yes' then 1 end) as churned_customer,
	   round(count(case when churn='Yes' then 1 end)*100.0/count(customerid),2) as churn_rate
from telco_churn 
group by gender 
order by churn_rate desc ;


                        --Customer Behavior Analysis
					  

--What is the average tenure of churned customers compared to retained customers?
select churn ,
       round(avg(tenure),2) as avg_tenure ,
	   count(customerid) 
from telco_churn 
group by churn;

--What is the average monthly charge of churned customers compared to retained customers?
select churn ,
       round(avg(monthlycharges)::numeric,2) as avg_monthly_charge ,
	   count(customerid) 
from telco_churn 
group by churn;

--Which tenure group has the highest churn rate?

select 
         case 
           when tenure between 0 and 12  then 'new_customer'
           when tenure between 13 and 24 then 'medium_term_customer'
           when tenure between 25 and 48  then 'long_term_customer'
           when tenure > 48 then 'very_long_term_customer'
		 end as tenurity_level,
		count(customerid) as total_customer,
		round((count(case when churn='Yes' then 1  end )*100.0)/count(customerid),2) as churn_rate
from telco_churn
group by tenurity_level
order by churn_rate desc;


--Which monthly charge range has the highest churn?
select 
         case 
           when monthlycharges between 0 and 40  then 'low_charge'
           when monthlycharges between 41 and 80 then 'medium_charge'
           when monthlycharges > 80 then 'high_charge'
		 end as charges_range,
		count(customerid) as total_customer,
		round((count(case when churn='Yes' then 1  end )*100.0)/count(customerid),2) as churn_rate
from telco_churn
group by charges_range
order by churn_rate desc;

--Are customers with higher monthly charges more likely to churn?
select 
         case 
           when monthlycharges between 0 and 40  then 'low_charge'
           when monthlycharges between 41 and 80 then 'medium_charge'
           when monthlycharges > 80 then 'high_charge'
		 end as charges_range,
		count(customerid) as total_customer,
		round((count(case when churn='Yes' then 1  end )*100.0)/count(customerid),2) as churn_rate
from telco_churn
group by charges_range
order by churn_rate desc;

            --Yes higher the monthly charges ,highre the churn rate.

--Which customer segment has the highest retention rate?
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN 'New Customer'
        WHEN tenure BETWEEN 13 AND 24 THEN 'Regular Customer'
        WHEN tenure > 24 THEN 'Loyal Customer'
    END AS customer_segment,

    COUNT(*) AS total_customers,

    COUNT(CASE WHEN churn = 'No' THEN 1 END) AS retained_customers,

    ROUND(
        COUNT(CASE WHEN churn = 'No' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS retention_rate

FROM telco_churn

GROUP BY customer_segment

ORDER BY retention_rate DESC;
                                    --Revenue Analysis
--How much monthly revenue is lost due to churned customers?
select churn,
       sum(monthlycharges) as monthly_revenue 
from telco_churn 
group by churn;

--Which contract type contributes the highest revenue?
select contract ,
       sum(totalcharges)as total_revenue 
from telco_churn 
group by contract
order by total_revenue desc limit 1;

--Which internet service generates the highest average monthly revenue?
select internetservice ,
       avg(monthlycharges)as avg_monthly_revenue 
from telco_churn 
group by internetservice
order by avg_monthly_revenue  desc limit 1;

--What is the average total charges of churned customers?
select churn ,
       avg(totalcharges) as avg_charges 
from telco_churn where churn='Yes' 
group by churn ;

--Which customer groups generate the highest revenue?
select * from telco_churn limit 1;

                 
                            --Customer Segmentation

--Segment customers into new, regular, and loyal customers based on tenure.
select customerid,
         case 
           when tenure between 0 and 12  then 'new_customer'
           when tenure between 13 and 24 then 'regular_customer'
           when tenure > 24 then 'loyal_customer'
		 end as tenurity_level
from telco_churn;


--Which customer segment has the highest churn rate?
select 
         case 
           when tenure between 0 and 12  then 'new_customer'
           when tenure between 13 and 24 then 'regular_customer'
           when tenure > 24 then 'loyal_customer'
		 end as tenurity_level,
		count(customerid) as total_customer,
		round((count(case when churn='Yes' then 1  end )*100.0)/count(customerid),2) as churn_rate
from telco_churn
group by tenurity_level
order by churn_rate desc;


--Identify high-value customers who have churned.
select customerid,
       totalcharges,
	   churn
from telco_churn
where churn='Yes'
and totalcharges is not null
order by totalcharges desc;

--Identify customers who are at high risk of churn.
SELECT 
    customerid,
    tenure,
    contract,
    monthlycharges,
    internetservice,
    techsupport,
    onlinesecurity,
    churn
FROM telco_churn
WHERE contract = 'Month-to-month'
AND tenure <= 12
AND monthlycharges > (
    SELECT AVG(monthlycharges)
    FROM telco_churn
)
AND techsupport = 'No'
AND onlinesecurity = 'No'
ORDER BY monthlycharges DESC;


--Which combination of contract type and internet service has the highest churn?
select internetservice,
       contract,
	   count(customerid) as total_customer,
	   count(case when churn='Yes'then 1 end) as churned_customer,
	   round(count(case when churn='Yes'then 1 end)*100.0/count(customerid),2) as Churned_rate
from telco_churn 
group by internetservice,contract
order by churned_rate desc;

--Which combination of payment method and contract type has the highest churn?
select paymentmethod,
       contract,
	   count(customerid) as total_customer,
	   count(case when churn='Yes'then 1 end) as churned_customer,
	   round(count(case when churn='Yes'then 1 end)*100.0/count(customerid),2) as Churned_rate
from telco_churn 
group by paymentmethod,contract
order by churned_rate desc;

                            

--Rank customers based on their monthly charges.
select customerid,
       monthlycharges,
	   rank() over(order by monthlycharges desc) as 
cus_rnk from telco_churn;

--Find the top 10 customers with the highest total charges.

select * from (
        select customerid,
               totalcharges,
	           dense_rank() over(order by totalcharges desc) as cus_rnk
from telco_churn
where totalcharges is not null)
where cus_rnk <= 10;

select * from telco_churn limit 5;

--Rank internet services based on average customer charges.
select *,
        dense_rank() over (order by avg_charges desc) as rnk
from (
	   select internetservice, 
       avg(totalcharges)as avg_charges 
from telco_churn 
group by internetservice)t;

--Rank contract types based on churn percentage.

with t as (select contract ,

                  count(customerid) as total_customer, 
	              (count(case when churn='Yes'then 1 end)*100.0/count(*)) as churn_percentage
           from telco_churn 
           group by contract)
select contract,
       total_customer,
	   churn_percentage,
	   rank() over(order by churn_percentage desc )
from t ;

--Find customers whose monthly charges are above the average monthly charge.
select customerid,
       monthlycharges,
	   churn,
	   (select round(avg(monthlycharges)::numeric,2) from telco_churn) as avg_charge
from telco_churn 
where monthlycharges > (select avg(monthlycharges) from telco_churn)

--Find the highest-paying customer in each contract category.
select * from (select contract,
       customerid,
	   rank() over(partition by contract order by totalcharges desc ) as highest_paying 
from telco_churn where totalcharges is not null)t
where highest_paying = 1

                             --CTE / Subquery
							 
--Create a customer summary showing customer value and churn status.

select customerid,
       monthlycharges ,
	   totalcharges,
	   tenure,
	   churn ,
	   seniorcitizen
from telco_churn 
where totalcharges is not null 
order by totalcharges desc;

--Find customers who pay more than the average monthly charge and have churned.
select customerid,
       monthlycharges,
	   churn,
	   (select round(avg(monthlycharges)::numeric,2) from telco_churn) as avg_charge
from telco_churn 
where monthlycharges > (select avg(monthlycharges) from telco_churn)
and churn='Yes'

--Find the percentage contribution of each payment method to total customers.
select paymentmethod,
       count(customerid),  
	   count(customerid)*100.0/(select count(customerid) from telco_churn )
from telco_churn 
group by paymentmethod ;

--Find the top 5 customer segments contributing to churn.

SELECT
    contract,
    internetservice,
    paymentmethod,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN churn = 'Yes' THEN 1 END) AS churned_customers,
    ROUND(
        COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY
    contract,
    internetservice,
    paymentmethod
HAVING COUNT(CASE WHEN churn = 'Yes' THEN 1 END) > 0
ORDER BY churned_customers DESC
LIMIT 5;

--Identify customers with low tenure but high monthly charges.
SELECT
    customerid,
    tenure,
    monthlycharges,
    contract,
    internetservice,
    paymentmethod,
    churn
FROM telco_churn
WHERE tenure <= 12
  AND monthlycharges > (
      SELECT AVG(monthlycharges)
      FROM telco_churn
  )
ORDER BY monthlycharges DESC;

--Find the difference in average charges between churned and retained customers.
SELECT
    ROUND(AVG(CASE WHEN churn = 'Yes' THEN monthlycharges END)::numeric, 2)
        AS avg_charges_churned,

    ROUND(AVG(CASE WHEN churn = 'No' THEN monthlycharges END)::numeric, 2)
        AS avg_charges_retained,

    ROUND(
        (
            AVG(CASE WHEN churn = 'Yes' THEN monthlycharges END)
            -
            AVG(CASE WHEN churn = 'No' THEN monthlycharges END)
        )::numeric,
        2
    ) AS difference_in_average_charges

FROM telco_churn;


                      -- Business Case Questions
					  
--Which customers should the company target for retention campaigns?
SELECT
    customerid,
    tenure,
    contract,
    monthlycharges,
    totalcharges,
    internetservice,
    paymentmethod,
    techsupport,
    onlinesecurity
FROM telco_churn
WHERE churn = 'No'
  AND contract = 'Month-to-month'
  AND tenure <= 12
  AND monthlycharges > (
      SELECT AVG(monthlycharges)
      FROM telco_churn
  )
  AND techsupport = 'No'
  AND onlinesecurity = 'No'
ORDER BY monthlycharges DESC;


--What are the top three factors associated with customer churn?
Contract

SELECT
    contract,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY contract
ORDER BY churn_rate DESC;

Internet Service

SELECT
    internetservice,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY internetservice
ORDER BY churn_rate DESC;

Payment Method

SELECT
    paymentmethod,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;
--Business insight: 
----Based on the standard Telco Churn dataset, month-to-month contracts, 
     fiber-optic internet, and electronic-check payment are among the major high-churn groups.

--If the company wants to reduce churn by 10%, which customer groups should they focus on?
SELECT
    contract,
    internetservice,
    CASE
        WHEN tenure <= 12 THEN 'New Customer'
        WHEN tenure <= 24 THEN 'Regular Customer'
        ELSE 'Loyal Customer'
    END AS customer_segment,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,

    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn

GROUP BY
    contract,
    internetservice,
    customer_segment

HAVING COUNT(*) >= 50

ORDER BY churn_rate DESC;
--Business insight: Focus retention efforts on high-churn, sufficiently large groups—particularly new/month-to-month customers and other segments identified by the query as having both high churn rate and substantial customer volume.

--Which services appear to improve customer retention?
For Tech Support:

SELECT
    techsupport,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'No') * 100.0 / COUNT(*),
        2
    ) AS retention_rate
FROM telco_churn
GROUP BY techsupport
ORDER BY churn_rate;

For Online Security:

SELECT
    onlinesecurity,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'No') * 100.0 / COUNT(*),
        2
    ) AS retention_rate
FROM telco_churn
GROUP BY onlinesecurity
ORDER BY churn_rate;

--Business insight: Services with lower churn among subscribers appear to be associated with better retention. In particular, Online Security and Tech Support are worth examining closely.


--Which customer profile represents the highest churn risk?
select
    customerid,
    tenure,
    contract,
    monthlycharges,
    internetservice,
    paymentmethod,
    techsupport,
    onlinesecurity,
    churn,

    (
        case when contract = 'Month-to-month' then 2 else 0 end
        +
        case when  tenure <= 12 then 2 else 0 end
        +
        CASE
            WHEN monthlycharges > (SELECT AVG(monthlycharges)
                                   FROM telco_churn)
            THEN 1 ELSE 0
        END
        +
        CASE WHEN techsupport = 'No' THEN 1 ELSE 0 END
        +
        CASE WHEN onlinesecurity = 'No' THEN 1 ELSE 0 END
        +
        CASE WHEN internetservice = 'Fiber optic' THEN 1 ELSE 0 END
        +
        CASE WHEN paymentmethod = 'Electronic check' THEN 1 ELSE 0 END
    ) AS risk_score

FROM telco_churn
ORDER BY risk_score DESC;
--Business insight: A high-risk profile is typically a new, month-to-month customer with high monthly charges, fiber-optic service, electronic-check payment, and no Tech Support or Online Security.

--What recommendations would you provide to reduce customer churn?
1. Encourage month-to-month customers to move to long-term contracts
   through discounts and loyalty benefits.

2. Provide stronger onboarding and support to new customers during
   their first 12 months.

3. Target high-risk customers with personalized retention offers.

4. Promote Online Security and Tech Support through bundles or
   free trials where these services show lower churn.

5. Investigate the reasons for higher churn among fiber-optic customers,
   particularly pricing, service quality, and support.

6. Review customers using electronic-check payments and encourage
   convenient automatic payment options.

7. Focus retention campaigns on customers who combine multiple
   high-risk characteristics rather than targeting everyone equally.

8. Measure the success of retention campaigns through churn reduction,
   customers retained, revenue saved, and ROI.

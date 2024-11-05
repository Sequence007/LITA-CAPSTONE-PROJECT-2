Create Database LITA_CAPSTONE_1

SELECT *
FROM [dbo].[Customer Data]
---Q1 Retrieve the total number of customers from each region.---
SELECT Region, COUNT(CustomerID) AS Total_No_of_Customers
FROM [dbo].[Customer Data]
GROUP BY Region
--Q2 Find the most popular subscription type by the number of customers.
SELECT SubscriptionType,COUNT(CustomerID)AS NO_Of_Customers
FROM [dbo].[Customer Data]
GROUP BY SubscriptionType
--Q3 Find customers who canceled their subscription within 6 months
SELECT CustomerName,Canceled,SubscriptionStart
FROM [dbo].[Customer Data]
WHERE Canceled =0 AND MONTH(SubscriptionStart) BETWEEN 1 AND 6
--Q4 Calculate the average subscription duration for all customers
SELECT Count(CustomerID) As
All_Customers,AVG(DATEDIFF(DAY,SubscriptionStart,SubscriptionEnd)) AS
Average_Subscription_Duration
FROM [dbo].[Customer Data]
WHERE SubscriptionEnd IS NOT NULL
----Q5 Find customers with subscriptions longer than 12 months.DATEDIFF
SELECT CustomerName,SubscriptionType,SubscriptionStart,SubscriptionEnd
FROM [dbo].[Customer Data]
WHERE DATEDIFF(MONTH,SubscriptionStart,SubscriptionEnd) >=12
--- Q6 calculate total revenue by subscription type
SELECT SubscriptionType,SUM(Revenue) AS Total_Revenue
FROM[dbo].[Customer Data]
GROUP BY SubscriptionType
---Q7 Find the top 3 regions by subscription cancellations.
SELECT TOP 3 Region,Canceled
FROM [dbo].[Customer Data]
--Q8 Find the total number of active and canceled subscriptions.
SELECT
SUM( CASE WHEN Canceled = 0 THEN 1 ELSE 0 END) AS ActiveSubscriptions,
SUM (CASE WHEN Canceled = 1 THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM [dbo].[Customer Data]
GROUP BY CustomerID
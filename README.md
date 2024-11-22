# OLA Data Insights Dashboard

# Introduction
This repository contains the code and analysis for the OLA Data Analysis project. The project aims to analyze ride-sharing data from OLA (an Indian ride-sharing company) to uncover insights, identify patterns, and make data-driven decisions for improving customer experience, optimizing routes, or analyzing market trends. A Data Analysis Insights performed with Excel, SQL & Power BI.

# About Project 👨‍💻 :- 

For this project we are taken the OLA Bookings dataset in which there are 20 columns and approx 1 lakh + rows and the file is in csv format.
Overview
The OLA Data Analysis project involves analyzing a dataset of ride-sharing transactions. The goal is to uncover insights such as:
The main objective is to build dashboard with key metrics, insights and visualizations on company Revenue,Ratings, Cancellation, Vehicle Type and details of service utilization.

Data cleaning is performed using Power BI ( Power Query Editor)

• Developed a Powerbi Dashboard to perform analysis, producing quantitative visualization in Powerbi to determine the company revenue , performance and what action should be taken to improve the growth of the company.


Overview of Booking Status
Vehicle Type
Cancellation
Revenue
Ratings

![image](https://github.com/user-attachments/assets/0c87d4f0-3c99-4368-aaaf-2db7aed29f67)
![image](https://github.com/user-attachments/assets/559f5e46-e755-4105-bb14-aa36386675d3)
![image](https://github.com/user-attachments/assets/772e0211-11ce-442c-9408-81ea68534f65)
![image](https://github.com/user-attachments/assets/12c2cd55-51cf-4f4e-a7d2-e1e0283ff275)


Steps Involved :- 

Step 1: Download OLA Bookings Dataset

Step 2: Cleaned Data using Excel / Power BI ( Power Query Editor)

Step 3: Connect Powerbi with Excel database 

Step 4: perform Data Analysis using SQL/ Power BI

Step 5: Save the file as (.pbix)

step 6: Publish the dashboard into powerbi cloud


Problem Statements
1. Ride Volume Over Time
2. Booking Status Breakdown
3. Top 5 Vehicle Types by Ride Distance
4. Average Customer Ratings by Vehicle Type
5. cancelled Rides Reasons
6. Revenue by Payment Method
7. Top 5 Customers by Total Booking Value
8. Ride Distance Distribution Per Day
9. Driver Ratings Distribution
10. Customer vs. Driver Ratings
    

# Data Analysis with SQL:
For each dataset, a table was created with a surrogate key to serve as the primary key, and a composite index was created on the date and hour columns to optimize querying and retrieving data.
EDA was performed using SQL queries to investigate patterns, relationships, and trends within the data. Various statistical and aggregate functions were utilized to extract meaningful insights about the demand for Uber and pickup patterns and correlations.

Create Database OLA;
use ola;
select * from bookings;

  1. Retrieve all successful bookings:
 
create view successful_bookings as 
 select * from bookings 
 where booking_status ='Success';
 
 
 1. Retrieve all successful bookings:

 select * from successful_bookings;
 
  2. Find the average ride distance for each vehicle type:
 create view avg_ride_distance as
 select vehicle_type,round(avg(ride_distance),2)
 from bookings
 group by vehicle_type;
 
  2. Find the average ride distance for each vehicle type:

 select * from avg_ride_distance;
 
 
3. Get the total number of cancelled rides by customers:


create view canceled_rides_by_customers as
select  count(booking_status) from bookings
where booking_status = 'Canceled by customer';

select * from canceled_rides_by_customers;

 4. List the top  10 customers who booked the highest number of rides:

create view top10_customers as 
select customer_id, count(booking_id) as total_rides from bookings
group by customer_id
order by total_rides DESC
limit 5;


select * from top10_customers;



 #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 
 create view total_rides_cancelled_by_drivers as
 select count(*) from bookings
 where canceled_rides_by_driver = 'Personal & car related issue';
 
 
  #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from total_rides_cancelled_by_drivers;
 
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 
 create view  Max_MIn_ratings as
 select vehicle_type, max(driver_ratings) as Max_ratings, min(driver_ratings) as Min_ratings
from bookings
 where vehicle_type = 'prime sedan';
 
  #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
  select * from max_min_ratings;
 
 #7. Retrieve all rides where payment was made using UPI:
 
 Create view UPI_Payment as 
 select * from bookings where payment_method = 'UPI';
 
 
  #7. Retrieve all rides where payment was made using UPI:

 select * from UPI_Payment;
 
 #8. Find the average customer rating per vehicle type:
 Create view Avg_customer_rating as
 select vehicle_type,Round(avg(customer_rating),2) as Avg_Customer_rating from bookings
 group by vehicle_type ;
 
 select * from avg_customer_rating;
 
 #9. Calculate the total booking value of rides completed successfully:
 
 select * from bookings;
 create view total_booking_value as
 select sum(booking_value) as total_booking_value from bookings
 where booking_status = 'success';
 
 select * from total_booking_value;
 
 #10. List all incomplete rides along with the reason
 
 select * from bookings;
 create view  incomplete_rides as
 select booking_id, Incomplete_rides_reason from bookings
 where Incomplete_rides = 'yes';
 
 select * from incomplete_rides;




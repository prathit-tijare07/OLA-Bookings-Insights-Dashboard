use ola;
select * from bookings;

 # 1. Retrieve all successful bookings:
 
create view successful_bookings as 
 select * from bookings 
 where booking_status ='Success';
 
 
  # 1. Retrieve all successful bookings:

 select * from successful_bookings;
 
 # 2. Find the average ride distance for each vehicle type:
 create view avg_ride_distance as
 select vehicle_type,round(avg(ride_distance),2)
 from bookings
 group by vehicle_type;
 
  # 2. Find the average ride distance for each vehicle type:

 select * from avg_ride_distance;
 
 
# 3. Get the total number of cancelled rides by customers:


create view canceled_rides_by_customers as
select  count(booking_status) from bookings
where booking_status = 'Canceled by customer';

select * from canceled_rides_by_customers;

# 4. List the top  10 customers who booked the highest number of rides:

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
 
 
 
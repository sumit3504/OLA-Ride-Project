create database ola;
use ola;

# 1. Retrieve All Success Bookings:
create View Successful_Bookings As
SELECT * FROM Bookings 
Where Booking_Status = "Success";

# 1. Retrieve All Success Bookings:
SELECT * FROM Successful_Bookings

#2. Find the average ride distance for each vehicle type: 
Create View Ride_Distance_For_Each_Vehicle As
Select Vehicle_Type, AVG(Ride_Distance)
    as Avg_Distance From Bookings
    Group By Vehicle_Type;

#2. Find the average ride distance for each vehicle type: 
Select* From Ride_Distance_For_Each_Vehicle;

# 3.Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT Count(*) As Total_Cancelled_Ride
FROM Bookings 
Where Booking_Status =  'cancelled by Customer';

# 3.Get the total number of cancelled rides by customers:
Select * From cancelled_rides_by_customers

# 4.List the top 5 customers who booked the highest number of rides:
CREATE View Customers_Highest_No_Of_Rides AS
Select Customer_ID, Count(Booking_ID) As Total_Rides
From bookings
Group By Customer_ID
Order By Total_Rides DESC LIMIT 5 ;

# 4.List the top 5 customers who booked the highest number of rides:
Select * From Customers_Highest_No_Of_Rides;

#5.Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Canceled_Rides_by_Driver
AS
SELECT COUNT(*)  As Canceled_Driver
FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issues';

#5.Get the number of rides cancelled by drivers due to personal and car-related issues:
 Select * From Canceled_Rides_by_Driver
 
 # 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create View Max_Min_Driver_Ratings 
 AS
 Select MAX(Driver_Ratings) AS MAX_Ratings,
 MIN(Driver_Ratings) As MIN_Ratings
 From bookings
 where Vehicle_Type = 'Prime Sedan';

 # 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Select * From Max_Min_Driver_Ratings;
 
# 7.Retrieve all rides where payment was made using UPI:
Create View UPI_Payment AS
 Select * From 
 bookings 
 where Payment_Method = 'UPI';
 
# 7.Retrieve all rides where payment was made using UPI:
Select * From UPI_Payment ;

#8.Find the average customer rating per vehicle type:
Create View AVG_Customer_Rating_Per_Vehicle_Type As
Select Vehicle_Type, AVG(Customer_Rating) As AVG_Customer_Rating
From bookings
Group By Vehicle_Type;

#8.Find the average customer rating per vehicle type:
 Select * From AVG_Customer_Rating_Per_Vehicle_Type

#9. Calculate the total booking value of rides completed successfully:
Create View Total_Success_Ride_Values As
Select Sum(Booking_Value) As Total_Success_Ride_Values
From bookings
Where Booking_Status = "Success";

#9. Calculate the total booking value of rides completed successfully:
Select * From  Total_Success_Ride_Values


#10. List all incomplete rides along with the reason:

Create View Incomplete_Rides 
AS
Select Booking_ID,Incomplete_Rides_Reason
From Bookings
Where Incomplete_Rides ="Yes";

#10. List all incomplete rides along with the reason:
Select * From Incomplete_Rides


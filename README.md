🚗 Ola Ride Analysis Project
This project analyzes ride booking data for Ola using Excel, SQL, and Power BI to derive insights from booking trends, vehicle usage, customer ratings, payment methods, and ride value.

📌 Project Objectives
Analyze successful, cancelled, and incomplete rides.

Evaluate revenue sources and payment trends.

Track performance by vehicle type and customer behavior.

Visualize trends in ride distance, ratings, and booking value.

🧰 Tools & Technologies
Tool	Purpose
Excel	Data cleaning and preprocessing
SQL	Advanced data querying and reporting
Power BI	Data visualization and dashboards

📂 Dataset Description
Updated dataset includes the following fields:

Column Name	Description
Date	Ride date
Time	Ride start time
Booking_ID	Unique identifier for each booking
Booking_Status	Status of booking (Successful, Cancelled, etc)
Customer_ID	Unique customer ID
Vehicle_Type	Type of vehicle (Prime Sedan, Mini, etc.)
Pickup_Location	Pickup point
Drop_Location	Drop-off point
V_TAT	Vehicle turnaround time / Proxy for driver rating
C_TAT	Customer turnaround time / Proxy for rating
cancelled_Rides_by_Customer	Cancellation flag by customer (1/0)
cancelled_Rides_by_Driver	Cancellation flag by driver (1/0)
Incomplete_Rides	Indicates if ride is incomplete (1/0)
Incomplete_Rides_Reason	Reason for ride being incomplete
Booking_Value	Total value/fare of the ride
Payment_Method	Method used (UPI, Cash, Card, etc.)
Ride_Distance	Distance covered during the ride (in km)
Driver_Ratings	Actual driver rating
Customer_Rating	Actual customer rating

📊 SQL Analysis Queries (Updated)
sql
Copy
Edit
-- 1. Retrieve all successful bookings:
SELECT * FROM rides WHERE Booking_Status = 'Successful';

-- 2. Average ride distance per vehicle type:
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_Distance
FROM rides
WHERE Booking_Status = 'Successful'
GROUP BY Vehicle_Type;

-- 3. Total number of cancelled rides by customers:
SELECT COUNT(*) AS Cancelled_By_Customers
FROM rides
WHERE cancelled_Rides_by_Customer = 1;

-- 4. Top 5 customers by number of rides:
SELECT Customer_ID, COUNT(*) AS Total_Rides
FROM rides
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

-- 5. Rides cancelled by drivers for personal or car issues:
SELECT COUNT(*) AS Driver_Cancellations
FROM rides
WHERE cancelled_Rides_by_Driver = 1
AND Incomplete_Rides_Reason IN ('Personal', 'Car-related');

-- 6. Max & Min driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) AS Max_Rating, MIN(Driver_Ratings) AS Min_Rating
FROM rides
WHERE Vehicle_Type = 'Prime Sedan' AND Booking_Status = 'Successful';

-- 7. All rides paid using UPI:
SELECT * FROM rides
WHERE Payment_Method = 'UPI';

-- 8. Average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) AS Avg_Customer_Rating
FROM rides
GROUP BY Vehicle_Type;

-- 9. Total booking value of successful rides:
SELECT SUM(Booking_Value) AS Total_Revenue
FROM rides
WHERE Booking_Status = 'Successful';

-- 10. Incomplete rides with reason:
SELECT Booking_ID, Incomplete_Rides_Reason
FROM rides
WHERE Incomplete_Rides = 1;


📈 Power BI Dashboard Insights (Updated)
1. Ride Volume Over Time
Visualize number of bookings over days/weeks/months.

2. Booking Status Breakdown
Pie or donut chart showing Successful, Cancelled, Incomplete rides.

3. Top 5 Vehicle Types by Ride Distance
Bar chart of vehicle types sorted by average or total distance.

4. Average Customer Ratings by Vehicle Type
Grouped bar chart showing customer satisfaction.

5. Cancelled Ride Reasons
Stacked bar chart with driver vs. customer reasons.

6. Revenue by Payment Method
Bar chart summarizing total Booking_Value by Payment_Method.

7. Top 5 Customers by Total Booking Value
Leaderboard using SUM(Booking_Value) grouped by Customer_ID.

8. Ride Distance Distribution Per Day
Histogram showing number of rides by distance intervals per day.

9. Driver Ratings Distribution
Box plot or histogram of Driver_Ratings.

10. Customer vs. Driver Ratings
Side-by-side bar chart comparing Customer_Rating and Driver_Ratings.


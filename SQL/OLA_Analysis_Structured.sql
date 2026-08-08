/* ============================================================
   OLA DATA ANALYST PROJECT - SQL FILE (Structured)
   Source: User's original SQL (docx) + Project Question Set (pdf)
   ============================================================ */


/* ------------------------------------------------------------
   SECTION 1: DATABASE & TABLE CREATION
------------------------------------------------------------ */

CREATE DATABASE Ola;

-- USE Ola;   -- (uncomment if your SQL client needs an explicit USE statement)

CREATE TABLE Bookings (
    Date                        DATE,
    Time                        TIME,
    Booking_ID                  VARCHAR(20) PRIMARY KEY,
    Booking_Status              VARCHAR(30),
    Customer_ID                 VARCHAR(20),
    Vehicle_Type                VARCHAR(20),
    Pickup_Location             VARCHAR(100),
    Drop_Location                VARCHAR(100),
    V_TAT                       INT,
    C_TAT                       INT,
    Canceled_Rides_by_Customer  VARCHAR(255),
    Canceled_Rides_by_Driver    VARCHAR(255),
    Incomplete_Rides            VARCHAR(10),
    Incomplete_Rides_Reason     VARCHAR(255),
    Booking_Value               INT,
    Payment_Method               VARCHAR(20),
    Ride_Distance                INT,
    Driver_Ratings               DECIMAL(2,1),
    Customer_Rating              DECIMAL(2,1)
);


/* ------------------------------------------------------------
   SECTION 2: IMPORT CSV DATA INTO TABLE
------------------------------------------------------------ */

COPY Bookings (
    Date, Time, Booking_ID, Booking_Status, Customer_ID,
    Vehicle_Type, Pickup_Location, Drop_Location, V_TAT, C_TAT,
    Canceled_Rides_by_Customer, Canceled_Rides_by_Driver,
    Incomplete_Rides, Incomplete_Rides_Reason,
    Booking_Value, Payment_Method, Ride_Distance,
    Driver_Ratings, Customer_Rating
)
FROM 'C:\Users\Admin\Downloads\Book1 ola.csv'
DELIMITER ','
CSV HEADER;

-- Check imported data
SELECT * FROM Bookings;


/* ------------------------------------------------------------
   SECTION 3: SQL QUESTIONS & ANSWERS (as Views)
------------------------------------------------------------ */

-- Q1. Retrieve all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT *
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;


-- Q2. Find the average ride distance for each vehicle type
CREATE VIEW AVG_Distance_By_Vehicle AS
SELECT Vehicle_Type,
       AVG(Ride_Distance) AS Avg_Distance
FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Distance_By_Vehicle;


-- Q3. Get the total number of cancelled rides by customers
CREATE VIEW Cancelled_Rides_By_Customer AS
SELECT COUNT(*) AS Total_Cancelled_By_Customer
FROM Bookings
WHERE Booking_Status = 'Cancelled by Customer';

SELECT * FROM Cancelled_Rides_By_Customer;


-- Q4. List the top 5 customers who booked the highest number of rides
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID,
       COUNT(Booking_ID) AS Total_Rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

SELECT * FROM Top_5_Customers;


-- Q5. Get the number of rides cancelled by drivers due to personal and car-related issues
CREATE VIEW Cancelled_By_Driver_Personal_Car AS
SELECT COUNT(Canceled_Rides_by_Driver) AS Total_Cancelled
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Cancelled_By_Driver_Personal_Car;


-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings
CREATE VIEW Prime_Sedan_Rating_Range AS
SELECT MAX(Driver_Ratings) AS Maximum_Rating,
       MIN(Driver_Ratings) AS Minimum_Rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Prime_Sedan_Rating_Range;


-- Q7. Retrieve all rides where payment was made using UPI
CREATE VIEW UPI_Payments AS
SELECT *
FROM Bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payments;


-- Q8. Find the average customer rating per vehicle type
CREATE VIEW AVG_Customer_Rating_By_Vehicle AS
SELECT Vehicle_Type,
       AVG(Customer_Rating) AS Avg_Customer_Rating
FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Customer_Rating_By_Vehicle;


-- Q9. Calculate the total booking value of rides completed successfully
CREATE VIEW Total_Successful_Booking_Value AS
SELECT SUM(Booking_Value) AS Total_Successful_Value
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Total_Successful_Booking_Value;


-- Q10. List all incomplete rides along with the reason
CREATE VIEW Incomplete_Rides_List AS
SELECT Booking_ID,
       Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_List;


/* ============================================================
   END OF FILE
   ============================================================ */

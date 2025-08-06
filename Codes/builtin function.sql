-- 1. STRING FUNCTION --
-- Upper() Convert to Uppercase
-- Retrieve all passenger names in uppercase.
SELECT pass_id, UPPER(pass_name) AS passenger_name_uppercase 
FROM Passenger;
-- Lower() Convert to Lowercase
-- Retrieve all train names in lowercase.
SELECT train_id, LOWER(train_name) AS train_name_lowercase 
FROM Trains;
-- Length() Find Length of a String
-- Find the length of passenger names.
SELECT pass_id, pass_name, LENGTH(pass_name) AS name_length 
FROM Passenger;
-- Concat() Concatenate Two Strings
-- Retrieve full details of passengers (Name + Age).
SELECT pass_id, CONCAT(pass_name, ' (', pass_age, ' years)') AS passenger_details 
FROM Passenger;
-- Substring() Extract Part of a String
-- Retrieve first 3 characters of each train name.
SELECT train_id, train_name, SUBSTRING(train_name, 1, 3) AS short_name 
FROM Trains;

-- 2. AGGREGATE FUNCTION --
-- Count() Count Number of Records
-- How many passengers have booked tickets?
SELECT COUNT(pass_id) AS total_passengers FROM Passenger;
-- Sum() Calculate Total Amount Paid
-- What is the total revenue generated from ticket bookings?
SELECT SUM(pay_amount) AS total_revenue FROM Payment;
-- Avg() Find Average Ticket Price
-- What is the average amount paid per booking?
SELECT AVG(pay_amount) AS average_ticket_price FROM Payment;
-- Max() Find Maximum Ticket Price
-- What is the highest ticket price paid by a passenger?
SELECT MAX(pay_amount) AS highest_ticket_price FROM Payment;
-- Min() Find Minimum Ticket Price
-- What is the lowest ticket price paid by a passenger?
SELECT MIN(pay_amount) AS lowest_ticket_price FROM Payment;

-- 3. MATH FUNCTION --
-- ABS() – Absolute Value
-- Find the absolute difference between the highest and lowest ticket prices.
SELECT ABS(MAX(pay_amount) - MIN(pay_amount)) AS absolute_difference 
FROM Payment;
-- CEIL() – Round Up to the Nearest Integer
-- Round up the average ticket price to the nearest whole number.
SELECT CEIL(AVG(pay_amount)) AS rounded_avg_price FROM Payment;
-- FLOOR() – Round Down to the Nearest Integer
-- Round down the average ticket price to the nearest whole number.
SELECT FLOOR(AVG(pay_amount)) AS floored_avg_price FROM Payment;
-- ROUND() – Round to a Specific Decimal Place
-- Round the average ticket price to two decimal places.
SELECT ROUND(AVG(pay_amount), 2) AS rounded_avg_price FROM Payment;
-- POWER() – Exponential Calculation
-- Calculate square of the lowest ticket price.
SELECT POWER(MIN(pay_amount), 2) AS squared_min_price FROM Payment;
-- SQRT() – Square Root Calculation
-- Find the square root of the highest ticket price.
SELECT SQRT(MAX(pay_amount)) AS sqrt_max_price FROM Payment;

-- GROUP BY and HAVING --
-- Find user that have  booked more than 2 passengers.
SELECT user_id, COUNT(pass_id) AS total_passengers
FROM Passenger
GROUP BY user_id
HAVING COUNT(pass_id) > 2;



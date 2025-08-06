-- 1. Arithmetic Operators -- 
-- 1) Retrieve the total amount paid by adding 100 to each payment amount.
select *,pay_amount+100 as Total_amount from payment;
-- 2) This subtracts 5 from the available train tickets 
-- (tran_tckt_avail) and displays the remaining tickets for each train.
SELECT train_tckt_avail - 5 AS remaining_tickets FROM Trains;
-- 3) Display the double of each passenger’s age.
select pass_age*2 as double_age from passenger;
-- 4) Retrieve the half of each payment amount for reference
select pay_amount/2 from payment;
-- 5) Checks whether a passenger's age (pass_age) is even or odd 
SELECT pass_id, pass_age, pass_age % 2 AS age_remainder  
FROM Passenger;

-- 2. Comparison Operators --
-- = (Equal to)
SELECT * FROM User WHERE user_id = 101;
-- != or <> (Not equal to) 
SELECT * FROM Trains WHERE train_type != 'AC';
-- > (Greater than)
SELECT * FROM Passenger WHERE pass_age > 30;
-- < (Less than)
SELECT * FROM Booking WHERE book_date < '2025-03-10';
-- >= (Greater than or equal to)
SELECT * FROM Payment WHERE pay_amount >= 1000;
-- <= (Less than or equal to)
SELECT * FROM Passenger WHERE pass_age <= 18;

-- 3. Logical Operators --
-- AND (Both conditions must be true)
SELECT * FROM Payment WHERE pay_method = 'Credit Card' AND pay_status = 'Success';
-- OR (At least one condition must be true)
SELECT * FROM Booking WHERE book_status = 'Confirmed' OR book_status = 'Pending';
-- NOT (Negates a condition)
SELECT * FROM Trains WHERE NOT train_type = 'Non-AC';

-- 4. Pattern Matching Operators --
-- LIKE (Pattern matching)
SELECT * FROM User WHERE user_name LIKE 'A%';
-- IN (Matches a list of values)
SELECT * FROM Booking WHERE book_status IN ('Confirmed', 'Pending');
-- BETWEEN (Selects values in a range)
SELECT * FROM Payment WHERE pay_amount BETWEEN 500 AND 2000;
-- CASE (Follows condition statements)
SELECT pass_name, 
       CASE 
           WHEN pass_name LIKE 'A%' THEN 'Starts with A'
           WHEN pass_name LIKE '%a' THEN 'Ends with a'
           ELSE 'Other'
       END AS Name_Category
FROM Passenger;

-- 5. Null Operators --
-- IS NULL (Checks for NULL values) 
SELECT * FROM Passenger WHERE pass_gender IS NULL;
-- IS NOT NULL (Checks for NOT NULL values) 
SELECT * FROM User WHERE user_email IS NOT NULL;

-- Order by --
-- Retrieve all passengers sorted by age in descending order.
SELECT pass_id, pass_name, pass_age, pass_gender 
FROM Passenger 
ORDER BY pass_age DESC;
-- Retrieve all payment sorted by payment amount in ascending order.
select * from payment order by pay_amount asc;

-- DISTINCT --
-- Retrieve all unique class types from the passenger table.
SELECT DISTINCT class_type FROM passenger;

-- LIMIT --
-- Fetch only the first 5 records from the User table.
SELECT user_id, user_name, user_email FROM User LIMIT 5;


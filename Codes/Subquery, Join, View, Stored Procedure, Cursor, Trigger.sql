-- SUBQUERY --
-- Retrieve the names of passengers who have booked FirstAC class tickets.
SELECT pass_name 
FROM Passenger 
WHERE book_id IN (
    SELECT book_id FROM Booking WHERE class_type = 'FirstAC'
);

-- Join --
-- Fetch the passenger names, their seat numbers, and the train they booked.
SELECT p.pass_name, p.seat_num, t.train_name
FROM Passenger p
JOIN Booking b ON p.book_id = b.book_id
JOIN Trains t ON b.train_id = t.train_id;

-- View --
-- Create a view to show available seats for each train with their current booking status.
CREATE VIEW AvailableTrainSeats AS
SELECT t.train_id, t.train_name, t.train_num, t.train_type, t.train_tckt_avail - COUNT(b.book_id) AS available_seats
FROM Trains t
LEFT JOIN Booking b ON t.train_id = b.train_id
GROUP BY t.train_id;
select * from AvailableTrainSeats;

-- Stored Procedure --
-- Create a Stored Procedure to book a train ticket by inserting a new record into the Booking table.
DELIMITER //
CREATE PROCEDURE BookTicket(
	IN p_book_id INT,
    IN p_user_id INT,
    IN p_train_id INT,
    IN p_seat_num VARCHAR(10),
    IN p_book_date DATETIME,
    IN p_book_status VARCHAR(50)
)
BEGIN
    INSERT INTO Booking (book_id,user_id, train_id, book_status, seat_num, book_date)
    VALUES (p_book_id,p_user_id, p_train_id, p_book_status, p_seat_num, p_book_date);
END //
DELIMITER ;
CALL BookTicket(1016,101, 501, 'A1-10', '2025-02-25', 'Confirmed');
drop procedure BookTicket;
select * from payment;

-- Stored Function --
-- Create a Stored Function that calculates the total payment made by a specific user booking.
DELIMITER //

CREATE FUNCTION GetTotalPayment(bookID INT) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(pay_amount) INTO total
    FROM Payment
    WHERE book_id = bookID;

    RETURN IFNULL(total, 0);
END //

DELIMITER ;

SELECT GetTotalPayment(1002) AS Total_Payment;

 -- CURSOR --
 -- Create a Cursor to fetch and display all train names one by one.
DELIMITER //
CREATE PROCEDURE GetAllTrains()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE g_train_name VARCHAR(100);
    -- Declare cursor
    DECLARE train_cursor CURSOR FOR
    SELECT train_name FROM Trains;
    -- Declare exit handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN train_cursor;
    read_loop: LOOP
        FETCH train_cursor INTO g_train_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT g_train_name;
    END LOOP;
    CLOSE train_cursor;
END //
DELIMITER ;

CALL GetAllTrains();

-- TRIGGER --
-- Create a Trigger to when booking may cancelled or confirmed it reflect in to new table.
CREATE TABLE Book_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    train_id int,
    book_status VARCHAR(50),
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //
CREATE TRIGGER Booking_Update_Trigger
AFTER UPDATE ON Booking
FOR EACH ROW
BEGIN
    INSERT INTO Book_log (book_id, train_id, book_status)
    VALUES (OLD.book_id, OLD.train_id, NEW.book_status);
END //
select * from book_log;
select * from booking;
DELIMITER ;
update booking set book_status="Cancelled" where book_id = 1004;
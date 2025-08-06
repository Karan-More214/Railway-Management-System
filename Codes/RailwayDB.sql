create database Railway;
drop database railway;

use railway;

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_mobile VARCHAR(15) UNIQUE NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_address VARCHAR(100) NOT NULL
);

desc User;

INSERT INTO User (user_id, user_name, user_mobile, user_email, user_address) VALUES
(101, 'Amit Kumar', '9876543210', 'amit@example.com', 'Delhi'),
(102, 'Priya Sharma', '9876543211', 'priya@example.com', 'Mumbai'),
(103, 'Arjun Mehta', '9876543212', 'arjun@example.com', 'Bangalore'),
(104, 'Sneha Patel', '9876543213', 'sneha@example.com', 'Kolkata'),
(105, 'Rahul Singh', '9876543214', 'rahul@example.com', 'Jaipur'),
(106, 'Ananya Nair', '9876543215', 'ananya@example.com', 'Kochi'),
(107, 'Vijay Yadav', '9876543216', 'vijay@example.com', 'Patna'),
(108, 'Rajesh Verma', '9876543217', 'rajesh@example.com', 'Chennai'),
(109, 'Ritu Sharma', '9876543218', 'ritu@example.com', 'Pune'),
(110, 'Sanjay Gupta', '9876543219', 'sanjay@example.com', 'Hyderabad');
select * from User;

CREATE TABLE Login (
    login_id INT PRIMARY KEY,
    user_id INT,  -- Foreign Key referencing User(user_id)
    login_username VARCHAR(255) UNIQUE NOT NULL,
    user_password varbinary(255) NOT NULL,
    login_role_id INT,
    constraint ULFK foreign key(user_id) references User(user_id),
    constraint RLFK foreign key(login_role_id) references Role(role_id)
);

desc Login;

INSERT INTO Login (login_id, user_id, login_username, user_password, login_role_id) VALUES
(1, 101, 'amit_kumar', 'pass123', 2),
(2, 102, 'priya_sharma', 'pass456', 2),
(3, 103, 'arjun_mehta', 'pass789', 1),
(4, 104, 'sneha_patel', 'pass159', 2),
(5, 105, 'rahul_singh', 'pass753', 2),
(6, 106, 'ananya_nair', 'pass987', 2),
(7, 107, 'vijay_yadav', 'pass852', 2),
(8, 108, 'rajesh_verma', 'pass321', 2),
(9, 109, 'ritu_sharma', 'pass654', 2),
(10, 110, 'sanjay_gupta', 'pass987', 2);
select * from Login;

CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    role_desc VARCHAR(100) NOT NULL
);

desc Role;

INSERT INTO Role (role_id, role_name, role_desc) VALUES
(1, 'Admin', 'System admin'),
(2, 'Passenger', 'Regular user');
select * from Role;

CREATE TABLE Trains (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    train_num INT UNIQUE NOT NULL,
    train_desc VARCHAR(100) not null,
    train_type VARCHAR(50) not null,
    train_tckt_avail INT not null,
    train_arrival DATETIME not null
);

desc Trains;
drop table Trains;

INSERT INTO Trains (train_id, train_name, train_num, train_desc, train_type, train_tckt_avail, train_arrival) VALUES
(501, 'Rajdhani Exp', 12301, 'Fast Service', 'AC', 50, '2025-03-10 10:00:00'),
(502, 'Duronto Exp', 12269, 'High Speed', 'AC', 30, '2025-03-11 12:00:00'),
(503, 'Shatabdi Exp', 12010, 'Express Train', 'AC', 40, '2025-03-12 08:00:00'),
(504, 'Garib Rath', 12815, 'Budget Train', 'AC', 20, '2025-03-13 09:00:00'),
(505, 'Intercity Exp', 12440, 'Medium Speed', 'Non-AC', 100, '2025-03-14 06:00:00'),
(506, 'Tejas Exp', 22119, 'Luxury Train', 'AC', 60, '2025-03-15 07:30:00'),
(507, 'Howrah Exp', 12839, 'Long Route', 'AC', 25, '2025-03-16 14:00:00'),
(508, 'Tamil Nadu Exp', 12621, 'Express Train', 'AC', 40, '2025-03-17 10:00:00'),
(509, 'Deccan Queen', 12123, 'Luxury Train', 'AC', 20, '2025-03-18 07:00:00'),
(510, 'Charminar Exp', 12760, 'Superfast', 'AC', 30, '2025-03-19 18:00:00');
select * from Trains;

drop table Booking;
CREATE TABLE Booking (
    book_id INT primary key,
    user_id INT not null,  -- Foreign Key referencing User(user_id)
    train_id INT not null, -- Foreign Key referencing Trains(tran_id)
    book_status VARCHAR(50) not null,
    seat_num VARCHAR(100) not null,
    book_date DATETIME not null,
    constraint UBFK foreign key(user_id) references User(user_id),
    constraint TBFK foreign key(train_id) references Trains(train_id)
);

desc Booking;

INSERT INTO Booking (book_id, user_id, train_id, book_status, seat_num, book_date) VALUES
(1001, 101, 501, 'Confirmed', 'A1-05,6', '2025-03-08'),
(1002, 102, 502, 'Confirmed', 'B2-10', '2025-03-09'),
(1003, 103, 503, 'Confirmed', 'C3-15', '2025-03-10'),
(1004, 104, 504, 'Confirmed', 'D1-20', '2025-03-11'),
(1005, 105, 505, 'Confirmed', 'E4-25, E4-26', '2025-03-12'),
(1006, 106, 506, 'Confirmed', 'F5-30', '2025-03-13'),
(1007, 107, 507, 'Confirmed', 'G6-35', '2025-03-14'),
(1008, 108, 508, 'Confirmed', 'H1-10', '2025-03-15'),
(1009, 109, 509, 'Confirmed', 'I2-15,16', '2025-03-16'),
(1010, 110, 510, 'Confirmed', 'J5-20,21,22', '2025-03-17');
select * from Booking;

CREATE TABLE Passenger (
    pass_id INT PRIMARY KEY,
    book_id INT not null,  -- Foreign Key referencing Booking(book_id)
    user_id INT not null,  -- Foreign Key referencing User(user_id)
    pass_name VARCHAR(255) not null,
    pass_age INT not null,
    pass_gender enum("Male","Female"),
    seat_num VARCHAR(10) not null,
    coach_num VARCHAR(10) not null,
    class_type VARCHAR(50) not null,
    constraint foreign key(book_id) references Booking(book_id),
    constraint Foreign Key(user_id) references User(user_id)
);

desc Passenger;

INSERT INTO Passenger (pass_id, book_id, user_id, pass_name, pass_age, pass_gender, seat_num, coach_num, class_type) VALUES
(201, 1001, 101, 'Amit Kumar', 30, 'Male', 'A1-05', 'A1', 'Sleeper'),
(202, 1001, 101, 'Sunita Kumar', 28, 'Female', 'A1-06', 'A1', 'Sleeper'),
(203, 1002, 102, 'Priya Sharma', 29, 'Female', 'B2-10', 'B2', 'SecondAC'),
(204, 1003, 103, 'Arjun Mehta', 35, 'Male', 'C3-15', 'C3', 'FirstAC'),
(205, 1004, 104, 'Sneha Patel', 40, 'Female', 'D1-20', 'D1', 'Economy'),
(206, 1005, 105, 'Rahul Singh', 42, 'Male', 'E4-25', 'E4', 'Sleeper'),
(207, 1005, 105, 'Kiran Singh', 38, 'Female', 'E4-26', 'E4', 'Sleeper'),
(208, 1006, 106, 'Ananya Nair', 26, 'Female', 'F5-30', 'F5', 'ThirdAC'),
(209, 1007, 107, 'Vijay Yadav', 45, 'Male', 'G6-35', 'G6', 'SecondAC'),
(210, 1008, 108, 'Rajesh Verma', 50, 'Male', 'H1-10', 'H1', 'FirstAC'),
(211, 1009, 109, 'Ritu Sharma', 34, 'Female', 'I2-15', 'I2', 'SecondAC'),
(212, 1009, 109, 'Aditya Sharma', 6, 'Male', 'I2-16', 'I2', 'SecondAC'),
(213, 1010, 110, 'Sanjay Gupta', 38, 'Male', 'J5-20', 'J5', 'Sleeper'),
(214, 1010, 110, 'Meera Gupta', 35, 'Female', 'J5-21', 'J5', 'Sleeper'),
(215, 1010, 110, 'Aryan Gupta', 10, 'Male', 'J5-22', 'J5', 'Sleeper');
select * from Passenger;

CREATE TABLE Payment (
    pay_id INT PRIMARY KEY,
    book_id INT,  -- Foreign Key referencing Booking(book_id)
    pay_status VARCHAR(50) not null,
    pay_method VARCHAR(50) not null,
    pay_amount DECIMAL(10,2) not null,
    pay_date DATETIME not null,
    constraint foreign key(book_id) references Booking(book_id)
);

desc Payment;

INSERT INTO Payment (pay_id, book_id, pay_status, pay_method, pay_amount, pay_date) VALUES
(301, 1001, 'Success', 'UPI', 450.00, '2025-03-08'),
(302, 1002, 'Success', 'Net Banking', 1200.00, '2025-03-09'),
(303, 1003, 'Success', 'Debit Card', 5000.00, '2025-03-10'),
(304, 1004, 'Success', 'Credit Card', 750.00, '2025-03-11'),
(305, 1005, 'Success', 'Cash', 300.00, '2025-03-12'),
(306, 1006, 'Success', 'UPI', 2000.00, '2025-03-13'),
(307, 1007, 'Success', 'Credit Card', 1500.00, '2025-03-14'),
(308, 1008, 'Success', 'Net Banking', 4500.00, '2025-03-15'),
(309, 1009, 'Success', 'UPI', 1600.00, '2025-03-16'),
(310, 1010, 'Success', 'Credit Card', 500.00, '2025-03-17');
select * from Payment;
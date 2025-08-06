use railway;
select * from booking;
select * from Trains;

-- Insert --
-- 1) Insert a new train into the Trains table with Train Name "Shatabdi Express",
-- Number "12001", Type "AC", and availability of 100 seats.
insert into Trains(train_id,train_name,train_num,train_desc,train_type,train_tckt_avail,train_arrival) 
values (511,"Shatabdi Express",12001,"Superfast","AC",100,current_timestamp());
-- 2) Add a new booking for a user on "Rajdhani Express" for the seat "A2-10".
insert into Booking(book_id,user_id,train_id,book_status,seat_num,book_date) 
values(1011,110,501,"Confirmed","A2-10",current_timestamp());

-- Delete --
-- 1) delete form train table where train number is "12001".
delete from Trains where train_num=12001;
-- 2) delete from booking tabe where the seat number is "A2-10".
delete from Booking where seat_num="A2-10";

-- Update --
-- Change the booking status of a user with book_id = 1003 to "Cancelled".
update Booking set book_status ="Cancelled" where book_id =1003;
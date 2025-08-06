-- Rollback --

set @@autocommit = 0;
select @@autocommit;
set @@autocommit = 1;
select @@autocommit;
update Booking set book_status ="Cancelled" where book_status ="Confirmed";
select * from booking;

rollback;
select * from booking;

update Booking set book_status ="Confirmed" where book_id=1003;
commit;
select * from booking;
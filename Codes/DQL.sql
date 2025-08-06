-- Select --
-- 1) List all passengers whose pass_gender is "Female".
select * from passenger where pass_gender = "Female";
-- 2) Display book_id, pay_status, pay_amount, pay_date 
-- details where the pay_method is "Credit Card".
select book_id, pay_status, pay_amount, pay_date 
from payment where pay_method = "Credit Card";
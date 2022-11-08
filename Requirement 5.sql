#Part 5 (creates function and view) 
#this calculates the sales tax 
delimiter //
create function STfunct (urev dec(10,2))
RETURNS dec(10,2)

deterministic
begin
   declare Tax dec(10,2);
   set Tax = .08*urev;
   return Tax;
END;//

#this caculates the shipping charges 
delimiter // 
create function Shipping (urev dec(10,2))
RETURNS dec(10,2)

deterministic
begin
   declare Cost dec(10,2);
   if urev < 20 then set Cost = 7.95;
   elseif urev >= 20 and urev < 50 then set Cost = 10.95;
   elseif urev >= 50 and urev < 100 then set Cost = 20.95;
   else set Cost = 24.95;
   end if;
   return Cost;
END; //
delimiter ;
drop view StoreSales;

#View that shows Customer order summery
create view StoreSales as
select  cus_name as Customer, Customer_account.cus_id as ID, price, STfunct(price) as SalesTax, Shipping(price) as ShipingPrice
from Customer_account 
join link_customer_order on Customer_account.cus_id = link_customer_order.cus_id
join customer_order on link_customer_order.cus_order_id = customer_order.cus_order_id
order by Customer_account.cus_id;
select* from StoreSales;

select * from link_customer_order;
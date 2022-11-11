###########################Triggers#####################################################
#This trigger checks to make sure that there are no negative prices being entered for the products
delimiter //
Create Trigger PriceCheck
before insert on product for each row
begin 
if new.price <= 0 AND new.product_id = 1 then set new.price = 1.00;
elseif new.price <= 0 AND new.product_id = 2 then set new.price = 2.00;
elseif new.price <= 0 AND new.product_id = 3 then set new.price = 3.00;
elseif new.price <= 0 AND new.product_id = 4 then set new.price = 4.00;
elseif new.price <= 0 AND new.product_id = 5 then set new.price = 5.00;
end if;
end//

#This trigger checks to make sure that any inserted quantities are not negative
delimiter //
Create Trigger ProductCheck
before insert on Stock for each row
begin 
if new.quantity < 0 then set new.quantity = 0;
end if;
end//
delimiter ;

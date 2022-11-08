# 5 quaries

# manager at store_id 1 wants to know which employees work during the week
select * from the_schedule join employee
where store_id = 1
order by emp_name ASC;

#manager from store_id 1 wants to know the stock at store_id 1
select product.product_id, product.prod_name, stock.quantity
from product
join stock on product.product_id = stock.product_id
where stock.store_id = 1;

#CEO 1 wants to know how much revenue each store made each month of 2020
select monthname(customer_order.date_of_order) as month, customer_order.store_id, (reciept.quantity * product.price) as revenue
from customer_order
join reciept on customer_order.reciept_id = reciept.reciept_id
join product on product.product_id = reciept.product_id
where customer_order.date_of_order between "2020-01-01" and "2020-12-31"
group by month(customer_order.date_of_order), customer_order.store_id
order by month(customer_order.date_of_order) ASC, revenue DESC;

#----------------------------------------------------------------
#procedure
#Find how much of every product has been sold and how much money has been made off each product at the given store
# if no store is given show this information for all stores

drop procedure soldproduct;
delimiter //

create procedure soldProduct(idStore int)
	BEGIN
		
        IF ISNULL(idStore) then
        
			select customer_order.store_id, product.product_id, product.prod_name, 
            SUM(reciept.quantity) as quantity, SUM(reciept.quantity * product.price) as revenue
			from reciept
			join product on reciept.product_id = product.product_id
			join customer_order on customer_order.reciept_id = reciept.reciept_id
			group by customer_order.store_id, product.product_id
			order by customer_order.store_id ASC, revenue DESC;
            
        ELSE
			select product_id, prod_name, SUM(reciept.quantity) as quantity, SUM(reciept.quantity * product.price) as revenue
			from reciept
			join product on reciept.product_id = product.product_id
			join customer_order on customer_order.reciept_id = reciept.reciept_id
			where customer_order.store_id = idStore
            group by product.product_id
			order by revenue DESC;
            
		END IF;
    END //
    
delimiter ;
    
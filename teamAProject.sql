DROP SCHEMA IF EXISTS `teamaproject` ;
CREATE SCHEMA IF NOT EXISTS `teamaproject` ;
use teamaproject;

create table store(
	store_id int,
    address varchar(30),
    URL varchar(100),
    primary key (store_id)
);

create table product(
	product_id int,
    price int,
    prod_name varchar(30),
    primary key (product_id)
);

create table stock(
	store_id int,
    product_id int,
    quantity int,
    primary key (store_id, product_id),
    foreign key (store_id) references store(store_id),
    foreign key (product_id) references product(product_id)

);

create table employee(
	emp_id int,
    emp_name varchar(30),
    emp_email varchar(30),
    emp_phone varchar(15),
    emp_position varchar(30),
    emp_salary int,
    emp_hiring_date date,
    emp_termination_date date,
    primary key (emp_id)
);

create table link_employee_store(
	emp_id int,
    store_id int,
    primary key (emp_id),
    foreign key (emp_id) references employee(emp_id),
    foreign key (store_id) references store(store_id)
);

create table the_schedule(
	emp_id int,
    store_id int,
	Monday bool,
    Tuesday bool,
    Wednesday bool,
    Thursday bool,
    Friday bool,
    Saturday bool,
    Sunday bool,
    primary key (emp_id),
    foreign key (store_id) references store(store_id),
	foreign key (emp_id) references employee(emp_id)
);

create table customer_account(
	cus_id int,
    cus_name varchar(30),
    cus_address varchar(30),
    cus_email varchar(30),
    primary key (cus_id)
);

create table reciept(
	reciept_id int,
    product_id int,
    quantity int,
    primary key (reciept_id, product_id),
    Foreign key (product_id) references product(product_id)
);

create table customer_order(
	cus_order_id int,
    store_id int,
    reciept_id int,
    price_of_items int,
    date_of_order date,
    date_of_arrival date,
    primary key (cus_order_id),
    foreign key (store_id) references store(store_id),
    foreign key (reciept_id) references reciept(reciept_id)
);


create table link_customer_order(
	cus_id int,
    cus_order_id int,
    primary key (cus_id, cus_order_id),
    foreign key (cus_id) references customer_account(cus_id),
    foreign key (cus_order_id) references customer_order(cus_order_id)
);


INSERT INTO teamaproject.store (store_id,address,URL)
VALUES(1,'8101 Old Carriage Ct','www.mngrocery.com' );
INSERT INTO teamaproject.store (store_id,address,URL)
VALUES(2,'8000 Lakeland Ave','www.mngrocery.com' );
INSERT INTO teamaproject.store (store_id,address,URL)
VALUES(3,'700 American Blvd E','www.mngrocery.com' );
INSERT INTO teamaproject.store (store_id,address,URL)
VALUES(4,'1644 S Robert St','www.mngrocery.com' );
INSERT INTO teamaproject.store (store_id,address,URL)
VALUES(5,'1752 N Frontage Rd','www.mngrocery.com' );

INSERT INTO product(product_id,price,prod_name)
VALUES(1, 1.00, 'Apple');
INSERT INTO product(product_id,price,prod_name)
VALUES(2, 2.00, 'Bread');
INSERT INTO product(product_id,price,prod_name)
VALUES(3, 3.00 , 'Cereal');
INSERT INTO product(product_id,price,prod_name)
VALUES(4, 4.00, 'Strawberries');
INSERT INTO product(product_id,price,prod_name)
VALUES(5, 5.00, 'Grape');

INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,1,55);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,2,60);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,3,70);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,4,100);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,5,50);

insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (1,'Josh Brown','joshbrown@gmail.com','612-652-4356','Deliver', 18.00, '2021-02-01', null);
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (2,'Paul George','paulgeorge@gmail.com','763-542-6530','Deliver', 18.00, '2021-01-02', null);
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (3,'Larry Carter','larrycarter@gmail.com','651-367-5656','Stocker', 18.00, '2021-01-03', null);
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (4,'Kevin Keegan','kevinkeegan@gmail.com','763-605-8825','Manager', 25.00, '2021-01-04', null);
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (5,'Jacob Porter','jacobporter@gmail.com','612-502-9862','Stocker', 18.00, '2021-01-05', null);

INSERT INTO link_employee_store (emp_id, store_id)
VALUES(1,1);
INSERT INTO link_employee_store (emp_id, store_id)
VALUES(2,1);
INSERT INTO link_employee_store (emp_id, store_id)
VALUES(3,1);
INSERT INTO link_employee_store (emp_id, store_id)
VALUES(4,1);
INSERT INTO link_employee_store (emp_id, store_id)
VALUES(5,1);


INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(1,1, false, true, false, true, false, true, true);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(2,1, true, false, true, false, true, true, false);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(3,1, true, true, false, false, true, false, true);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(4,1,true, true, true, true, true, false, false);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday )
VALUES(5,1,false, false, true, true, false, true, false);

INSERT INTO customer_account (cus_id, cus_name, cus_address, cus_email)
VALUES(1,'Joe Cole', '2676 Vierling Dr.E', 'joecole@gmail.com');
INSERT INTO customer_account (cus_id, cus_name, cus_address, cus_email)
VALUES(2,'Anthony Bush', '270 Hennepin Ave', 'anthonybush@gmail.com');
INSERT INTO customer_account (cus_id, cus_name, cus_address, cus_email)
VALUES(3,'William Rams', '3110 W Lake St', 'williamrams@gmail.com');
INSERT INTO customer_account (cus_id, cus_name, cus_address, cus_email)
VALUES(4,'Michael White', '2211 Riverside Ave', 'michaelwhite@gmail.com');
INSERT INTO customer_account (cus_id, cus_name, cus_address, cus_email)
VALUES(5,'Gabriel Sousa', ' 700 E 7th St', 'gabrielsousa@gmail.com');

INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(1,1,10);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(1,2,20);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(2,2,20);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(2,3,30);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(3,3,30);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(3,4,40);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(4,4,40);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(4,5,50);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(5,5,50);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(5,1,10);

delimiter //
create function order_price (idReciept int)
returns decimal(10,2)
deterministic

	BEGIN
		
        return
        cast((select SUM(reciept.quantity * product.price)
        from reciept
        join product on reciept.product_id = product.product_id
        where reciept_id = idReciept) as decimal(10,2));
        
	END //

delimiter ;

INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price_of_items, date_of_order, date_of_arrival)
VALUES(1,1,1,order_price(1), '2021-01-17', '2021-01-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price_of_items, date_of_order, date_of_arrival)
VALUES(2,1,2,order_price(2), '2021-02-17', '2021-02-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price_of_items, date_of_order, date_of_arrival)
VALUES(3,1,3,order_price(3), '2021-03-17', '2021-03-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price_of_items, date_of_order, date_of_arrival)
VALUES(4,1,4,order_price(4), '2021-04-17', '2021-04-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price_of_items, date_of_order, date_of_arrival)
VALUES(5,1,5,order_price(5), '2021-05-17', '2021-05-17');

INSERT INTO link_customer_order (cus_id,cus_order_id)
VALUES(1,1);
INSERT INTO link_customer_order (cus_id,cus_order_id)
VALUES(2,2);
INSERT INTO link_customer_order (cus_id,cus_order_id)
VALUES(3,3);
INSERT INTO link_customer_order (cus_id,cus_order_id)
VALUES(4,4);
INSERT INTO link_customer_order (cus_id,cus_order_id)
VALUES(5,5);





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

#View that shows Customer order summery
create view StoreSales as
select  cus_name as Customer, Customer_account.cus_id as ID, price_of_items,
STfunct(price_of_items) as SalesTax, Shipping(price_of_items) as ShipingPrice,
STfunct(price_of_items) + Shipping(price_of_items) + price_of_items as Total
from Customer_account 
join link_customer_order on Customer_account.cus_id = link_customer_order.cus_id
join customer_order on link_customer_order.cus_order_id = customer_order.cus_order_id
order by Customer_account.cus_id;

--  queries
# manager at store_id 1 wants to know which employees work during the week
select emp_name, monday, thursday, wednesday, thursday, friday, saturday, sunday
from the_schedule 
join employee on employee.emp_id = the_schedule.emp_id
where store_id = 1
order by employee.emp_name ASC;

#manager from store_id 1 wants to know the stock at store_id 1
select product.product_id, product.prod_name, stock.quantity
from product
join stock on product.product_id = stock.product_id
where stock.store_id = 1;


#CEO 1 wants to know how much revenue each store made each month of 2021
select monthname(customer_order.date_of_order) as month, customer_order.store_id, 
SUM(customer_order.price_of_items + stFunct(customer_order.price_of_items) + shipping(customer_order.price_of_items)) as revenue
from customer_order
join reciept on customer_order.reciept_id = reciept.reciept_id
join product on product.product_id = reciept.product_id
where customer_order.date_of_order between "2021-01-01" and "2021-12-31"
group by month(customer_order.date_of_order), customer_order.store_id
order by month(customer_order.date_of_order) ASC, revenue DESC;


#CEO want to know how know how many customer orders each store has
#manager wants to know how many employees work each day
#manager wants to know how much they need to pay each employee for the week


#----------------------------------------------------------------
#procedure
#Find how much of every product has been sold and how much money has been made off each product at the given store
# if no store is given show this information for all stores

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
			select product.product_id, product.prod_name, SUM(reciept.quantity) as quantity,
            SUM(reciept.quantity * product.price) as revenue
			from reciept
			join product on reciept.product_id = product.product_id
			join customer_order on customer_order.reciept_id = reciept.reciept_id
			where customer_order.store_id = idStore
            group by product.product_id
			order by revenue DESC;
            
		END IF;
    END //
    
delimiter ;
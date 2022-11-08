
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
    primary key (emp_id)
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
    primary key (reciept_id),
    Foreign key (product_id) references product(product_id)
);

create table customer_order(
	cus_order_id int,
    store_id int,
    reciept_id int,
    price int,
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

create table vehicle(
 vehicle_id int,
 store_id int,
 cus_order_id int,
 is_available bool,
 primary key (vehicle_id),
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
VALUES(2, 1.00, 'Bread');
INSERT INTO product(product_id,price,prod_name)
VALUES(3, 4.00 , 'Cereal');
INSERT INTO product(product_id,price,prod_name)
VALUES(4, 2.98, 'Strawberries');
INSERT INTO product(product_id,price,prod_name)
VALUES(5, 3.78, 'Grape');

INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,2,55);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,3,60);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,1,70);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,4,100);
INSERT INTO stock(store_id,product_id, quantity)
VALUES(1,5,50);

insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (1,'Josh Brown','joshbrown@gmail.com','612-652-4356','Deliver', 18.00, '2021-02-01', '2025-02-01');
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (2,'Paul George','paulgeorge@gmail.com','763-542-6530','Deliver', 18.00, '2021-01-15', '2025-01-15');
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (3,'Larry Carter','larrycarter@gmail.com','651-367-5656','Stocker', 18.00, '2021-01-15', '2025-01-15');
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (4,'Kevin Keegan','kevinkeegan@gmail.com','763-605-8825','Manager', 25.00, '2021-01-15', '2025-01-15');
insert into employee(emp_id, emp_name, emp_email,emp_phone,emp_position,emp_salary,emp_hiring_date,emp_termination_date) 
values (5,'Jacob Porter','jacobporter@gmail.com','612-502-9862','Stocker', 18.00, '2021-01-15', '2025-01-15');

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
VALUES(2,2, true, false, true, false, true, true, false);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(3,1, true, true, false, false, true, false, true);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
VALUES(4,1,true, true, true, true, true, true, true);
INSERT INTO the_schedule (emp_id, store_id, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday )
VALUES(5,2,false, false, true, true, false, true, false);

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
VALUES(1,1,2);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(2,2,2);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(3,3,6);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(4,4,1);
INSERT INTO reciept (reciept_id, product_id, quantity)
VALUES(5,5,1);

INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price, date_of_order, date_of_arrival)
VALUES(1,1,1,1.00, '2021-01-17', '2021-01-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price, date_of_order, date_of_arrival)
VALUES(2,1,2,1.00, '2021-01-17', '2021-01-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price, date_of_order, date_of_arrival)
VALUES(3,1,3,4.00, '2021-01-17', '2021-01-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price, date_of_order, date_of_arrival)
VALUES(4,1,4,2.98, '2021-01-17', '2021-01-17');
INSERT INTO customer_order (cus_order_id, store_id, reciept_id, price, date_of_order, date_of_arrival)
VALUES(5,1,5,3.78, '2021-01-17', '2021-01-17');

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

INSERT INTO vehicle (vehicle_id, store_id, cus_order_id, is_available )
VALUES(1,1,1,5);
INSERT INTO vehicle (vehicle_id, store_id, cus_order_id, is_available )
VALUES(2,1,1,4);
INSERT INTO vehicle (vehicle_id, store_id, cus_order_id, is_available )
VALUES(3,1,1,6);
INSERT INTO vehicle (vehicle_id, store_id, cus_order_id, is_available )
VALUES(4,1,1,2);
INSERT INTO vehicle (vehicle_id, store_id, cus_order_id, is_available )
VALUES(5,1,1,1);


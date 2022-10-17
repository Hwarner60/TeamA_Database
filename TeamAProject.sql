
create database TeamAProject;
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
    emp_phone varchar(10),
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
    foreign key (emp_id) references employee(emp_id),
    foreign key (store_id) references store(store_id)
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


create table link_customer_Order(
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


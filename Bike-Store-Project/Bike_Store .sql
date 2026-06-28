use Bike_database;
go

create table customers
(customer_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone varchar(15) not null,
email varchar(30) not null,
street varchar(40) ,
city varchar(15) check (city in ('Rayad','Madina','Macca')),
zip_code int
);

go


 use Bike_database;
 go
 create table orders
(order_id int identity(1,1) primary key,
order_status tinyint not null,
order_date date,
required_date date,
shipping_date date,
customer_id int,
staff_id int,
store_id int,
 constraint orders_customers_fk foreign key(customer_id)
 references customers(customer_id)
 );

 alter table orders
 add constraint orders_staff_fk foreign key(staff_id)
 references staff(staff_id);

 alter table orders
 add constraint orders_store_fk foreign key(store_id)
 references stores(store_id);


 create table staff
 (staff_id int identity(1,1) primary key,
 first_name varchar(20) not null,
 last_name varchar(20) not null,
 phone varchar(15),
 email varchar(20) not null,
 active varchar(10) not null,
 store_id int,
 manager_id int 
 );

 alter table staff
 add constraint staff_store_fk foreign key(store_id)
 references stores(store_id);

 exec sp_rename 'staff','staffs';

 go
 
 create table stores
 (store_id int identity(1,1) primary key,
 store_name varchar(20) not null,
 phone varchar(15),
 email varchar(30) not null,
 city varchar(20) not null,
 street varchar(30) not null,
 zip_code int 
 );
 go
 
 use Bike_database;
 GO

 alter table products
 add constraint brands_products_fk foreign key(brand_id)
 references brands(brand_id);

 use Bike_database;
go 

insert into customers
(customer_id,first_name,last_name,phone,email)
values
(1,'ramy','nabile','01233445566','rn@gmail.com'),
(2,'nour','tamer','5784668494','nt@gmail.com'),
(3,'nermen','sayed','7584658393','ns@gmail.com');

select*from customers

update customers
set phone='0126457837',first_name='hassan',email='hn@gmail.com'
where customer_id=1

update customers
set phone='0124839699'
where customer_id=2
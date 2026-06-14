
use SALES_PRODUCT;

GO
create table product_table
(product_id int primary key,
 product_name varchar(20) not null,
 category varchar(20) not null,
 price decimal (10,2)
 );

 insert into product_table values
 (101,'tablet','electronic',8000),
 (102,'smart watch','electronic',4000),
 (103,'jeans','clothes',360),
 (104,'skirts','clothes',500);

 GO
 create table sales_table
 (order_id int primary key,
 product_id int not null,
 quantity int,
 order_date date
 );

  insert into sales_table values
 (1,101,3,'2025-05-05'),
 (2,102,5,'2025-05-20'),
 (3,103,1,'2025-05-30'),
 (4,104,2,'2025-06-10');

 use SALES_PRODUCT;
GO

create view v_sales_report AS
SELECT
    S.order_id,
    s.order_date,
    s.quantity,
    p.product_name,
    p.category,
    p.price,
    (s.quantity * p.price)as total_sales

from sales_table s join product_table p on s.product_id =p.product_id;
go

update sales_table set quantity=3 where order_id=4;

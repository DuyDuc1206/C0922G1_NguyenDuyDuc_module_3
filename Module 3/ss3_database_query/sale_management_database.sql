create database if not exists sales_management_database;
use quan_ly_ban_hang_ss2;

-- Thêm data cho customer table
insert into customer 
values 
  (1, 'Minh Quan', 10), 
  (2, 'Ngoc Anh', 20), 
  (3, 'Hong Ha', 50);
  
-- Thêm dât cho order table
insert into `order` 
values 
  (1, '2006-03-21', null, 1), 
  (2, '2006-03-23', null, 2), 
  (3, '2006-03-16', null, 1);
  
-- Thêm data cho procuct table
insert into product 
values 
  (1, 'May Giac', 3), 
  (2, 'Tu Lanh', 5), 
  (3, 'Dieu Hoa', 7), 
  (4, 'Qep Dien', 2);
  
-- Thêm data cho order_detail table
insert into order_detail 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (1, 2, 4), 
  (2, 3, 3);
  
select 
  o.order_id, 
  o.order_date, 
  ifnull(
    o.order_total_price, 'chua co gia'
  ) 
from 
  `order` as o;
  
select 
  c.customer_name, 
  p.produc_name 
from 
  `order` as o 
  join customer as c on o.customer_id = c.customer_id 
  join order_detail as od on od.order_id = o.order_id 
  join product p on p.product_id = od.product_id;
  
select 
  c.customer_name 
from 
  customer as c 
where 
  c.customer_id not in (
    select 
      o.customer_id 
    from 
      `order` as o
  );
  
select 
  o.order_id, 
  o.order_date, 
  sum(p.product_price * od.order_QTY) as gia_tien 
from 
  order_detail as od 
  join `order` as o on o.order_id = od.order_id 
  join product as p on p.product_id = od.product_id 
group by 
  o.order_id;

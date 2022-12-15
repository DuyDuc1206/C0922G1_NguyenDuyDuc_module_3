create database if not exists quan_ly_ban_hang;

drop 
  database if exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
  customer_id int auto_increment primary key, 
  customer_name varchar (45), 
  customer_age int
);

create table `order`(
  order_id int auto_increment primary key, 
  order_date date, 
  order_total_price double, 
  customer_id int, 
  foreign key(customer_id) references customer(customer_id)
);

create table product (
  product_id int auto_increment primary key, 
  produc_name varchar(45), 
  product_price double
);

create table order_detail(
  order_id int, 
  product_id int, 
  order_QTY int, 
  primary key(order_id, product_id), 
  foreign key(order_id) references `order`(order_id), 
  foreign key(product_id) references product(product_id)
);

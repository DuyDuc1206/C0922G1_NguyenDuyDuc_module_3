create database if not exists products_management;
drop database if exists products_management;
use products_management;

create table products(
	id int ,
    product_code int ,
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(50),
    product_status varchar(50)
);
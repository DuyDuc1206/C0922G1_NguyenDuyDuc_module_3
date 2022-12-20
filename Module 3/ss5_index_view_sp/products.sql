create database if not exists products_management;
drop database if exists products_management;
use products_management;

create table products(
	id int auto_increment primary key,
    product_code int ,
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(50),
    product_status varchar(50)
);

insert into products values 
	(1,1,'a',2.5,8,'dien thoai','nho'),
	(null,2,'a',5,8,'may tinh','to'),
	(null,3,'c',2.5,8,'quat','lon'),
	(null,4,'d',5.6,8,'ban','go'),
	(null,5,'e',2.5,8,'may giac','new'),
	(null,6,'f',6,8,'xe','old');
    
    -- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
    create index i_unique_index on products(product_code);
    
    -- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
    create index i_composite_index on products(product_name,product_price);
    
    -- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
    explain select * from products where product_code = 2;
    explain select * from products where product_name = 'a' or product_price = 2.5 ;
    
    -- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
    create view w_products as 
    select product_code,product_name,product_price,product_status from products;
    
    select * from w_products;
    
    -- Tiến hành sửa đổi view
    create or replace view w_products as 
    select product_code,product_name,product_description from products where product_code = 1;
    
    select * from w_products;
    
    -- Tiến hành xoá view
    drop view w_products;
    
    -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
    delimiter //
    create procedure get_all_products()
    begin
    select * from products;
    end //
    delimiter ;
    call get_all_products;
    
    -- Tạo store procedure thêm một sản phẩm mới
    delimiter //
    create procedure add_product(in new_id int, new_product_code int, new_product_name varchar(50), new_product_price double, new_product_amount int , new_products_description varchar(50),new_product_status varchar(50))
    begin
    insert into products values (new_id,new_product_code,new_product_name ,new_product_price,new_product_amount,new_products_description,new_product_status);
    end //
    delimiter ;
    
    call add_product(9,10,'A',30000,10,'avb','abv');
    call get_all_products;
    drop procedure add_product;
    
    -- Tạo store procedure sửa thông tin sản phẩm theo id
    delimiter //
     create procedure update_product(in new_product_code int, new_product_name varchar(50), new_id int )
     begin
     update products set product_code = new_product_code , product_name = new_product_name where  id = new_id;
     end //
	delimiter ;
    
    call update_product(111,'abcxyz',2);
    call get_all_products;
    
    -- Tạo store procedure xoá sản phẩm theo id
    delimiter $$
    create procedure delete_product_by_id( in id_delete int)
    begin
    delete from products where id = id_delete;
    end $$
    delimiter ;
    
    call delete_product_by_id(2);
    call get_all_products;
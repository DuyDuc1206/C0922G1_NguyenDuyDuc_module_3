create database if not exists query;
drop database if exists query;
use furama_resort;

select * from customer_type;
select * from customer;
select c.*,ct.customer_type_name from customer as c left join customer_type as ct on ct.customer_type_id = c.customer_type_id ;
select * from customer where customer_id = 1;

select c.*, ct.customer_type_name from customer as c 
join customer_type as ct on c.customer_type_id = ct.customer_type_id 
where customer_name like "% Duc" and address like "% Da Nang" and email = 'thihao07@gmail.com';

delete from customer where customer_id =2;
update customer set 
customer_name = 'a',
date_of_birth ='2020-12-12',
gender = 0, 
id_card = '1212121212',
phone_number = '1231231231',
address = 'dasd',
email='asda',
customer_type_id ='2' 
where customer_id = 2;

insert into `customer` values
	('15', 'Nguyễn Thị Hào', '1970-11-07', 'woman' , '643431213', '0945423362', '23 Nguyễn Hoàng, Đà Nẵng', 'thihao07@gmail.com', '5');
    
-- Facility
select f.*, rt.*,ft.* from facility as f 
left join facility_type as ft on ft.facility_type_id = f.facility_type_id
left join rent_type as rt on rt.rent_type_id = f.rent_type_id;
select * from facility_type;
select * from rent_type;
select * from facility;

delete from facility where id = 1;

set sql_safe_updates = 0;
update facility set facility_name = 'VILLA NEW',
area = 50000,
cost = 3000000,
max_people = 20, 
standard_room = 'Vip Pro',
description_other_convenience = 'Co Nhac',
pool_area = 100, 
number_of_floor=5,
facility_free = 'xe oto',
rent_type_id = 2,
facility_type_id = 2
where facility_id = 3;

insert into `facility`(facility_name,area,cost,max_people,standard_room,description_other_convenience,pool_area,number_of_floor,facility_free,rent_type_id,facility_type_id)
 values
	('1', 'Villa Beach Front', '25000', '1000000', '10', 'vip', 'Có hồ bơi', 500, '4', null, '3', '1');
    
select f.*,rt.*,ft.* from facility as f 
join rent_type as rt on rt.rent_type_id = f.rent_type_id
join facility_type as ft on ft.facility_type_id = f.facility_type_id
where f.facility_name like '% Front'  and f.rent_type_id like 3 and f.facility_type_id like 1;


select e.*,p.*,ed.*,d.* from employee as e 
join position as p on p.position_id = e.position_id
join education_degree as ed on ed.education_degree_id = e.education_degree_id
join division as d on d.division_id = e.division_id;

-- goi tat cả employee
delimiter //
drop procedure if exists get_all_employee;
create procedure get_all_employee()
begin
select e.*,p.*,ed.*,d.*,u.* from employee as e 
join position as p on p.position_id = e.position_id
join education_degree as ed on ed.education_degree_id = e.education_degree_id
join division as d on d.division_id = e.division_id
join `user` as u on u.username = e.username;
end //
delimiter ;
call get_all_employee();

-- xóa employee
delimiter //
drop procedure if exists delete_employee;
create procedure delete_employee(in new_id int)
begin
delete from employee where employee_id = new_id;
end //
delimiter ;
call delete_employee(4);

-- edit employee
delimiter //
drop procedure if exists edit_employee;
create procedure edit_employee(in edit_name varchar(45),
 edit_dob date,
 edit_id_card varchar(45),
 edit_salary double,
 edit_phone_number varchar(45), 
 edit_email varchar(45),
 edit_address varchar(45),
 eidt_position_id int,
 edit_ed_id int,
 edit_division_id int,
 edit_username varchar(45),
 edit_id int)
begin
update  employee set employee_name = edit_name,
 date_of_birth = edit_dob,
 id_card = edit_id_card,
 salary = edit_salary,
 phone_number = edit_phone_number,
 email = edit_email,
 address = edit_address,
 position_id = eidt_position_id,
 education_degree_id = edit_ed_id,
 division_id = edit_division_id,
 username = edit_username
 where employee_id = edit_id;
end //
delimiter ;
call edit_employee( 'Nguyễn Văn Be', '1970-11-07', '456231700', '90000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '1','Duy Duc','3');

-- add employee
delimiter //
drop procedure if exists add_employee;
create procedure add_employee( in add_name varchar(45),
 add_dob date,
 add_id_card varchar(45),
 add_salary double,
 add_phone_number varchar(45), 
 add_email varchar(45),
 add_address varchar(45),
 add_position_id int,
 add_ed_id int,
 add_division_id int,
 add_username varchar(45))
 begin
 insert into employee ( employee_name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username) 
 values (add_name,add_dob,  add_id_card,  add_salary,  add_phone_number,  add_email, add_address, add_position_id, add_ed_id, add_division_id, add_username);
 end //
 delimiter ;
 call add_employee ( 'Nguyễn Văn An', '1970-11-07', '406231786', '10000000', '0971234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1','Duy Duc');

-- search nhiều trường
delimiter //
drop procedure if exists search_employee;
create procedure search_employee(in searchName varchar(45),searchAddress varchar (45), searchPosition varchar(45) )
begin
select e.*, p.*,ed.*,d.*,u.* from employee as e 
join position as p on p.position_id = e.position_id
join education_degree as ed on ed.education_degree_id = e.education_degree_id
join division as d on d.division_id = e.division_id
join `user` as u on u.username = e.username
where e.employee_name like searchName and e.address like searchAddress and e.position_id like searchPosition;
end //
delimiter ;
call search_employee('% Phat','% Đà Nẵng','2');
 
-- lay tat ca user
delimiter //
drop procedure if exists get_all_user;
create procedure get_all_user()
begin
select u.* from user as u;
end //
delimiter ;
call get_all_user();

-- lay tat ca division
delimiter //
drop procedure if exists get_all_division;
create procedure get_all_division()
begin
select d.* from division as d;
end //
delimiter ;
call get_all_division();

-- lay tat ca position
delimiter //
drop procedure if exists get_all_position;
create procedure get_all_position()
begin
select p.* from position as p;
end //
delimiter ;
call get_all_position();

-- lay tat ca education degree
delimiter //
drop procedure if exists get_all_education_degree;
create procedure get_all_education_degree()
begin
select ed.* from education_degree as ed;
end //
delimiter ;
call get_all_education_degree();

-- lay tat ca  contract
select * from contract;
select * from contract_detail;
select * from attach_facility;

delimiter //
drop procedure if exists get_contract;
create procedure get_contract()
begin
select c.*,e.*,ct.*,f.* from contract as c 
join employee as e on e.employee_id = c.employee_id
join customer as ct on ct.customer_id = c.customer_id
join facility as f on f.facility_id = c.facility_id;
end //
delimiter ;
call get_contract;

-- lay tong tien
  delimiter //
  drop procedure if exists get_total_contract;
  create procedure get_total_contract()
  begin
  select 
  c.customer_id, 
  c.customer_name, 
  cct.customer_type_name, 
  ct.contract_id, 
  f.facility_name, 
  ct.start_date, 
  ct.end_date, 
  (
    ifnull(f.cost, 0) + sum(
      ifnull(cd.quantity, 0) * ifnull(af.cost, 0)
    )
  ) as total
from 
  customer as c 
  left join customer_type as cct on c.customer_type_id = cct.customer_type_id
  left join contract as ct on ct.customer_id = c.customer_id
  left join facility as f on f.facility_id = ct.facility_id
  left join contract_detail as cd on cd.contract_id = ct.contract_id 
  left join attach_facility as af on af.attach_facility_id = cd.attach_facility_id
group by 
  ct.contract_id;
  end //
  delimiter ;
  call get_total_contract;

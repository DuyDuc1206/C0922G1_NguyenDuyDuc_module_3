create database if not exists hospital;
drop database if exists hospital;
use hospital;

create table patient (
	patient_id int auto_increment primary key,
    patient_name varchar(45)
);

create table medical_record (
	medical_record_id int auto_increment primary key,
    medical_record_name varchar(45),
    patient_id int,
    hospitalized_date date,
    discharged_date date,
    reason varchar(45),
    foreign key(patient_id) references patient(patient_id)  on delete cascade
);

insert into patient 
values 
	(1,'Nguyen Van Huy'),
    (2,'Ho Van Vien'),
    (3,'Ho Duy Hung'),
    (4,'Ho Doan Hung');
    
insert into medical_record
values
	(1,'MR-3',1,'2020-12-08','2020-07-21','Dau bung'),
	(2,'MR-5',2,'2020-1-08','2020-07-20','Dau dau'),
	(3,'MR-7',3,'2019-12-08','2021-07-21','Benh lau'),
	(4,'MR-8',4,'2020-1-01','2021-07-15','Benh ung thu');
    
   -- get all medical record
delimiter //
drop procedure if exists get_all_medical_record;
create procedure get_all_medical_record()
begin
select mr.*,p.* from medical_record as mr 
join patient as p on p.patient_id = mr.patient_id;
end //
delimiter ;
call get_all_medical_record();

-- delete 
delimiter //
drop procedure if exists delete_medical_record;
create procedure delete_medical_record(in idDelete int)
begin
delete from medical_record where medical_record_id = idDelete;
end //
delimiter ;
call delete_medical_record(1);

-- edit
delimiter //
drop procedure if exists edit_medical_record;
create procedure edit_medical_record (in edit_name varchar(45), edit_patient int,edit_hospitalized_date date,edit_discharged_date date,edit_reason varchar(45),edit_id int)
begin
update medical_record set medical_record_name = edit_name, 
patient_id = edit_patient,
hospitalized_date = edit_hospitalized_date,
discharged_date = edit_discharged_date,
reason=edit_reason
where medical_record_id = edit_id;
end //
delimiter ;
call edit_medical_record('MK-00',2,'2022-12-12','2023-12-12','Dau Lung',2);

-- insert medical record
delimiter //
drop procedure if exists add_medical_record;
create procedure add_medical_record(in add_name varchar(45), add_patient int,add_hospitalized_date date,add_discharged_date date,add_reason varchar(45))
begin
insert into medical_record (medical_record_name,patient_id,hospitalized_date,discharged_date,reason) values
( add_name, add_patient, add_hospitalized_date, add_discharged_date, add_reason);
end //
delimiter ;
call add_medical_record('MR-0000',1,'2019-12-08','2018-07-21','Met Moi');

-- search
delimiter //
drop procedure if exists search_medical_record;
create procedure search_medical_record( in search_name varchar(45))
begin
select mr.*,p.* from medical_record as mr
join patient as p on p.patient_id = mr.patient_id
where mr.medical_record_name like search_name;
end //
delimiter ;
call search_medical_record ("MR%");
 
 -- get all patient
delimiter //
drop procedure if exists get_all_patient;
create procedure get_all_patient()
begin
select * from patient;
end //
delimiter ;
call get_all_patient();
 
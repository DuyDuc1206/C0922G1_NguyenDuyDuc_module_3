create database if not exists case_query_1_to_5;
drop database if exists case_query_1_to_5;
use case_study_database;

-- task 2
select * from nhan_vien
where  character_length(ho_va_ten) <= 15 and (substring_index(ho_va_ten,' ',-1) like 'H%' or substring_index(ho_va_ten,' ',-1) like 'T%' or substring_index(ho_va_ten,' ',-1) like 'K%');

-- task 3
select * from nhan_vien
where ( dia_chi like '%ĐÀ NẴng' or dia_chi like '%Quảng trị') and (year(curdate()) - year(ngay_sinh) between 18 and 50);

-- task 4
select kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat from khach_hang as kh
join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by hd.ma_khach_hang;

-- task 5
select kh.ma_khach_hang, 
kh.ho_ten, 
lk.ten_loai_khach, 
hd.ma_hop_dong,
ldv.ten_loai_dich_vu,
hd.ngay_lam_hop_dong, 
hd.ngay_ket_thuc_hop_dong, 
(ifnull(dv.chi_phi_thue,0)  + ifnull(hdct.so_luong,0)  * ifnull(dvdk.gia,0) ) as tong_tien

create database if not exists case_query_11_to_15;
drop database if exists case_query_11_to_15;
use case_study_database;
  
-- task 11.  Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng 
-- bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  dvdk.* 
from 
  dich_vu_di_kem as dvdk 
  join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
  join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong 
  join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang 
  join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach 
where 
  lk.ten_loai_khach = "Diamond" 
  and (
    kh.dia_chi like "% Vinh" 
    or kh.dia_chi like "% Quảng Ngãi"
  );
  
-- task 12  Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
  hd.ma_hop_dong, 
  nv.ho_va_ten, 
  kh.ho_ten, 
  kh.so_dien_thoai, 
  dv.ten_dich_vu, 
  ifnull(sum(hdct.so_luong),0) as so_luong, 
  hd.tien_dat_coc 
from 
  hop_dong as hd 
  left join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang 
  left join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien 
  left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
where 
  (
    month(hd.ngay_lam_hop_dong) in (10, 11, 12)
  ) 
  and year(hd.ngay_lam_hop_dong) = 2020 
  and hd.ma_dich_vu not in 
  (
  select hd.ma_dich_vu 
  from hop_dong as hd 
  join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
  where ( quarter(ngay_lam_hop_dong) = 1 or quarter(ngay_lam_hop_dong) = 2 ) and year(ngay_lam_hop_dong) = 2021
  )
group by 
  hdct.ma_hop_dong;
  
  -- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
  -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
  select dvdk.* from dich_vu_di_kem as dvdk 
  join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
  where hdct.ma_dich_vu_di_kem = (select max(count(hdct.ma_hop_dong_chi_tiet)) from hop_dong_chi_tiet as hdct 
  join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
  group by hdct.ma_dich_vu_di_kem;
  
create database if not exists case_query_11_to_15;
drop 
  database if exists case_query_11_to_15;
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
  ifnull(
    sum(hdct.so_luong), 
    0
  ) as so_luong, 
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
  and hd.ma_dich_vu not in (
    select 
      hd.ma_dich_vu 
    from 
      hop_dong as hd 
      join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu 
    where 
      (
        quarter(ngay_lam_hop_dong) = 1 
        or quarter(ngay_lam_hop_dong) = 2
      ) 
      and year(ngay_lam_hop_dong) = 2021
  ) 
group by 
  hdct.ma_hop_dong;
  
-- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select 
  dvdk.*, 
  sum(hdct.so_luong) as 'so_luong' 
from 
  dich_vu_di_kem as dvdk 
  join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by 
  ma_dich_vu_di_kem 
having 
  sum(hdct.so_luong) >= all (
    select 
      sum(hdct.so_luong) 
    from 
      hop_dong_chi_tiet as hdct 
    group by 
      ma_dich_vu_di_kem
  );
  
-- task 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select 
  hd.ma_hop_dong, 
  ldv.ten_loai_dich_vu, 
  dvdk.ten_dich_vu_di_kem, 
  count(hdct.ma_dich_vu_di_kem) as so_luong 
from 
  dich_vu_di_kem as dvdk 
  left join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
  left join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong 
  left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
group by 
  hdct.ma_dich_vu_di_kem 
having 
  count(hdct.ma_dich_vu_di_kem) = 1;
  
-- task 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
  nv.ma_nhan_vien, 
  nv.ho_va_ten, 
  td.ten_trinh_do, 
  bp.ten_bo_phan, 
  nv.so_dien_thoai, 
  nv.dia_chi 
from 
  nhan_vien as nv 
  left join trinh_do as td on td.ma_trinh_do = nv.ma_trinh_do 
  left join bo_phan as bp on bp.ma_bo_phan = nv.ma_bo_phan 
  left join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
where 
  year(ngay_lam_hop_dong) in (2020, 2021) 
group by 
  hd.ma_nhan_vien 
having 
  count(hd.ma_nhan_vien) <= 3;

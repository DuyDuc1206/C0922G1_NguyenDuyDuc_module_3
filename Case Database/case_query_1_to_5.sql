create database if not exists case_query_1_to_5;
drop 
  database if exists case_query_1_to_5;
use case_study_database;

-- task 2
-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien 
where 
  character_length(ho_va_ten) <= 15 
  and (
    substring_index(ho_va_ten, ' ',-1) like 'H%' 
    or substring_index(ho_va_ten, ' ',-1) like 'T%' 
    or substring_index(ho_va_ten, ' ',-1) like 'K%'
  );
  
-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang 
where 
  (
    dia_chi like '% Đà Nẵng' 
    or dia_chi like '% Quảng trị'
  ) 
  and (
    year(
      curdate()
    ) - year(ngay_sinh) between 18 
    and 50
  );
  
-- task 4  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  kh.ho_ten, 
  count(hd.ma_khach_hang) as so_lan_dat 
from 
  khach_hang as kh 
  join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang 
  join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach 
where 
  lk.ten_loai_khach = 'Diamond' 
group by 
  hd.ma_khach_hang;
  
-- task 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  lk.ten_loai_khach, 
  hd.ma_hop_dong, 
  dv.ten_dich_vu, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc_hop_dong, 
  (
    ifnull(dv.chi_phi_thue, 0) + sum(
      ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)
    )
  ) as tong_tien 
from 
  khach_hang as kh 
  left join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach 
  left join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang 
  left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by 
  hd.ma_hop_dong;
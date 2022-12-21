create database if not exists case_query_16_to_20;
drop 
  database if exists case_query_16_to_20;
use case_study_database;

-- task 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien as nv 
where 
  nv.ma_nhan_vien not in (
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong as hd 
    where 
      year(hd.ngay_lam_hop_dong) between 2019 
      and 2021
  );
  
-- task 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set 
  sql_safe_updates = 0;
update 
  khach_hang as kh 
set 
  kh.ma_loai_khach = 1 
where 
  kh.ma_khach_hang in (
    select 
      b.ma_khach_hang 
    from 
      (
        select 
          a.ma_khach_hang, 
          sum(tong_tien) as tien 
        from 
          (
            select 
              hd.ma_khach_hang as mkh, 
              (
                ifnull(dv.chi_phi_thue, 0) + sum(
                  ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)
                )
              ) as tong_tien 
            from 
              hop_dong as hd 
              join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
              join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
              join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu 
              join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang whre year(ngay_lam_hop_dong) = 2021 
            group by 
              hd.ma_hop_dong
          ) as a 
          join loai_khach as lk on lk.ma_loai_khach = a.ma_loai_khach 
        where 
          ma_loai_khach = 2 
        group by 
          a.ma_loai_khach
      ) as b 
    where 
      tien > 10000000
  );
  
-- task 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET 
  SQL_SAFE_UPDATES = 0;
delete from 
  khach_hang 
where 
  ma_khach_hang in (
    select 
      ma_khach_hang 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) < 2021
  );
  
-- task 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update 
  dich_vu_di_kem 
set 
  gia = gia * 2 
where 
  ma_dich_vu_di_kem in (
    select 
      ma_dich_vu_di_kem 
    from 
      (
        select 
          dvdk.ma_dich_vu_di_kem, 
          sum(hdct.so_luong) as so_luong 
        from 
          hop_dong as hd 
          join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
          join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
        where 
          year(ngay_lam_hop_dong) = 2020 
        group by 
          hdct.ma_dich_vu_di_kem 
        having 
          sum(hdct.so_luong) > 10
      ) as m
  );
  
-- task 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  ma_nhan_vien as id, 
  ho_va_ten as ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  nhan_vien 
union 
select 
  ma_khach_hang as id, 
  ho_ten as ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  khach_hang;

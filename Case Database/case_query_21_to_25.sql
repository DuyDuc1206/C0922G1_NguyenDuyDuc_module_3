create database if not exists case_query_21_to_25;
drop 
  database if exists case_query_21_to_25;
use case_study_database;

-- task 21.  Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
--  và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
insert into hop_dong 
values 
  (
    13, '2019-12-12', '2021-12-08', 0, 
    11, 2, 4
  );
insert into nhan_vien 
values 
  (
    11, 'Nguyễn Duy Duc', '1970-11-07', 
    '456231786', 10000000, '0901234121', 
    'annguyen@gmail.com', '295 Hải Châu , Đà Nẵng', 
    1, 3, 1
  );
create view v_nhan_vien as 
select 
  nv.* 
from 
  nhan_vien as nv 
  join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
where 
  nv.dia_chi like '% Hải Châu %' 
  and ngay_lam_hop_dong = 2019 - 12 - 12;
select 
  * 
from 
  v_nhan_vien;
drop 
  view v_nhan_vien;
  
-- task 22.  Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update 
  v_nhan_vien 
set 
  dia_chi = '% Liên Chiểu';
  
-- task 23.  Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter // create procedure sp_xoa_khach_hang(in delete_id int) begin 
delete from 
  khach_hang 
where 
  ma_khach_hang = delete_id;
end // delimiter;
call sp_xoa_khach_hang(11);
select 
  * 
from 
  khach_hang;
  
-- task 24.  Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính 
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter // 
drop 
  procedure if exists sp_them_moi_hop_dong // create procedure sp_them_moi_hop_dong(
    in ma_hop_dong_p int, ngay_lam_hop_dong_p date, 
    ngay_ket_thuc_hop_dong_p date, tien_dat_coc_p double, 
    ma_nhan_vien_p int, ma_khach_hang_p int, 
    ma_dich_vu_p int
  ) begin insert into hop_dong 
values 
  (
    ma_hop_dong_p, ngay_lam_hop_dong_p, 
    ngay_ket_thuc_hop_dong_p, tien_dat_coc_p, 
    ma_nhan_vien_p, ma_khach_hang_p, 
    ma_dich_vu_p
  );
end // delimiter;
call sp_them_moi_hop_dong(
  16, '2020-08-30', '2022-03-23', 122.3, 
  3, 5, 1
);



-- task 25.  Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
create table history_hop_dong(
  row_hop_dong int, update_date datetime
);
delimiter // 
create trigger tr_xoa_hop_dong 
after 
  delete on hop_dong for each row begin insert into history_hop_dong 
values 
  (
    (
      select 
        count(ma_hop_dong) 
      from 
        hop_dong
    ), 
    now()
  );
end // 
delimiter ;
drop 
  trigger tr_xoa_hop_dong;
delete from 
  hop_dong 
where 
  ma_hop_dong = 4;
select 
  * 
from 
  history_hop_dong;
select 
  * 
from 
  hop_dong;
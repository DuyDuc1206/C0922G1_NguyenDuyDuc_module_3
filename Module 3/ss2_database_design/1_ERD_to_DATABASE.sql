create database if not exists ss2_material;

drop 
  database if exists ss2_material;
use ss2_material;

create table phieu_xuat (
  so_phieu_xuat int auto_increment primary key, 
  ngay_xuat date
);

create table vat_tu (
  ma_vat_tu int auto_increment primary key, 
  ten_vat_tu varchar(50)
);

create table chi_tiet_phieu_xuat (
  so_phieu_xuat int, 
  ma_vat_tu int, 
  don_gia_xuat double, 
  so_luong_xuat int, 
  primary key(so_phieu_xuat, ma_vat_tu), 
  foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
  so_phieu_nhap int auto_increment primary key, 
  ngay_nhap date
);

create table chi_tiet_phieu_nhap(
  so_phieu_nhap int, 
  ma_vat_tu int, 
  don_gia_nhap double, 
  so_luong_nhap int, 
  primary key(so_phieu_nhap, ma_vat_tu), 
  foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_cap(
  ma_nha_cung_cap int primary key, 
  ten_nha_cung_cap varchar(45) unique, 
  dia_chi varchar(45)
);

create table dien_thoai(
  id int auto_increment primary key, 
  sdt varchar(45), 
  ma_nha_cung_cap int, 
  foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
  so_dat_hang int auto_increment primary key, 
  ngay_dat_hang date, 
  ma_nha_cung_cap int, 
  foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_don_dat_hang (
  so_dat_hang int, 
  ma_vat_tu int, 
  so_luong_vat_tu int, 
  primary key(so_dat_hang, ma_vat_tu), 
  foreign key(so_dat_hang) references don_dat_hang(so_dat_hang), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

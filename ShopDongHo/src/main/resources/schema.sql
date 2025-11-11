-- 
CREATE TABLE ChiTietHoaDon (
  MaChiTietHoaDon INT AUTO_INCREMENT PRIMARY KEY,
  MaSanPham INT,
  SoLuong BIGINT,
  MaHoaDon INT,
  CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
  CONSTRAINT FK_ChiTietHoaDon_SanPham FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE DoiTuongSD (
  MaDoiTuongSD INT PRIMARY KEY,
  TenDoiTuongSD VARCHAR(50)
);

CREATE TABLE DonDatHang (
  MaHoaDon INT,
  HoVaTen CLOB,
  DiaChi CLOB,
  SDT CLOB,
  TongTien BIGINT,
  MaDonDatHang INT AUTO_INCREMENT PRIMARY KEY,
  TinhTrang BOOLEAN,
  CONSTRAINT FK_DonDatHang_HoaDon FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon)
);

CREATE TABLE HoaDon (
  MaHoaDon INT AUTO_INCREMENT PRIMARY KEY,
  MaNguoiDung INT,
  NgayMua TIMESTAMP,
  DaMua BOOLEAN,
  CONSTRAINT FK_HoaDon_NguoiDung FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);

CREATE TABLE NguoiDung (
  MaNguoiDung INT AUTO_INCREMENT PRIMARY KEY,
  TenNguoiDung CLOB,
  TenDangNhap VARCHAR(50),
  MatKhau VARCHAR(50),
  Quyen BOOLEAN,
  VerificationToken VARCHAR(255),
  IsVerified BOOLEAN DEFAULT FALSE
);

CREATE TABLE NhaSanXuat (
  MaNSX INT AUTO_INCREMENT PRIMARY KEY,
  TenNSX VARCHAR(50)
);

CREATE TABLE SanPham (
  MaSanPham INT AUTO_INCREMENT PRIMARY KEY,
  TenSanPham CLOB,
  DonGia BIGINT,
  HinhAnh VARCHAR(50),
  LoaiDongHo VARCHAR(50),
  MaNSX INT NOT NULL,
  MaDoiTuongSD INT NOT NULL,
  DaXoa BOOLEAN,
  CONSTRAINT FK_SanPham_DoiTuongSD FOREIGN KEY (MaDoiTuongSD) REFERENCES DoiTuongSD(MaDoiTuongSD),
  CONSTRAINT FK_SanPham_NhaSanXuat FOREIGN KEY (MaNSX) REFERENCES NhaSanXuat(MaNSX)
);

-- Dữ liệu mẫu
INSERT INTO NguoiDung (MaNguoiDung, TenNguoiDung, TenDangNhap, MatKhau, Quyen) VALUES (1, 'Nguyễn Văn A', 'admin', 'admin', TRUE);
INSERT INTO NguoiDung (MaNguoiDung, TenNguoiDung, TenDangNhap, MatKhau, Quyen) VALUES (2, 'Trần Thị B', 'user1', 'user1', FALSE);

INSERT INTO NhaSanXuat (MaNSX, TenNSX) VALUES (1, 'Casio');
INSERT INTO NhaSanXuat (MaNSX, TenNSX) VALUES (2, 'Seiko');
INSERT INTO NhaSanXuat (MaNSX, TenNSX) VALUES (3, 'Citizen');

INSERT INTO DoiTuongSD (MaDoiTuongSD, TenDoiTuongSD) VALUES (1, 'Nam');
INSERT INTO DoiTuongSD (MaDoiTuongSD, TenDoiTuongSD) VALUES (2, 'Nữ');
INSERT INTO DoiTuongSD (MaDoiTuongSD, TenDoiTuongSD) VALUES (3, 'Trẻ em');

INSERT INTO SanPham (MaSanPham, TenSanPham, DonGia, HinhAnh, LoaiDongHo, MaNSX, MaDoiTuongSD, DaXoa) VALUES (1, 'Đồng hồ Casio G-Shock', 2000000, 'casio_gshock.jpg', 'Điện tử', 1, 1, FALSE);
INSERT INTO SanPham (MaSanPham, TenSanPham, DonGia, HinhAnh, LoaiDongHo, MaNSX, MaDoiTuongSD, DaXoa) VALUES (2, 'Đồng hồ Seiko 5 Automatic', 3500000, 'seiko5.jpg', 'Cơ', 2, 1, FALSE);
INSERT INTO SanPham (MaSanPham, TenSanPham, DonGia, HinhAnh, LoaiDongHo, MaNSX, MaDoiTuongSD, DaXoa) VALUES (3, 'Đồng hồ Citizen Eco-Drive', 4000000, 'citizen_eco.jpg', 'Năng lượng mặt trời', 3, 2, FALSE);
INSERT INTO SanPham (MaSanPham, TenSanPham, DonGia, HinhAnh, LoaiDongHo, MaNSX, MaDoiTuongSD, DaXoa) VALUES (4, 'Đồng hồ Casio Baby-G', 1800000, 'casio_babyg.jpg', 'Điện tử', 1, 2, FALSE);

INSERT INTO HoaDon (MaHoaDon, MaNguoiDung, NgayMua, DaMua) VALUES (1, 1, TIMESTAMP '2023-01-15 10:00:00', TRUE);
INSERT INTO HoaDon (MaHoaDon, MaNguoiDung, NgayMua, DaMua) VALUES (2, 2, TIMESTAMP '2023-01-20 14:30:00', TRUE);
INSERT INTO HoaDon (MaHoaDon, MaNguoiDung, NgayMua, DaMua) VALUES (3, 1, TIMESTAMP '2023-02-01 09:15:00', FALSE);

INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaSanPham, SoLuong, MaHoaDon) VALUES (1, 1, 1, 1);
INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaSanPham, SoLuong, MaHoaDon) VALUES (2, 2, 1, 1);
INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaSanPham, SoLuong, MaHoaDon) VALUES (3, 3, 1, 2);
INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaSanPham, SoLuong, MaHoaDon) VALUES (4, 4, 2, 2);

INSERT INTO DonDatHang (MaDonDatHang, MaHoaDon, HoVaTen, DiaChi, SDT, TongTien, TinhTrang) VALUES (1, 1, 'Nguyễn Văn A', '123 Đường ABC, Quận 1, TP.HCM', '0901234567', 5500000, TRUE);
INSERT INTO DonDatHang (MaDonDatHang, MaHoaDon, HoVaTen, DiaChi, SDT, TongTien, TinhTrang) VALUES (2, 2, 'Trần Thị B', '456 Đường XYZ, Quận 2, TP.HCM', '0908765432', 7600000, TRUE);
INSERT INTO DonDatHang (MaDonDatHang, MaHoaDon, HoVaTen, DiaChi, SDT, TongTien, TinhTrang) VALUES (3, 3, 'Nguyễn Văn A', '123 Đường ABC, Quận 1, TP.HCM', '0901234567', 0, FALSE);

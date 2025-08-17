USE BookShop;

-- Xóa dữ liệu các bảng cũ (Nếu có)
DELETE FROM DatHang_ChiTiet;
DELETE FROM DatHang;
DELETE FROM SanPham;
DELETE FROM TinhTrang;
DELETE FROM HangSanXuat;
DELETE FROM LoaiSanPham;
DELETE FROM NguoiDung;

-- Reset identity
IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'DatHang_ChiTiet' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('DatHang_ChiTiet', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'DatHang' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('DatHang', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'SanPham' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('SanPham', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'TinhTrang' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('TinhTrang', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'HangSanXuat' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('HangSanXuat', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'LoaiSanPham' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('LoaiSanPham', RESEED, 0);

IF EXISTS (SELECT * FROM sys.identity_columns WHERE OBJECT_NAME(OBJECT_ID) = 'NguoiDung' AND last_value IS NOT NULL)
	DBCC CHECKIDENT('NguoiDung', RESEED, 0);

-- Thêm dữ liệu mới
INSERT INTO TinhTrang(MoTa, MoTaKhongDau) VALUES
(N'Đơn hàng mới', 'don-hang-moi'),
(N'Đã xác nhận', 'da-xac-nhan'),
(N'Đang giao', 'dang-giao'),
(N'Đang chuyển hoàn', 'dang-chuyen-hoan'),
(N'Đã hủy bởi khách hàng', 'da-huy-boi-khach-hang'),
(N'Đã hủy bởi shop', 'da-huy-boi-shop'),
(N'Đã chuyển hoàn', 'da-chuyen-hoan'),
(N'Thành công', 'thanh-cong');

SET IDENTITY_INSERT HangSanXuat ON
INSERT INTO HangSanXuat(ID, TenHangSanXuat, TenHangSanXuatKhongDau) VALUES
(1, 'Nhã Nam', 'nhanam'),
(2, 'Trẻ', 'tre'),
(3, 'Kim Đồng', 'kimdong'),
(4, 'Phụ Nữ', 'phunu'),
(5, 'Lao Động', 'laodong'),
(6, 'Văn Học', 'vanhoc'),
(7, 'Phương Nam Book', 'phuongnambook'),
(8, 'Tri Thức', 'trithuc'),
(9, 'Văn Hóa Dân Tộc', 'vanhoadantoc'),
(10, 'Thế Giới', 'thegioi');
SET IDENTITY_INSERT HangSanXuat OFF

INSERT INTO NguoiDung(HoVaTen, Email, DienThoai, DiaChi, TenDangNhap, MatKhau, Quyen) VALUES
(N'Nguyễn Văn An', 'nguyenvanan@gmail.com', '0123456888', 'Long Xuyên', 'admin', '$2a$11$XGOVk9m4HqzXBlwVvhKN/ur8FS/keV9QyuCwikTL67sL0gqNUupMa', 1),
(N'Hoàng Thảo My', 'hoangthaomy@gmail.com', '0123456999', 'Long Xuyên', 'user', '$2a$11$c1syEtekaZ6OJrX77mGoJ.6mu4YuUjUHvKrliW8oOU3M3u7I6zyuy', 0);

SET IDENTITY_INSERT LoaiSanPham ON
INSERT INTO LoaiSanPham(ID, TenLoai, TenLoaiKhongDau) VALUES
(1, N'Sách văn học', 'sach-van-hoc'),
(2, N'Sách thiếu nhi', 'sach-thieu-nhi'),
(3, N'Sách khoa học - công nghệ	', 'sach-khoa-hoc-cong-nghe');
SET IDENTITY_INSERT LoaiSanPham OFF

INSERT INTO SanPham(LoaiSanPhamID, HangSanXuatID, TenSanPham, TenSanPhamKhongDau, SoLuong, DonGia, HinhAnh) VALUES
(1, 1, N'MÙA THU CỦA CÂY DƯƠNG', N'mua-thu-cua-cay-duong', 100, 63000, 'NNmuathucuacayduong.jpg'),
(1, 1, N'NHỮNG ĐỨA CON CỦA NỬA ĐÊM', N'nhung-dua-con-cua-nua-dem', 100, 204000, 'NNnhungduaconcuanuadem.jpg'),
(1, 1, N'CHUYỆN CON MÈO DẠY HẢI ÂU BAY',N' chuyen-con-meo-day-hai-au-bay', 100, 51000, 'NNchuyenmeodayhaiaubay.jpg'),
(1, 1, N'NHỮNG NGỌN GIÓ HUA TÁT', N'nhung-ngon-gio-hua-tat', 100, 114754, 'NNnhungngongiohuatat.jpg'),
(1, 1, N'BIỆT THỰ BUỒN', N'biet-thu-buon', 100, 103900, 'NNbiet-thu-buon.jpg'),
(1, 1, N'THƯ GỬI NHÀ THƠ TRẺ', N'thu-gui-nha-tho-tre', 100, 57800, 'NNthuguinhathotre.jpg'),
(1, 2, N'CHÚNG TA SỐNG ĐỂ BƯỚC TIẾP', N'chung-ta-song-de-buoc-tiep', 100, 80000, 'nxbtreChungtasongdebuoctiep.jpg'),
(1, 2, N'TIỆM SÁCH CỦA NÀNG', N'tiem-sach-cua-nang', 100, 125000, 'nxbtre01.jpg'),
(1, 2, N'GIÓ ĐÔNG RƯNG RỨC', N'gio-dong-rung-ruc', 100, 85000, 'nxbtre02.jpg'),
(1, 2, N'CÁI CHẾT CỦA BẦY ONG', N'cai-chet-cua-bay-ong', 100, 167900, 'nxbtre03.jpg'),
(1, 2, N'BỘ SÁCH VĂN HỌC MIỀN NAM LỤC TỈNH', N'bo-sach', 100, 700000, 'nxbtre04.jpg'),
(2, 2, N'TUYỂN TẬP TRUYỆN NGẮN TRANG THẾ HY', N'truyen-ngan-tth', 100, 130000, 'nxbtre05.jpg'),
(2, 2, N'ĐÚNG GIỜ NHƯ BẠN GÀ TƠ', N'sach-thieu-nhi', 100, 25000, 'nxbtre06.jpg'),
(2, 2, N'KIÊN TRÌ NHƯ BẠN HẢI LY', N'sach-thieu-nhi', 100, 25000, 'nxbtre07.jpg'),
(2, 2, N'VỊ THA NHƯ BẠN HÀ MÃ', N'sach-thieu-nhi', 100, 25000, 'nxbtre08.jpg'),
(2, 2, N'ẤM ÁP NHƯ BẠN CẠP CẠP', N'sach-thieu-nhi', 100, 2500, 'nxbtre09.jpg'),
(2, 2, N'LỊCH SỰ NHƯ BẠN SƯ TỬ', N'sach-thieu-nhi', 100, 2500, 'nxbtre10.jpg'),
(3, 2, N'FEYNMAN CHUYỆN THẬT NHƯ ĐÙA', N'sach-khoa-hoc-cong-nghe', 100, 165000, 'nxbtre11.jpg'),
(3, 2, N'ĐÁNH GIÁ KỶ NHÂN SINH: TẢN MẠN VỀ THẾ GIỚI', N'sach-khoa-hoc-cong-nghe', 100, 270000, 'nxbtre12.jpg'),
(3, 2, N'BẢN ĐỒ AI', N'sach-khoa-hoc-cong-nghe', 100, 180000, 'nxbtre13.jpg'),
(3, 2, N'KIẾN TẠO THIÊN TÀI', N'sach-khoa-hoc-cong-nghe', 100, 199000, 'nxbtre14.jpg'),
(3, 2, N'MA THUẬT CỦA VẬT CHẤT ', N'sach-khoa-hoc-cong-nghe', 100, 399000, 'nxbtre15.jpg'),
(3, 2, N'365 NGÀY KHỦNG LONG', N'sach-khoa-hoc-cong-nghe', 100, 269000, 'nxbtre16.jpg'),
(3, 2, N'KHÔN NGOAN HƠN THUẬT TOÁN', N'sach-khoa-hoc-cong-nghe', 100, 339900, 'nxbtre17.jpg'),
(3, 2, N'CẢM XÚC ', N'sach-khoa-hoc-cong-nghe', 100, 379000, 'nxbtre18.jpg'),
(3, 2, N'KỂ CHUYỆN BẰNG DỮ LIỆU', N'sach-khoa-hoc-cong-nghe', 100, 250000, 'nxbtre19.jpg'),
(3, 2, N'KHOA HỌC KHÁM PHÁ ', N'sach-khoa-hoc-cong-nghe', 100, 260000, 'nxbtre20.jpg');


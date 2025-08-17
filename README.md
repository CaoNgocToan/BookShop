# 📚 Book Shop Website

Website bán sách trực tuyến được phát triển bằng **ASP.NET Core MVC**.  
Người dùng có thể xem sách, tìm kiếm, phân loại, thêm vào giỏ hàng và thanh toán.  
Quản trị viên có thể quản lý sách và danh mục sách.

---

## 🚀 Tính năng

### 👤 Người dùng
- Đăng ký, đăng nhập, đăng xuất
- Xem danh sách sách
- Phân loại sách theo thể loại
- Tìm kiếm sách theo tên hoặc thể loại
- Thêm sách vào giỏ hàng
- Thanh toán

### 🔧 Quản trị viên
- Quản lý sách (thêm, sửa, xoá)
- Quản lý loại sách
- Quản lý đơn hàng
- Quản lý tài khoản


---

## ⚙️ Cài đặt

### Yêu cầu
- .NET 8.0 trở lên
- SQL Server
- Visual Studio 2022 (hoặc IDE hỗ trợ .NET)

### Cách chạy dự án
1. Clone project:
   ```bash
   git clone https://github.com/CaoNgocToan/BookShop.git
   cd bookshop

2. Chỉnh sửa file appsettings.json để cấu hình chuỗi kết nối phù hợp với SQL Server.

3. Cập nhật cơ sở dữ liệu bằng lệnh trong Package Manager Console:
   ```bash
   Update-Database

4. Chạy dự án

    Mở bằng Visual Studio và nhấn Run Hoặc chạy bằng lệnh:
    ```bash
    dotnet run
    

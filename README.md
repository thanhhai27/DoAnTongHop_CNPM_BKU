## 1. Thiết lập môi trường phát triển
### 1.1. Thiết lập XAMPP:
Truy cập vào link sau để tải XAMPP phù hợp với máy: https://www.apachefriends.org/download.html
### 1.2. Thiết lập Composer:
Truy cập vào link sau để tải Composer: https://getcomposer.org/
## 2. Khởi chạy dự án
- Link Github của ECommerce: https://github.com/thanhhai27/DoAnTongHop_CNPM_BKU.git
- Sau khi tải về các file mã nguồn của ECommerce từ link Github, lập trình viên tiến hành lần lượt các bước sau:
### 2.1. Cấu hình dữ liệu trong PHPMyAdmin:
Để đưa toàn bộ dữ liệu của dự án ECommerce vào PHPMyAdmin của lập trình viên ta cần làm các bước sau:
1. Khởi động PHPMyAdmin
2. Truy cập vào phần "Import"
3. Chọn file "ECommerce_data.sql"đã lấy về từ Github
4. Chọn lệnh "Import"để tải toàn bộ dữ liệu lên hệ thống
### 2.2. Tổ chức lại thư mục ECommerce:
Để đưa thư mục "ECommerce"vào thư mục "htdocs"ta cần làm các bước sau:
1. Tìm thư mục có tên "XAMPP"
2. Truy cập vào thư mục XAMPP và tìm thư mục tên "htdocs"
3. Đưa thư mục "ECommerce"đã clone từ Github vào trong thư mục "htdocs"
### 2.3. Khởi chạy dự án:
1. Khởi chạy PHPMyAdmin
2. Truy cập vào thư mục "XAMPP" sau đó vào thư mục "htdocs"
3. Mở 1 terminal mới tại thư mục "ECommerce" có trong thư mục "htdocs"
4. Gõ lệnh sau để mở dự án trong Visual Studio Code: code .
5. Sau đó mở terminal trong dự án
6. Gõ lệnh sau để chạy dự án: php artisan serve
7. Bấm vào đường link xuất hiện sau khi gõ lệnh ở bước 6 và trang web sẽ tự động xuất hiện

# Xử lý sự cố kết nối PostgreSQL

Tài liệu này giải thích các vấn đề phổ biến khi kết nối từ Strapi đến PostgreSQL và cách xử lý.

## Lỗi "password authentication failed for user"

Khi Strapi báo lỗi kết nối đến PostgreSQL với thông báo:

```
error: password authentication failed for user "joy"
```

Có thể do một trong các nguyên nhân sau:

### 1. Mật khẩu trong file .env không khớp với PostgreSQL

- Kiểm tra lại file `.env` trong thư mục Strapi có thông tin kết nối đúng không
- Đặt lại mật khẩu cho user trong PostgreSQL:

```bash
# Vào container PostgreSQL
docker exec -it rateDB psql -U joy -d rate

# Trong psql, đặt lại mật khẩu
ALTER USER joy WITH PASSWORD 'rate@123!';
```

### 2. Xung đột giữa PostgreSQL cài đặt trên Windows và Docker

**Dấu hiệu nhận biết**: Bạn đã kiểm tra mật khẩu đúng, nhưng Strapi vẫn không kết nối được.

**Nguyên nhân**: Khi cài đặt PostgreSQL trên Windows, nó tự động chiếm port 5432. Nếu bạn chạy PostgreSQL trong Docker trên cùng port, sẽ xảy ra xung đột. Strapi có thể đang kết nối đến PostgreSQL Windows, không phải Docker.

**Cách kiểm tra**:

```bash
# Kiểm tra các process đang lắng nghe port 5432
netstat -ano | findstr :5432

# Kiểm tra tên của các process
tasklist /FI "PID eq <số_PID>"
```

**Cách xử lý tạm thời**:

1. Dừng dịch vụ PostgreSQL trên Windows (yêu cầu quyền Administrator):

```cmd
net stop postgresql-x64-16
net stop postgresql-x64-17
```

**Cách xử lý vĩnh viễn**:

1. Vô hiệu hóa dịch vụ PostgreSQL trên Windows:
   - Mở `services.msc`
   - Tìm dịch vụ PostgreSQL
   - Chuột phải → Properties → Startup type → Disable

2. Hoặc dùng PowerShell (yêu cầu quyền Administrator):

```powershell
Set-Service -Name "postgresql-x64-16" -StartupType Disabled
Set-Service -Name "postgresql-x64-17" -StartupType Disabled
```

3. Hoặc dùng Command Prompt (yêu cầu quyền Administrator):

```cmd
sc config postgresql-x64-16 start= disabled
sc config postgresql-x64-17 start= disabled
```

### 3. PostgreSQL Docker không cho phép kết nối từ bên ngoài

Đôi khi PostgreSQL trong Docker không cho phép kết nối từ máy chủ host.

**Cách xử lý**:

1. Trong file `.env` của Strapi, thay đổi:

```
DATABASE_HOST=host.docker.internal
```

2. Đảm bảo file `pg_hba.conf` trong container cho phép kết nối từ bên ngoài:

```
host    all             all             0.0.0.0/0               md5
```

## Lỗi khác

Nếu bạn gặp các lỗi khác khi kết nối PostgreSQL, hãy kiểm tra:

1. Docker và container PostgreSQL đang chạy
2. Port 5432 đã được map đúng trong cấu hình Docker
3. Firewall Windows không chặn kết nối
4. Không có ứng dụng nào khác chiếm port 5432

# Hướng dẫn Backup PostgreSQL trong Docker

Tài liệu này hướng dẫn cách backup database PostgreSQL khi chạy trong Docker. Làm theo các bước sau để xuất dữ liệu an toàn.

## Yêu cầu

- Đã cài đặt Docker và đang chạy
- Có quyền truy cập terminal/PowerShell
- Biết tên service database (ví dụ: `rateDB`)
- Có username và password database (xem file `.env`)

## Các bước thực hiện

1. **Mở terminal hoặc PowerShell**

2. **Xác định tên service database**

   - Chạy: `docker ps`
   - Tìm service PostgreSQL (ví dụ: `rateDB`)

3. **Xuất database với tên file có timestamp**

   - Thay `<db_user>`, `<db_name>`, `<container_name>` cho phù hợp.
   - Lệnh mẫu (PowerShell):

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec <container_name> pg_dump -U <db_user> <db_name> > "backup_$timestamp.sql"
   ```

   - Ví dụ: user là `postgres`, db là `ratebox`, container là `rateDB`:

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec rateDB pg_dump -U postgres ratebox > "backup_$timestamp.sql"
   ```

4. **Kiểm tra file backup**
   - File `backup_<timestamp>.sql` sẽ xuất hiện ở thư mục hiện tại.

## Lưu ý

- Không chia sẻ file `.env` hoặc thông tin nhạy cảm.
- Có thể tự động hóa backup bằng script và scheduler.

---

**Xem thêm:** [Khôi phục backup PostgreSQL](./restore-postgres.md) (nếu có)

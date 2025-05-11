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

   - Ví dụ với cấu hình hiện tại (user là `joy`, db là `rate`, container là `rateDB`):

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec rateDB pg_dump -U joy -d rate > "backup/rate_$timestamp.sql"
   ```

4. **Kiểm tra file backup**
   - File `backup/rate_<timestamp>.sql` sẽ xuất hiện ở thư mục hiện tại.

## Backup thư mục uploads của Strapi

Ngoài database, bạn cũng cần backup thư mục uploads của Strapi chứa các file media:

```powershell
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Compress-Archive -Path "D:\Projects\RateBox\strapi\public\uploads" -DestinationPath "D:\Projects\RateBox\backup\strapi_uploads_$timestamp.zip" -Force
```

## Script backup hoàn chỉnh

Dưới đây là script PowerShell để backup cả database và thư mục uploads:

```powershell
# Tạo thư mục backup nếu chưa tồn tại
if (-not (Test-Path -Path "D:\Projects\RateBox\backup")) {
    New-Item -ItemType Directory -Path "D:\Projects\RateBox\backup"
}

# Backup database PostgreSQL
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Write-Host "Tiến hành backup PostgreSQL database..."
docker exec rateDB pg_dump -U joy -d rate > "D:\Projects\RateBox\backup\rate_$timestamp.sql"

# Backup thư mục uploads của Strapi
Write-Host "Tiến hành backup thư mục uploads của Strapi..."
Compress-Archive -Path "D:\Projects\RateBox\strapi\public\uploads" -DestinationPath "D:\Projects\RateBox\backup\strapi_uploads_$timestamp.zip" -Force

Write-Host "Backup hoàn tất!"
Write-Host "Các file đã tạo:"
Write-Host "- backup/rate_$timestamp.sql (Database dump)"
Write-Host "- backup/strapi_uploads_$timestamp.zip (Media files)"
```

## Lưu ý

- Không chia sẻ file `.env` hoặc thông tin nhạy cảm.
- Có thể tự động hóa backup bằng script và scheduler.
- Tài liệu này chỉ hướng dẫn backup, không bao gồm khôi phục dữ liệu.

---

**Xem thêm:** [Khôi phục backup PostgreSQL](./restore-postgres.md) (nếu có)

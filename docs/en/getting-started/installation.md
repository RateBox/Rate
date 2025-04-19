# Hướng dẫn cài đặt

## Yêu cầu hệ thống

- Docker & Docker Compose
- Node.js 18+ (cho phát triển local)
- Git

## Cài đặt môi trường development

1. Clone repository:
```bash
git clone https://github.com/your-username/ratebox.git
cd ratebox
```

2. Tạo file môi trường:
```bash
# .env cho Next.js
cp next/.env.example next/.env

# .env cho Strapi
cp strapi/.env.example strapi/.env
```

3. Khởi động containers:
```bash
docker-compose up -d
```

4. Truy cập các services:

- Frontend: http://localhost:3000
- Strapi Admin: http://localhost:1337/admin
- PostgreSQL: localhost:5432

## Cấu hình Strapi

1. Truy cập Strapi Admin Panel
2. Tạo tài khoản admin đầu tiên
3. Cấu hình các collection types và components
4. Tạo API token cho frontend

## Cấu hình Next.js

1. Cập nhật biến môi trường trong `next/.env`:
```
NEXT_PUBLIC_API_URL=http://localhost:1337
NEXT_PUBLIC_API_TOKEN=your-strapi-token
```

2. Khởi động lại Next.js container:
```bash
docker-compose restart rate-next
```

## Backup & Restore

### Backup database

```bash
./backup.ps1
```

### Restore database

```bash
docker exec -i rate-postgres psql -U joy -d rate < backup/your-backup-file.sql
```

## Troubleshooting

### Lỗi kết nối database
- Kiểm tra biến môi trường trong `docker-compose.yml`
- Đảm bảo container PostgreSQL đang chạy
- Kiểm tra logs: `docker-compose logs rate-postgres`

### Lỗi Strapi
- Xóa thư mục `.cache` và `build`
- Rebuild container: `docker-compose build rate-strapi`
- Kiểm tra logs: `docker-compose logs rate-strapi`

### Lỗi Next.js
- Xóa thư mục `.next`
- Rebuild container: `docker-compose build rate-next`
- Kiểm tra logs: `docker-compose logs rate-next`

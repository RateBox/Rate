# Hướng dẫn cài đặt

## Yêu cầu hệ thống

- Docker & Docker Compose
- Node.js 18+ (cho phát triển local)
- Git

## Cài đặt môi trường development

1. Clone repository:
```bash
git clone https://github.com/RateBox/Rate.git
cd Rate
```

2. Tạo file môi trường:
```bash
# .env cho Next.js
cp next/.env.example next/.env

# .env cho Strapi
cp strapi/.env.example strapi/.env

# .env cho PostgreSQL
cp postgres/.env.example postgres/.env
```

3. Khởi động containers:
```bash
docker-compose up -d
```

4. Truy cập các services:

- Frontend: http://localhost:3001
- Strapi Admin: http://localhost:1337/admin
- PostgreSQL: localhost:5432

## Cấu hình Strapi

1. Truy cập Strapi Admin Panel (http://localhost:1337/admin)
2. Tạo tài khoản admin đầu tiên
3. Cấu hình các collection types và components
4. Tạo API token cho frontend

## Cấu hình Next.js

1. Cập nhật biến môi trường trong `next/.env`:
```
NEXT_PUBLIC_API_URL=http://localhost:1337
NEXT_INTERNAL_API_URL=http://strapi:1337
```

2. Khởi động lại Next.js container:
```bash
docker-compose restart next
```

## Giải thích cấu hình Docker

### Môi trường Development vs Production

Chúng ta sử dụng các cấu hình Dockerfile khác nhau cho môi trường development và production:

- **Development:** Sử dụng `yarn dev` để chạy Next.js trong chế độ phát triển
- **Production:** Sẽ sử dụng `yarn build && yarn start` cho build production

Trong Dockerfile cho Next.js:
```dockerfile
FROM node:lts

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3001

# Chạy trong chế độ development
CMD ["yarn", "dev"]
```

### Mounting thư mục
Đối với Strapi, chúng ta tuân theo khuyến nghị chính thức để mount các thư mục cụ thể:
```yaml
volumes:
  - ./strapi/config:/opt/app/config
  - ./strapi/src:/opt/app/src
  - ./strapi/package.json:/opt/app/package.json
  - ./strapi/yarn.lock:/opt/app/yarn.lock
  - ./strapi/.env:/opt/app/.env
  - ./strapi/public/uploads:/opt/app/public/uploads
```

## Backup & Restore

### Backup

Để thực hiện sao lưu hoàn chỉnh, sử dụng các lệnh sau:

```bash
# Xuất dữ liệu Strapi
docker-compose exec strapi yarn strapi export --no-encrypt

# Dump database PostgreSQL
docker-compose exec rateDB pg_dump -U joy -d rate > backup/rate_$(Get-Date -Format 'yyyyMMdd_HHmmss').sql

# Sao chép file xuất Strapi từ container
docker cp strapi:/opt/app/export_XXXXXXXX.tar.gz backup/strapi-export-$(Get-Date -Format 'yyyyMMdd_HHmmss').tar.gz

# Commit thay đổi vào Git
git add .
git commit -m "Backup: $(Get-Date -Format 'yyyyMMdd_HHmmss')"
git push
```

### Khôi phục database

```bash
docker exec -i rateDB psql -U joy -d rate < backup/your-backup-file.sql
```

## Xử lý sự cố

### Lỗi kết nối database
- Kiểm tra biến môi trường trong `docker-compose.yml` và file `.env`
- Đảm bảo container PostgreSQL đang chạy
- Kiểm tra logs: `docker-compose logs rateDB`

### Lỗi Strapi
- Kiểm tra logs Strapi: `docker-compose logs strapi`
- Xóa thư mục `.cache` và `build` nếu cần
- Rebuild container: `docker-compose build strapi`

### Lỗi Next.js
- Kiểm tra logs Next.js: `docker-compose logs next`
- Đối với lỗi build, chuyển sang chế độ dev bằng cách cập nhật Dockerfile để sử dụng `CMD ["yarn", "dev"]`
- Đối với lỗi "Cannot read properties of undefined", kiểm tra kết nối API và phản hồi từ Strapi
- Đối với lỗi quốc tế hóa (i18n), kiểm tra file middleware.ts và cấu hình i18n

### Vấn đề kết nối API
- Kiểm tra xem Strapi có thể truy cập được: `curl http://localhost:1337/api/global`
- Trong mạng Docker, sử dụng tên dịch vụ: `docker-compose exec next curl http://strapi:1337/api/global`
- Xác minh biến môi trường cho URL API đúng

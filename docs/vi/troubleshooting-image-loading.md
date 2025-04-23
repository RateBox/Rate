# Xử lý lỗi không tải được hình ảnh từ Strapi trong Next.js

## Vấn đề
Khi triển khai ứng dụng Next.js với Strapi CMS trong môi trường Docker, có thể gặp tình trạng không tải được hình ảnh từ Strapi. Lỗi này thường xảy ra do cấu hình không chính xác giữa các service.

## Nguyên nhân
1. **URL không đúng**: Sự khác biệt giữa URL nội bộ (trong mạng Docker) và URL công khai (từ trình duyệt)
2. **Mount volume không đúng cách**: Thư mục `public/uploads` của Strapi không được mount đúng cách
3. **Cấu hình Image Optimizer**: Next.js Image Optimizer không được cấu hình đúng domain và port của Strapi

## Giải pháp

### 1. Cấu hình URL chính xác
Trong file `next/.env`:
```env
# URL nội bộ để gọi API trong mạng Docker
NEXT_INTERNAL_API_URL=http://strapi:1337

# URL công khai cho media files
NEXT_PUBLIC_STRAPI_MEDIA_URL=http://localhost:1337
```

### 2. Mount volume đúng cách
Trong `docker-compose.yml`, cấu hình mount cho service Strapi:
```yaml
services:
  strapi:
    volumes:
      - ./strapi/config:/opt/app/config
      - ./strapi/src:/opt/app/src
      - ./strapi/package.json:/opt/app/package.json
      - ./strapi/yarn.lock:/opt/app/yarn.lock
      - ./strapi/.env:/opt/app/.env
      - ./strapi/public/uploads:/opt/app/public/uploads
```

### 3. Cấu hình Image Optimizer
Trong `next/.env`:
```env
# Image Optimizer settings
NEXT_PUBLIC_IMAGE_HOSTNAME=strapi
NEXT_PUBLIC_IMAGE_PORT=1337
```

Trong `next.config.mjs`, cấu hình `remotePatterns` cho Image Optimizer:
```javascript
{
  images: {
    remotePatterns: [
      {
        protocol: "http",
        hostname: "localhost",
        port: "1337",
        pathname: "/uploads/**",
      },
      {
        protocol: "http",
        hostname: "strapi",
        port: "1337",
        pathname: "/uploads/**",
      },
    ],
  }
}
```

### 4. Xử lý URL hình ảnh
Trong `lib/strapi/strapiImage.ts`, sử dụng `NEXT_PUBLIC_API_URL` cho mọi trường hợp:
```typescript
export function strapiImage(url: string): string {
  if (url.startsWith("/")) {
    // Luôn sử dụng NEXT_PUBLIC_API_URL vì:
    // 1. Next.js Image đã được cấu hình với remotePatterns
    // 2. Browser cần truy cập được URL này
    return process.env.NEXT_PUBLIC_API_URL + url
  }
  return url
}
```

**Lưu ý**: 
- Không cần phân biệt giữa server-side và client-side URL vì Next.js Image Optimizer sẽ tự động xử lý thông qua `remotePatterns`
- Không cần cấu hình `rewrites()` trong `next.config.mjs`

## Kiểm tra
1. Khởi động lại tất cả các container:
```bash
docker compose down && docker compose up -d
```

2. Kiểm tra logs của các service:
```bash
docker logs strapi
docker logs next
```

## Lưu ý
- Đảm bảo các biến môi trường được cập nhật trong cả file `.env` và `.env.example`
- Kiểm tra quyền truy cập thư mục `public/uploads` trong container Strapi
- Xác nhận rằng Strapi đang phục vụ files media một cách chính xác 
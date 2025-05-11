# Kiến trúc Kỹ thuật

Tài liệu này cung cấp tổng quan chi tiết về kiến trúc kỹ thuật, các thành phần và luồng dữ liệu của nền tảng RateBox. Để biết giới thiệu chung về RateBox, vui lòng tham khảo [trang chủ](/).

## Kiến trúc hệ thống

RateBox được xây dựng dựa trên kiến trúc microservices với các thành phần chính:

- **Frontend (Next.js)**: Giao diện người dùng được xây dựng bằng Next.js 14, tận dụng Server Components và App Router để tối ưu hiệu năng.

- **Backend (Strapi)**: Headless CMS Strapi cung cấp API linh hoạt và hệ thống quản trị nội dung.

- **Database (PostgreSQL)**: Cơ sở dữ liệu quan hệ mạnh mẽ lưu trữ dữ liệu người dùng và đánh giá.

## Quy trình làm việc

1. Người dùng truy cập frontend để xem và tạo đánh giá
2. Frontend gọi API từ Strapi backend
3. Strapi xử lý yêu cầu và tương tác với PostgreSQL
4. Dữ liệu được trả về frontend và hiển thị cho người dùng

## Môi trường phát triển

- Development: Môi trường local với Docker Compose
- Staging: Môi trường kiểm thử trước khi deploy
- Production: Môi trường chạy thật

## Công nghệ sử dụng

- Next.js 14
- Strapi 4
- PostgreSQL 17
- Docker & Docker Compose
- Nginx (reverse proxy)
- Redis (cache)

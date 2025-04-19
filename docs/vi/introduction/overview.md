# Tổng quan về RateBox

RateBox là một nền tảng đánh giá sản phẩm và dịch vụ toàn diện, được xây dựng với mục tiêu cung cấp trải nghiệm người dùng tốt nhất cho cả người đánh giá và doanh nghiệp.

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

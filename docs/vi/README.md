# RateBox - Nền tảng đánh giá sản phẩm và dịch vụ

RateBox là một nền tảng đánh giá sản phẩm và dịch vụ toàn diện, được xây dựng với mục tiêu cung cấp thông tin đáng tin cậy cho người dùng. Dự án này là phiên bản nâng cấp của [danhgia.net](https://danhgia.net), sử dụng công nghệ hiện đại để mang lại trải nghiệm tốt hơn.

## Công nghệ sử dụng

- **Frontend**: Next.js
- **Backend/CMS**: Strapi
- **Database**: PostgreSQL
- **Deployment**: Docker

## Tính năng chính

- Hệ thống đánh giá sản phẩm/dịch vụ
- Quản lý danh mục
- Blog
- Landing pages với các thành phần:
  - Hero sections
  - Features
  - Testimonials
  - Pricing plans
  - FAQs
  - Social media integration

## Tài liệu

Tài liệu được tổ chức thành các phần sau:

1. [Giới thiệu](introduction/overview.md)
2. [Bắt đầu](getting-started/installation.md)
3. [Tính năng](features/review-system.md)
4. [Triển khai](deployment/staging.md)
5. [Đóng góp](contributing/git-workflow.md)
6. [API Reference](api-reference/authentication.md)

## Đóng góp

Chúng tôi rất hoan nghênh mọi đóng góp! Vui lòng xem [hướng dẫn đóng góp](contributing/git-workflow.md) để biết thêm chi tiết.

## Giới thiệu về Listing Type

**Listing Type** là để nhóm các business cùng nằm trong một Directory nhưng có cấu trúc dữ liệu và tiêu chí đánh giá/review khác nhau.

---

### Ý nghĩa của Category

**Category** (Danh mục) là thành phần quan trọng giúp tổ chức, phân loại và tối ưu trải nghiệm người dùng cũng như SEO cho hệ thống review/listing. Một số vai trò chính của Category:

- Tạo description, hình ảnh đại diện, meta title, meta description riêng cho từng nhóm (SEO cho trang category).
- Tạo landing page riêng cho từng nhóm listing (ví dụ: `/category/du-lich` có banner, giới thiệu, nội dung riêng).
- Tùy biến giao diện, breadcrumb, menu động theo từng nhóm.
- Quản lý phân loại, filter, sắp xếp, phân quyền theo nhóm.
- Hỗ trợ tạo navigation/menu đa cấp, giúp người dùng dễ dàng tìm kiếm và duyệt nội dung.
- Dễ dàng mở rộng để phục vụ các chiến dịch marketing, landing page theo từng chủ đề.
- Tối ưu hóa trải nghiệm tìm kiếm và phân trang theo từng nhóm sản phẩm/dịch vụ.

---

### Quan hệ giữa Category và Listing Type

- **Mỗi Category (danh mục) luôn liên kết với 1 Listing Type (kiểu dữ liệu listing).**
- **Nhiều Category khác nhau có thể dùng chung 1 Listing Type.** Ví dụ: các danh mục "SUV", "Sedan", "Truck" đều sử dụng chung Listing Type "Cars".
- Mô hình này giúp bạn tái sử dụng schema dữ liệu và tiêu chí đánh giá cho nhiều nhóm khác nhau, đồng thời vẫn đảm bảo mỗi nhóm có thể trình bày, SEO, filter, landing page riêng.
- Listing (bản ghi dữ liệu) sẽ liên kết với Category, và từ đó truy ngược được Listing Type phù hợp để render đúng form nhập liệu và tiêu chí review.

## Giấy phép

[MIT License](LICENSE)

---

## TODO: Tự động hóa i18n cho Strapi

- Khi tạo bản dịch mới (locale mới) cho một entry, cần script tự động:
  - Map lại toàn bộ relation (categories, criteria, ...) sang đúng bản dịch ở locale mới nếu có, nếu không thì giữ bản English.
  - (Nâng cao) Tích hợp dịch tự động các trường text (title, description, slug, ...) qua API dịch (Google Translate, Deepl, ...).
- Có thể thực hiện bằng custom lifecycle hoặc custom endpoint/script.
- Ưu tiên: Làm script map relation tự động trước, sau đó tích hợp dịch tự động.

> Kế hoạch này nhằm tối ưu workflow nhập liệu đa ngôn ngữ, giảm thao tác thủ công khi quản lý content trên Strapi.
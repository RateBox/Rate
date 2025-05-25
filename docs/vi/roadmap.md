# Roadmap

## Tự động hóa i18n cho Strapi

- Khi tạo bản dịch mới (locale mới) cho một entry, cần script tự động:
  - Map lại toàn bộ relation (categories, criteria, ...) sang đúng bản dịch ở locale mới nếu có, nếu không thì giữ bản English.
  - (Nâng cao) Tích hợp dịch tự động các trường text (title, description, slug, ...) qua API dịch (Google Translate, Deepl, ...).
- Có thể thực hiện bằng custom lifecycle hoặc custom endpoint/script.
- Ưu tiên: Làm script map relation tự động trước, sau đó tích hợp dịch tự động.

> Kế hoạch này nhằm tối ưu workflow nhập liệu đa ngôn ngữ, giảm thao tác thủ công khi quản lý content trên Strapi.

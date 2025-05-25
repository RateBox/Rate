# Khắc phục lỗi "Failed to fetch dynamically imported module" trên Strapi Admin

## Triệu chứng
- Khi truy cập Strapi Admin, gặp lỗi:
  ```
  TypeError: Failed to fetch dynamically imported module: http://localhost:1337/admin/node_modules/.strapi/vite/deps/HomePage-XXXXX.js?v=xxxxxxx
  ```
- Giao diện không hiển thị, hoặc không load được trang.

## Nguyên nhân
- Cache hoặc node_modules bị lỗi/hỏng do thay đổi code, cài/xoá plugin, hoặc build lỗi.
- Process Strapi cũ chưa tắt hẳn, gây khoá file hệ thống (Windows).
- Xung đột hoặc lỗi khi build lại admin panel.

## Cách xử lý chuẩn

1. **Tắt toàn bộ process node/strapi:**
   ```powershell
   Get-Process node | Stop-Process -Force
   ```
2. **Xoá sạch cache, build, node_modules, lockfile:**
   ```powershell
   Remove-Item -Recurse -Force node_modules, .cache, build, yarn.lock, package-lock.json
   ```
   (Có thể cần quyền admin hoặc khởi động lại máy nếu bị khoá file)
3. **Clean cache Yarn (nếu dùng Yarn):**
   ```powershell
   yarn cache clean
   ```
4. **Cài lại dependency:**
   ```powershell
   yarn install
   ```
5. **Build lại admin panel:**
   ```powershell
   yarn build
   ```
6. **Khởi động lại Strapi:**
   ```powershell
   yarn develop
   ```
7. **Làm mới trình duyệt (Ctrl+F5)** để xoá cache giao diện.

## Lưu ý
- Nếu vẫn lỗi, thử đổi về Node LTS (18 hoặc 20).
- Không nên vừa dùng Yarn vừa dùng NPM (tránh xung đột lockfile).
- Nếu lỗi liên quan plugin custom, kiểm tra lại code và quá trình build của plugin.

---
**Tài liệu này được bổ sung sau khi gặp lỗi thực tế trên môi trường Windows/Strapi v4.**

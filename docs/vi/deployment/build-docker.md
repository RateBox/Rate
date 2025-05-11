# Hướng dẫn xử lý package & build Docker Strapi

## 1. Khi gặp lỗi package/dependency (Strapi, plugin...)

### A. Kiểm tra & update package

- Kiểm tra version thực tế trong `package.json` và `yarn.lock`.
- Đảm bảo các package core Strapi, plugin, @strapi/design-system, @strapi/icons đúng version yêu cầu.
- Nếu cần ép version, dùng trường `resolutions` trong `package.json`.

### B. Quy trình clean build chuẩn

1. Xoá cache, node_modules, lockfile:
   ```bash
   rm -rf node_modules yarn.lock
   cd strapi && rm -rf node_modules yarn.lock && cd ..
   ```
2. Cài lại dependency:
   ```bash
   yarn install --ignore-engines
   ```
3. Build lại Docker image Strapi:
   ```bash
   docker compose build --no-cache strapi
   ```
4. Khởi động lại container:
   ```bash
   docker compose up -d strapi
   ```

### C. Kiểm tra version thực tế trong container

```bash
docker compose exec strapi node -p "require('@strapi/design-system/package.json').version"
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

### D. Lưu ý quan trọng

- **Không cần chạy lệnh xoá cache hay build lại FE admin trong container** (ví dụ: `docker compose exec strapi rm -rf ...` hoặc `docker compose exec strapi yarn build`) nếu đã build lại image sạch.
- Chỉ chạy lệnh trong container khi dev/debug đặc biệt, không phải quy trình chuẩn production.

### E. Ví dụ quy trình update plugin Strapi chuẩn

```bash
# 1. Update plugin (ví dụ lên version mới nhất)
cd strapi
yarn add strapi-plugin-locale-select@latest

# 2. Clean node_modules, lockfile (nếu cần)
rm -rf node_modules yarn.lock
cd .. && rm -rf node_modules yarn.lock

# 3. Cài lại dependencies
yarn install --ignore-engines

# 4. Build lại Docker image Strapi
docker compose build --no-cache strapi

# 5. Khởi động lại container
docker compose up -d strapi

# 6. Kiểm tra version plugin trong container
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

## 2. Các tình huống build Docker

| Tình huống                            | Lệnh build & xử lý                                                          |
| ------------------------------------- | --------------------------------------------------------------------------- |
| **Build nhanh (không đổi code)**      | `docker compose up -d strapi`                                               |
| **Build lại khi đổi code**            | `docker compose build --no-cache strapi` <br> `docker compose up -d strapi` |
| **Build sạch khi đổi package/plugin** | Quy trình clean build như trên                                              |
| **Lỗi cache FE admin (trắng trang)**  | Build lại image sạch, up lại container, kiểm tra log nếu vẫn lỗi            |

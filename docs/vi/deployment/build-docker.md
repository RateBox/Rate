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
4. Xoá cache FE admin trong container:
   ```bash
   docker compose exec strapi rm -rf .cache build node_modules/.cache node_modules/.strapi
   ```
5. Build lại FE admin:
   ```bash
   docker compose exec strapi yarn build
   ```
6. Restart container:
   ```bash
   docker compose restart strapi
   ```

### C. Kiểm tra version thực tế trong container

```bash
docker compose exec strapi node -p "require('@strapi/design-system/package.json').version"
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

## 2. Các tình huống build Docker

| Tình huống                           | Lệnh build & xử lý                                                           |
| ------------------------------------ | ---------------------------------------------------------------------------- |
| **Build nhanh (không đổi code)**     | `docker compose up -d strapi`                                                |
| **Build lại khi đổi code**           | `docker compose exec strapi yarn build` <br> `docker compose restart strapi` |
| **Build sạch khi đổi package**       | `docker compose build --no-cache strapi` <br> `docker compose up -d strapi`  |
| **Build sạch khi update plugin**     | Xoá cache, build lại FE admin như hướng dẫn ở trên                           |
| **Lỗi cache FE admin (trắng trang)** | Xoá cache, build lại FE admin trong container, restart lại Strapi            |

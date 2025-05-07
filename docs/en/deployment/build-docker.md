# How to handle package issues & build Docker for Strapi

## 1. When facing package/dependency issues (Strapi, plugin...)

### A. Check & update packages

- Check actual versions in `package.json` and `yarn.lock`.
- Make sure core Strapi, plugins, @strapi/design-system, @strapi/icons are at the required versions.
- If needed, use the `resolutions` field in `package.json` to force versions.

### B. Standard clean build process

1. Remove cache, node_modules, lockfile:
   ```bash
   rm -rf node_modules yarn.lock
   cd strapi && rm -rf node_modules yarn.lock && cd ..
   ```
2. Reinstall dependencies:
   ```bash
   yarn install --ignore-engines
   ```
3. Rebuild Docker image for Strapi:
   ```bash
   docker compose build --no-cache strapi
   ```
4. Remove FE admin cache inside container:
   ```bash
   docker compose exec strapi rm -rf .cache build node_modules/.cache node_modules/.strapi
   ```
5. Rebuild FE admin:
   ```bash
   docker compose exec strapi yarn build
   ```
6. Restart container:
   ```bash
   docker compose restart strapi
   ```

### C. Check actual version inside container

```bash
docker compose exec strapi node -p "require('@strapi/design-system/package.json').version"
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

## 2. Docker build scenarios

| Scenario                              | Build & handling commands                                                    |
| ------------------------------------- | ---------------------------------------------------------------------------- |
| **Quick build (no code change)**      | `docker compose up -d strapi`                                                |
| **Rebuild after code change**         | `docker compose exec strapi yarn build` <br> `docker compose restart strapi` |
| **Clean build after package change**  | `docker compose build --no-cache strapi` <br> `docker compose up -d strapi`  |
| **Clean build after plugin update**   | Remove cache, rebuild FE admin as above                                      |
| **FE admin cache error (blank page)** | Remove cache, rebuild FE admin in container, restart Strapi                  |

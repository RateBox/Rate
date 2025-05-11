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
4. Restart container:
   ```bash
   docker compose up -d strapi
   ```

### C. Check actual version inside container

```bash
docker compose exec strapi node -p "require('@strapi/design-system/package.json').version"
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

### D. Important notes

- **No need to remove cache or rebuild FE admin inside the container** (e.g. `docker compose exec strapi rm -rf ...` or `docker compose exec strapi yarn build`) if you already built a clean image.
- Only run commands inside the container for special dev/debug cases, not for standard production workflow.

### E. Example: Standard Strapi plugin update workflow

```bash
# 1. Update plugin (e.g. to latest version)
cd strapi
yarn add strapi-plugin-locale-select@latest

# 2. Clean node_modules, lockfile (if needed)
rm -rf node_modules yarn.lock
cd .. && rm -rf node_modules yarn.lock

# 3. Reinstall dependencies
yarn install --ignore-engines

# 4. Rebuild Docker image for Strapi
docker compose build --no-cache strapi

# 5. Restart container
docker compose up -d strapi

# 6. Check plugin version inside container
docker compose exec strapi node -p "require('strapi-plugin-locale-select/package.json').version"
```

## 2. Docker build scenarios

| Scenario                              | Build & handling commands                                                   |
| ------------------------------------- | --------------------------------------------------------------------------- |
| **Quick build (no code change)**      | `docker compose up -d strapi`                                               |
| **Rebuild after code change**         | `docker compose build --no-cache strapi` <br> `docker compose up -d strapi` |
| **Clean build after package/plugin**  | Standard clean build process as above                                       |
| **FE admin cache error (blank page)** | Build a clean image, up the container, check logs if still error            |

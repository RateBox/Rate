# Installation Guide

## System Requirements

- Docker & Docker Compose
- Node.js 18+ (for local development)
- Git

## Development Environment Setup

1. Clone repository:
```bash
git clone https://github.com/RateBox/Rate.git
cd Rate
```

2. Create environment files:
```bash
# .env for Next.js
cp next/.env.example next/.env

# .env for Strapi
cp strapi/.env.example strapi/.env

# .env for PostgreSQL
cp postgres/.env.example postgres/.env
```

3. Start containers:
```bash
docker-compose up -d
```

4. Access services:

- Frontend: http://localhost:3001
- Strapi Admin: http://localhost:1337/admin
- PostgreSQL: localhost:5432

## Strapi Configuration

1. Access Strapi Admin Panel (http://localhost:1337/admin)
2. Create the first admin account
3. Configure collection types and components
4. Create API token for frontend access

## Next.js Configuration

1. Update environment variables in `next/.env`:
```
NEXT_PUBLIC_API_URL=http://localhost:1337
NEXT_INTERNAL_API_URL=http://strapi:1337
```

2. Restart Next.js container:
```bash
docker-compose restart next
```

## Docker Configuration Explained

### Development vs Production

We use different Dockerfile configurations for development and production environments:

- **Development:** Uses `yarn dev` to run Next.js in development mode
- **Production:** Would use `yarn build && yarn start` for production builds

In the Dockerfile for Next.js:
```dockerfile
FROM node:lts

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3001

# Run in development mode
CMD ["yarn", "dev"]
```

### Directory Mounting
For Strapi, we follow the official recommendation to mount specific directories:
```yaml
volumes:
  - ./strapi/config:/opt/app/config
  - ./strapi/src:/opt/app/src
  - ./strapi/package.json:/opt/app/package.json
  - ./strapi/yarn.lock:/opt/app/yarn.lock
  - ./strapi/.env:/opt/app/.env
  - ./strapi/public/uploads:/opt/app/public/uploads
```

## Backup & Restore

### Backup

For a complete backup, use the following:

```bash
# Export Strapi data
docker-compose exec strapi yarn strapi export --no-encrypt

# Dump PostgreSQL database
docker-compose exec rateDB pg_dump -U joy -d rate > backup/rate_$(Get-Date -Format 'yyyyMMdd_HHmmss').sql

# Copy Strapi export from container
docker cp strapi:/opt/app/export_XXXXXXXX.tar.gz backup/strapi-export-$(Get-Date -Format 'yyyyMMdd_HHmmss').tar.gz

# Commit changes to Git
git add .
git commit -m "Backup: $(Get-Date -Format 'yyyyMMdd_HHmmss')"
git push
```

### Restore database

```bash
docker exec -i rateDB psql -U joy -d rate < backup/your-backup-file.sql
```

## Troubleshooting

### Database Connection Issues
- Check environment variables in `docker-compose.yml` and `.env` files
- Ensure the PostgreSQL container is running
- Check logs: `docker-compose logs rateDB`

### Strapi Issues
- Check Strapi logs: `docker-compose logs strapi`
- Delete `.cache` and `build` directories if needed
- Rebuild container: `docker-compose build strapi`

### Next.js Issues
- Check Next.js logs: `docker-compose logs next`
- For build errors, switch to dev mode by updating the Dockerfile to use `CMD ["yarn", "dev"]`
- For "Cannot read properties of undefined" errors, check the API connection and response from Strapi
- For internationalization errors, verify the middleware.ts and i18n configuration

### API Connection Issues
- Check if Strapi is accessible: `curl http://localhost:1337/api/global`
- Within Docker network, use service names: `docker-compose exec next curl http://strapi:1337/api/global`
- Verify environment variables for API URLs are correct

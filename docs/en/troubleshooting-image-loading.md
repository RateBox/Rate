# Troubleshooting Image Loading Issues from Strapi in Next.js

## Problem
When deploying a Next.js application with Strapi CMS in a Docker environment, you may encounter issues with loading images from Strapi. This typically occurs due to misconfiguration between services.

## Root Causes
1. **Incorrect URLs**: Mismatch between internal URLs (within Docker network) and public URLs (from browser)
2. **Incorrect Volume Mounting**: Strapi's `public/uploads` directory not mounted correctly
3. **Image Optimizer Configuration**: Next.js Image Optimizer not configured with correct Strapi domain and port

## Solutions

### 1. Configure Correct URLs
In `next/.env`:
```env
# Internal URL for API calls within Docker network
NEXT_INTERNAL_API_URL=http://strapi:1337

# Public URL for media files
NEXT_PUBLIC_STRAPI_MEDIA_URL=http://localhost:1337
```

### 2. Mount Volumes Correctly
In `docker-compose.yml`, configure Strapi service mounts:
```yaml
services:
  strapi:
    volumes:
      - ./strapi/config:/opt/app/config
      - ./strapi/src:/opt/app/src
      - ./strapi/package.json:/opt/app/package.json
      - ./strapi/yarn.lock:/opt/app/yarn.lock
      - ./strapi/.env:/opt/app/.env
      - ./strapi/public/uploads:/opt/app/public/uploads
```

### 3. Configure Image Optimizer
In `next/.env`:
```env
# Image Optimizer settings
NEXT_PUBLIC_IMAGE_HOSTNAME=strapi
NEXT_PUBLIC_IMAGE_PORT=1337
```

In `next.config.mjs`, configure `remotePatterns` for Image Optimizer:
```javascript
{
  images: {
    remotePatterns: [
      {
        protocol: "http",
        hostname: "localhost",
        port: "1337",
        pathname: "/uploads/**",
      },
      {
        protocol: "http",
        hostname: "strapi",
        port: "1337",
        pathname: "/uploads/**",
      },
    ],
  }
}
```

### 4. Handle Image URLs
In `lib/strapi/strapiImage.ts`, use `NEXT_PUBLIC_API_URL` for all cases:
```typescript
export function strapiImage(url: string): string {
  if (url.startsWith("/")) {
    // Always use NEXT_PUBLIC_API_URL because:
    // 1. Next.js Image is configured with remotePatterns
    // 2. Browser needs accessible URL
    return process.env.NEXT_PUBLIC_API_URL + url
  }
  return url
}
```

**Note**: 
- No need to differentiate between server-side and client-side URLs as Next.js Image Optimizer will handle this through `remotePatterns`
- No need to configure `rewrites()` in `next.config.mjs`

## Verification
1. Restart all containers:
```bash
docker compose down && docker compose up -d
```

2. Check service logs:
```bash
docker logs strapi
docker logs next
```

## Notes
- Ensure environment variables are updated in both `.env` and `.env.example` files
- Check access permissions for the `public/uploads` directory in the Strapi container
- Verify that Strapi is serving media files correctly 
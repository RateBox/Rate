import { unstable_noStore as noStore } from 'next/cache';

// Luôn dùng internal URL (strapi:1337) cho Image Optimizer
const IMAGE_URL = 'http://strapi:1337';

export function strapiImage(url: string): string {
  noStore();
  if (!url) return '';
  
  if (url.startsWith("/")) {
    return `${IMAGE_URL}${url}`;
  }
  return url;
}
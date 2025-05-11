import { unstable_noStore as noStore } from 'next/cache';

// Use localhost for dev local
const IMAGE_URL = 'http://localhost:1337';

export function strapiImage(url: string): string {
  noStore();
  if (!url) return '';
  
  if (url.startsWith("/")) {
    return `${IMAGE_URL}${url}`;
  }
  return url;
}
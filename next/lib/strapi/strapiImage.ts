import { unstable_noStore as noStore } from 'next/cache';

export function strapiImage(url: string): string {
  noStore();
  if (url.startsWith("/")) {
    if (!process.env.NEXT_PUBLIC_API_URL && document?.location.host.endsWith(".strapidemo.com")) {
      return `https://${document.location.host.replace("client-", "api-")}${url}`
    }

    // Use internal URL for server-side
    if (typeof window === 'undefined') {
      return process.env.NEXT_INTERNAL_API_URL + url
    }

    // Use public URL for client-side
    return "http://strapi:1337" + url
  }
  return url
}
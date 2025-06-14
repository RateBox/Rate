"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.formatStrapiMediaUrl = void 0;
/**
 * Function to format Strapi media URLs. There are 2 types of upload:
 * - S3 bucket - in this case, the URL is already correct and starts with https
 * - local upload - in this case, the URL starts with /uploads and we need to add API url prefix
 * (this happens in route handler for Strapi assets)
 *
 * TODO: make this generic - return same type as argument has
 */
const formatStrapiMediaUrl = (imageUrl) => {
    if (!imageUrl) {
        return undefined;
    }
    if (typeof imageUrl === "string") {
        if (!imageUrl.startsWith("http")) {
            if (imageUrl.startsWith("/uploads")) {
                return `/api/asset${imageUrl}`;
            }
        }
    }
    return imageUrl;
};
exports.formatStrapiMediaUrl = formatStrapiMediaUrl;

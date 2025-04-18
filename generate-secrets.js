import crypto from 'crypto';

function generateSecret(length = 32) {
    return crypto.randomBytes(length).toString('base64');
}

const secrets = {
    STRAPI_JWT_SECRET: generateSecret(),
    STRAPI_ADMIN_JWT_SECRET: generateSecret(),
    STRAPI_APP_KEYS: `${generateSecret()},${generateSecret()}`,
    STRAPI_API_TOKEN_SALT: generateSecret(),
    STRAPI_TRANSFER_TOKEN_SALT: generateSecret(),
    POSTGRES_PASSWORD: generateSecret(16),
};

console.log('=== GitHub Secrets ===');
console.log('Copy từng secret dưới đây và thêm vào GitHub Secrets:');
console.log('');

Object.entries(secrets).forEach(([key, value]) => {
    console.log(`${key}:`);
    console.log(value);
    console.log('');
}); 
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = ({ env }) => {
    return {
        connection: {
            client: "postgres",
            connection: {
                connectionString: env("DATABASE_URL"),
                host: env("DATABASE_HOST", "localhost"),
                port: env.int("DATABASE_PORT", 5432),
                database: env("DATABASE_NAME", "strapi"),
                user: env("DATABASE_USERNAME", "strapi"),
                password: env("DATABASE_PASSWORD", "strapi"),
                ssl: env.bool("DATABASE_SSL", true)
                    ? { rejectUnauthorized: false }
                    : false,
                schema: env("DATABASE_SCHEMA", "public"),
            },
            debug: false,
        },
    };
};

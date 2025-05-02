FROM node:lts

WORKDIR /opt/app

# Install dependencies first to leverage Docker cache
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --ignore-engines

# Copy source code
COPY . .

# Debug environment variables
ENV NODE_ENV=development
ENV DEBUG=strapi:*
ENV STRAPI_LOG_LEVEL=debug
ENV STRAPI_LOG_TIMESTAMP=true
ENV STRAPI_LOG_PRETTY=true

# Expose port
EXPOSE 1337

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:1337/_health || exit 1

# Start Strapi in development mode
CMD ["yarn", "develop"]

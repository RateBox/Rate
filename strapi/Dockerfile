FROM node:lts

WORKDIR /opt/app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --ignore-engines

# Copy source code
COPY . .

EXPOSE 1337

# Debug environment variables
ENV NODE_ENV=development
ENV DEBUG=strapi:*
ENV STRAPI_LOG_LEVEL=debug
ENV STRAPI_LOG_TIMESTAMP=true
ENV STRAPI_LOG_PRETTY=true

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:1337/_health || exit 1

CMD ["yarn", "develop"]

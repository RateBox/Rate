FROM node:lts

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3001

# Chạy trong chế độ development thay vì production
CMD ["yarn", "dev"]

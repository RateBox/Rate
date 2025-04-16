FROM node:lts

WORKDIR /opt/app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

EXPOSE 3001

CMD ["yarn", "start", "-p", "3001"]

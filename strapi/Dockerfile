FROM node:lts

WORKDIR /opt/app

COPY package.json yarn.lock ./

RUN yarn install --ignore-engines

COPY . .

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]

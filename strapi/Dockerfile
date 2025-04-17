FROM node:lts

WORKDIR /opt/app

COPY package.json yarn.lock ./

RUN yarn install --ignore-engines

COPY . .

EXPOSE 1337

CMD ["yarn", "develop"]

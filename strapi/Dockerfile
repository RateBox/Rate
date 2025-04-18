FROM node:lts

WORKDIR /opt/app

COPY package.json yarn.lock ./

RUN yarn install --ignore-engines

COPY . .

RUN chown -R node:node /opt/app

USER node

EXPOSE 1337

ENV NODE_ENV=development

CMD ["yarn", "develop"]

FROM node:18-alpine AS build

WORKDIR /opt/node_app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

CMD ["node", "index.js"]

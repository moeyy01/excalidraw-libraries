FROM node:14-alpine AS build

WORKDIR /opt/node_app

COPY package.json yarn.lock ./
RUN yarn --ignore-optional --network-timeout 600000

COPY . .

CMD ["node", "index.js"]

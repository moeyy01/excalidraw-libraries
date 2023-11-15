FROM node:18-alpine AS build

WORKDIR /opt/node_app

RUN apk add --no-cache python3 py3-pip && \
    pip3 install --upgrade pip && \
    pip3 install google-api-python-client oauth2client black

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

CMD ["node", "index.js"]

FROM node:18-alpine AS build

WORKDIR /opt/node_app

COPY . .

RUN /bin/sh -c "npm install && npm run build"

CMD ["node", "index.js"]

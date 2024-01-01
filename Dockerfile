# Stage 1: Python dependencies
FROM node:18-alpine AS python-build

WORKDIR /opt/python

RUN apk add --no-cache python3 py3-pip

RUN python3 -m venv /opt/venv

RUN . /opt/venv/bin/activate && \
    pip3 install --upgrade pip && \
    pip3 install google-api-python-client oauth2client black

FROM node:18-alpine AS build

WORKDIR /opt/node_app

COPY --from=python-build /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

RUN yarn build

CMD ["node", "index.js"]

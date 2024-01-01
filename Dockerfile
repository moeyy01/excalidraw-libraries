FROM node:18-slim

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN python3 -m venv /venv

ENV PATH="/venv/bin:$PATH"

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

RUN pip install --upgrade google-api-python-client oauth2client black

COPY . .

RUN yarn build

EXPOSE 3000

CMD ["yarn", "run", "start"]

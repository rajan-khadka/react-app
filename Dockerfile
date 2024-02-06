FROM node:20-alpine3.18 as builder

WORKDIR /app

COPY package.* .

RUN npm install

COPY . .

RUN npm run build

RUN npm i -g serve

CMD [ "serve", "-s", "dist" ]
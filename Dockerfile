FROM node:20-alpine3.18 as builder
WORKDIR /app
COPY package.* .
RUN yarn
COPY . .
RUN yarn build


FROM nginx:alpine3.18
COPY --from=builder /app/dist /usr/share/nginx/html
COPY --from=builder /app/nginx/ssl /etc/nginx/ssl
COPY --from=builder /app/nginx/nginx.conf /etc/nginx/
COPY --from=builder /app/nginx/default.conf /etc/nginx/conf.d/
CMD ["nginx", "-g", "daemon off;"]

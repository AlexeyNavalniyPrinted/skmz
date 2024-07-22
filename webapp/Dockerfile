# RUN IN ROOT PROJECT DIRECTORY

FROM node:12.14-alpine AS JS_BUILD
WORKDIR webapp

COPY webapp/package.json webapp/package-lock.json ./

ENV CI=1

RUN npm ci

COPY webapp .

RUN npm run build --prod

FROM nginx:alpine AS RUNTIME
EXPOSE 80

WORKDIR /usr/share/nginx/html

RUN rm -rf /usr/share/nginx/html/*

COPY --from=JS_BUILD /webapp/build .
COPY ./webapp/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
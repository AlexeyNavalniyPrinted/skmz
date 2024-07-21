FROM node:12.14 AS JS_BUILD
COPY webapp /webapp
WORKDIR webapp
RUN npm install && npm run build --prod

FROM alpine:3.11
COPY --from=JS_BUILD /webapp/build* ./webapp/
CMD ./server

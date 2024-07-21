FROM node:12.14 AS JS_BUILD
WORKDIR webapp
COPY webapp .
RUN npm install && npm run build --prod

FROM alpine:3.11
EXPOSE 3000

WORKDIR webapp

COPY --from=JS_BUILD /webapp/build* .

RUN apk add --no-cache shadow && useradd usr -u 1000 --user-group && chown usr:usr .

USER usr

CMD .

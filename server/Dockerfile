FROM golang:1.13.6-alpine AS GO_BUILD
COPY server /server
WORKDIR /server
RUN apk add build-base
RUN go build -o /go/bin/server

FROM alpine:3.11 AS RUNTIME
EXPOSE 8080

RUN apk add --no-cache shadow && useradd usr -u 10001 --user-group

WORKDIR /server

COPY --from=GO_BUILD /go/bin/server ./

RUN chown usr:usr /server

USER usr

CMD ./server

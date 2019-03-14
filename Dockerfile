FROM golang:1.12.0-alpine3.9

COPY . /go/src/github.com/rgannu/burrow-graphite
WORKDIR /go/src/github.com/rgannu/burrow-graphite

RUN go build

ENV BURROW_ADDR http://localhost:8000
ENV GRAPHITE_HOST 192.168.99.100
ENV GRAPHITE_PORT 2003
ENV INTERVAL 30

CMD ./burrow-graphite --burrow-addr $BURROW_ADDR --graphite-host $GRAPHITE_HOST --graphite-port $GRAPHITE_PORT --interval $INTERVAL

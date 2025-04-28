FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

COPY init.sh .

RUN chmod +x vault/init.sh

ENTRYPOINT ["./init.sh"]

FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

COPY init.sh ./init.sh

RUN chmod +x ./init.sh

ENTRYPOINT ["./init.sh"]

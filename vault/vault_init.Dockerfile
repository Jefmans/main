FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

COPY init.sh .

RUN echo "Contents of /vault:" && ls -la /vault

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]

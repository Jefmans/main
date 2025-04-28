FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

RUN echo "Before copying:"
RUN ls -la /vault

COPY init.sh .

RUN echo "After copying init.sh:"
RUN ls -la /vault

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]

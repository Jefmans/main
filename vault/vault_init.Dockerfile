FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

RUN echo "Before copying:"
RUN ls -la /vault

RUN echo "Listing files BEFORE COPY:" && ls -l /
RUN echo "Listing files in WORKDIR /vault BEFORE COPY:" && ls -l /vault

COPY init.sh .

RUN echo "Listing files AFTER COPY:" && ls -l /vault


RUN echo "After copying init.sh:"
RUN ls -la /vault

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]

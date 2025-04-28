FROM alpine:3.18

WORKDIR /vault

RUN apk add --no-cache curl

# Debug info
RUN echo "Before copying:" && pwd && ls -la

COPY init.sh .

# Debug info
RUN echo "After copying init.sh:" && pwd && ls -la

# Make script executable (correct path!)
RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]

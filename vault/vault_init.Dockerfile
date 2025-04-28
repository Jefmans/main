FROM alpine:3.18

# Install curl
RUN apk add --no-cache curl

# Set working directory inside container
WORKDIR /vault

# Debug step: show where we are
RUN echo "Before copying:" && pwd && ls -la

# Copy the init.sh script into /vault inside container
COPY init.sh .

# Debug step: show after copying
RUN echo "After copying init.sh:" && pwd && ls -la

# Make init.sh executable
RUN chmod +x init.sh

# Set entrypoint to run the script
ENTRYPOINT ["./init.sh"]

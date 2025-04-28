FROM alpine:3.18

# Install curl once during build
RUN apk add --no-cache curl

# Set working dir
WORKDIR /vault

# Copy your script into container
COPY init.sh .

# Make it executable
RUN chmod +x init.sh

# Set default entrypoint
ENTRYPOINT ["./init.sh"]

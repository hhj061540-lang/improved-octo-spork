# Use the official lightweight Go image
FROM golang:1.22-alpine

# Install wget to fetch the script from GitHub
RUN apk add --no-cache wget

# Set the working directory inside the container
WORKDIR /app

# Download server.go from your repository
RUN wget https://raw.githubusercontent.com/hhj061540-lang/improved-octo-spork/refs/heads/main/server.go

# Initialize the Go module
RUN go mod init vpnserver

# Build the Go application into a binary named 'server'
RUN go build -o server server.go

# Expose port 3000 for the VPN control panel
EXPOSE 3000

# Set default environment variables
ENV PORT=3000

# Run the compiled server binary
CMD ["./server"]

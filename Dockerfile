# -------------------------
# Stage 1: Build
# -------------------------
FROM golang:1.22 AS builder

# Set working directory inside container
WORKDIR /app

# Copy go.mod and go.sum first (better caching)
COPY go.mod go.sum ./
RUN go mod download

# Copy rest of the source code
COPY . .

# Build the Go binary
RUN go build -o app .

# -------------------------
# Stage 2: Runtime
# -------------------------
FROM debian:bullseye-slim

# Set working directory
WORKDIR /app

# Copy binary from builder
COPY --from=builder /app/app .

# Expose port (adjust if your app uses a different one)
EXPOSE 8080

# Run the app
CMD ["./app"]

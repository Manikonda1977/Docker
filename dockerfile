# syntax=docker/dockerfile:1.4
FROM node:20-alpine AS base

# Set working directory
WORKDIR /app

# Copy application files
COPY main.js .

# Expose port
EXPOSE 8080

# Optional: environment variable to show customization
ENV FOOBAR="Mooo from inside Docker!"

# Run the app
CMD ["node", "main.js"]

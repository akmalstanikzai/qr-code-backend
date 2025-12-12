# Use official Node.js LTS runtime as base image
FROM node:20-alpine

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source code
COPY . .

# Expose the port the app runs on
EXPOSE 4000

# Set environment to production
ENV NODE_ENV=production

# Start the application
CMD ["node", "server.js"]
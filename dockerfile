# Use official Node.js LTS runtime
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# App port (match server.js)
EXPOSE 5000

# Production mode
ENV NODE_ENV=production

# Start app
CMD ["node", "server.js"]

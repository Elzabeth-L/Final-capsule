# Use Node.js LTS version
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001

# Copy application code
COPY . .

# Remove unnecessary files from container
RUN rm -f .env.example docker-compose.yml Dockerfile .dockerignore

# Change ownership to nodejs user
RUN chown -R nodejs:nodejs /app
USER nodejs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "const http = require('http'); \
    const options = { host: 'localhost', port: 3000, path: '/api/health', timeout: 2000 }; \
    const req = http.request(options, (res) => { \
      if (res.statusCode === 200) process.exit(0); \
      else process.exit(1); \
    }); \
    req.on('error', () => process.exit(1)); \
    req.on('timeout', () => { req.destroy(); process.exit(1); }); \
    req.end();"

# Start the application
CMD ["npm", "start"]

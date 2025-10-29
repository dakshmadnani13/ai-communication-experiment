# Multi-stage build for production - optimized for 8-core laptop
FROM node:18-alpine AS base

# Install pnpm and build tools
RUN npm install -g pnpm@8 && \
    apk add --no-cache dumb-init

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* ./

# Install dependencies with optimizations
RUN pnpm install --frozen-lockfile --prefer-offline --no-audit

# Copy source code
COPY . .

# Build the application with optimizations
RUN pnpm build:fast

# Production stage
FROM node:18-alpine AS production

# Install pnpm and runtime dependencies
RUN npm install -g pnpm@8 && \
    apk add --no-cache dumb-init curl

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* ./

# Install production dependencies only
RUN pnpm install --frozen-lockfile --prod --prefer-offline --no-audit

# Copy built application
COPY --from=base /app/dist ./dist

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Change ownership
RUN chown -R nodejs:nodejs /app
USER nodejs

# Set Node.js optimizations for laptop hardware
ENV NODE_OPTIONS="--max-old-space-size=2048 --optimize-for-size --gc-interval=100"
ENV NODE_ENV=production

# Expose port
EXPOSE 3000

# Health check with optimized intervals
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Start the application with optimizations
ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "--max-old-space-size=2048", "--optimize-for-size", "dist/index.js"]


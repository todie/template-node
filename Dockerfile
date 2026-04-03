# syntax=docker/dockerfile:1
# =============================================================================
# Builder
# =============================================================================
FROM node:22-slim AS builder

WORKDIR /app

# Enable pnpm via corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Fetch dependencies (leverages Docker layer cache)
COPY package.json pnpm-lock.yaml ./
RUN pnpm fetch

# Install dependencies offline
COPY . .
RUN pnpm install --offline --frozen-lockfile

# Build
RUN pnpm run build

# =============================================================================
# Runtime
# =============================================================================
FROM node:22-slim AS runtime

# Install dumb-init for proper PID 1 signal handling
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init     && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Non-root user
RUN addgroup --system --gid 1001 nodejs     && adduser --system --uid 1001 --ingroup nodejs nodeuser

# Copy built artifacts and production dependencies
COPY --from=builder --chown=nodeuser:nodejs /app/dist ./dist
COPY --from=builder --chown=nodeuser:nodejs /app/package.json ./package.json
COPY --from=builder --chown=nodeuser:nodejs /app/node_modules ./node_modules

USER nodeuser

EXPOSE 3000

ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "dist/index.js"]

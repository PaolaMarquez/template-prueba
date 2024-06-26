FROM node:20-alpine AS base
RUN apk add --no-cache git libc6-compat
RUN apk update
WORKDIR /app
ENV SCOPE=@avila-tek/admin


FROM base AS builder
# Set working directory
WORKDIR /app
RUN npm install -g turbo
COPY . .
RUN turbo prune ${SCOPE} --docker

# Add lockfile and package.json's of isolated subworkspace
FROM base AS installer
RUN apk add --no-cache libc6-compat
RUN apk update
WORKDIR /app

# First install the dependencies (as they change less often)
COPY .gitignore .gitignore
COPY --from=builder /app/out/json/ .
COPY --from=builder /app/out/package-lock.json ./package-lock.json
RUN npm ci --no-audit

# Build the project
COPY --from=builder /app/out/full/ .
COPY turbo.json turbo.json

# Uncomment and use build args to enable remote caching
# ARG TURBO_TEAM
# ENV TURBO_TEAM=$TURBO_TEAM

# ARG TURBO_TOKEN
# ENV TURBO_TOKEN=$TURBO_TOKEN

RUN npx turbo build --scope=${SCOPE} --filter=${SCOPE} --include-dependencies

FROM base AS runner
WORKDIR /app

ARG TURBO_TOKEN
ARG TURBO_TEAM

ENV TURBO_TOKEN=${TURBO_TOKEN}
ENV TURBO_TEAM=${TURBO_TEAM}
ENV NODE_ENV=production

# Don't run production as root
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs

COPY --from=installer /app/apps/backoffice/next.config.js .
COPY --from=installer /app/apps/backoffice/package.json .

COPY --from=installer --chown=nextjs:nodejs /app/apps/backoffice/.next/standalone ./
COPY --from=installer --chown=nextjs:nodejs /app/apps/backoffice/.next/static ./apps/backoffice/.next/static
COPY --from=installer --chown=nextjs:nodejs /app/apps/backoffice/public ./apps/backoffice/public

CMD node apps/backoffice/server.js

FROM node:18-alpine as builder
WORKDIR /etc/logto
ENV CI=true

COPY . .

# Install dependencies and build
RUN npm add --location=global pnpm@^7.14.0
RUN pnpm i
RUN pnpm build

# Prune unnecessary files for production
RUN rm -rf node_modules connectors/**/node_modules
RUN rm -rf connectors/**/src
RUN rm -rf connectors/**/tsconfig*.json
RUN rm -rf connectors/**/*.config.js

FROM ghcr.io/logto-io/logto:1.0.0-beta.19 as app

WORKDIR /etc/logto

COPY --from=builder /etc/logto/connectors/ ./packages/core/connectors

EXPOSE 3001
ENTRYPOINT ["npm", "start"]

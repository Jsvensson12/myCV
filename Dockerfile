# syntax=docker/dockerfile:1



ARG NODE_VERSION=20.17.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV=development


WORKDIR /usr/src/app

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci

# Run the application as a non-root user.
USER node

# Copy the rest of the source files into the image.
COPY . .

# Expose the port that the application listens on.
EXPOSE 3000


# Run the application.
CMD ["npm", "start"]

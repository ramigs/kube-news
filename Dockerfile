FROM node:16.18.0

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

WORKDIR /app

RUN chown node:node ./

USER node

COPY --chown=node:node src/package*.json ./

RUN npm ci && npm cache clean --force

COPY --chown=node:node src .

EXPOSE 8080

CMD ["node", "server.js"]


FROM node:18-alpine

WORKDIR /app

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001

COPY package*.json ./

RUN npm install --only=production && npm cache clean --force

COPY app.js ./

RUN chown -R nodejs:nodejs /app
USER nodejs

EXPOSE 3000

ENV NODE_ENV=production
ENV PORT=3000

CMD ["node", "app.js"]

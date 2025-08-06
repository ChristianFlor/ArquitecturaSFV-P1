FROM node:22

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080

CMD ["node", "app.js"]

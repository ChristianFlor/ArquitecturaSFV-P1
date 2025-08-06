FROM node:20-alpine

WORKDIR /app

COPY . .

EXPOSE 3000

RUN chmod +x entrypoint.sh

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]


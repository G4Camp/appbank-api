FROM node:14-alpine3.11
ARG SERVER_PORT
ENV PORT=$SERVER_PORT

WORKDIR /home/node/app

COPY . .
RUN apk add --no-cache bash

RUN npm i

RUN npm run build

# RUN npm run typeorm migration:run

EXPOSE $PORT

CMD npm run start:prod
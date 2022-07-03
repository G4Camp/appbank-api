FROM node:16-alpine3.15
ARG SERVER_PORT
ENV PORT=$SERVER_PORT

WORKDIR /home/node/app

COPY . .
RUN apk add --no-cache bash

RUN yarn

RUN yarn build

ENTRYPOINT ["bash", "./.docker/entrypoint.sh"]

EXPOSE $PORT

CMD yarn start:prod

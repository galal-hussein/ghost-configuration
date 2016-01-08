FROM node:0.10.41
MAINTAINER Hussein Galal

ENV PACKAGE_JSON=https://raw.githubusercontent.com/TryGhost/Ghost/master/package.json \
    APP_URL=https://ghost.org/zip/ghost-0.7.4.zip \
    CONSUL_URL=localhost:8500

RUN set -x \
    && apt-get update -q \
    && apt-get install -yq unzip curl jq

RUN mkdir -p /var/www/ghost
RUN mkdir -p /opt/scripts

WORKDIR /var/www/ghost

ADD $APP_URL .
RUN unzip ghost-0.7.4.zip 

ADD $PACKAGE_JSON ./package.json
ADD config.js ./config.js

RUN set -x \
    && npm install --production \
    && npm cache clean

COPY entrypoint.sh  /opt/scripts/
RUN chmod u+x /opt/scripts/*.sh

EXPOSE 2368

#ENTRYPOINT /opt/scripts/entrypoint.sh
ENTRYPOINT npm start --production

#!/bin/bash

# check consul for Mysql service
MYSQL_ADDR=$(curl -s $CONSUL_URL/v1/catalog/service/mysql | jq '.[0].ServiceAddress')
CONFIG_PATH=/var/www/ghost/config.js

if [ "$MYSQL_ADDR" != "null" ] 
then
	LINE_NO=$(sed -n '/connection/=' $CONFIG_PATH)
	sed -i "$(( LINE_NO+1 ))s/.*/\t\thost\t : $MYSQL_ADDR,/g" $CONFIG_PATH
fi

npm start --production

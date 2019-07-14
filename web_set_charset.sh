#!/bin/sh

W_PID=$(docker ps | grep dc_twal_web_1 | awk '{print $1}')
docker exec -it $W_PID echo "AddDefaultCharset utf-8" >> /usr/local/apache2/conf/httpd.conf
docker exec -it $W_PID echo  "IndexOptions Charset=utf-8" >> /usr/local/apache2/conf/httpd.conf
docker exec -it $W_PID echo "IndexOptions FancyIndexing VersionSort NameWidth=* HTMLTable +Charset=UTF-8"  >> /usr/local/apache2/conf/httpd.conf
sleep 2
docker-compose restart web

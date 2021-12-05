#/bin/bash

docker run -itd \
-p 3306:3306 \
--name mysql \
--privileged=true \
--restart=always \
-v /var/lib/docker/volumes/mysql/single/conf:/etc/mysql \
-v /var/lib/docker/volumes/mysql/single/log:/var/log/mysql \
-v /var/lib/docker/volumes/mysql/single/data:/var/lib/mysql \
-v /var/lib/docker/volumes/mysql/single/mysql-files:/var/lib/mysql-files \
-e MYSQL_ROOT_PASSWORD=pojienimasiquanjia \
mysql
chmod -R 777 /var/lib/docker/volumes/mysql/single

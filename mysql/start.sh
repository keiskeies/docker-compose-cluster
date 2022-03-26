#/bin/bash
docker rm -f mysql
docker run -itd \
-p 3306:3306 \
--name mysql \
--privileged=true \
--restart=always \
-v /var/lib/docker/volumes/mysql/single/conf:/etc/mysql \
-v /var/lib/docker/volumes/mysql/single/log:/var/log/mysql \
-v /var/lib/docker/volumes/mysql/single/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=pojienimasiquanjia \
mysql:5.7
chmod -R 777 /var/lib/docker/volumes/mysql/single

firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

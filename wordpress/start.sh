#/bin/bash
docker run -itd \
--privileged=true \
--restart=always \
--name wordpress \
-e WORDPRESS_DB_HOST=172.17.0.1:3306 \
-e WORDPRESS_DB_USER=root \
-e WORDPRESS_DB_PASSWORD=pojienimasiquanjia \
-e WORDPRESS_DB_NAME=wordpress \
-p 30080:80 \
wordpress

# -e WORDPRESS_DB_HOST=mysql \
# --link mysql:mysql \

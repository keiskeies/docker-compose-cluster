#/bin/bash

docker run -itd \
--name nextcloud \
-p 20090:9000 \
-v /var/lib/docker/volumes/nextcloud:/var/www/html \
--link mysql:mysql \
--restart unless-stopped \
--privileged=true \
nextcloud:fpm

chmod -R 777 /var/lib/docker/volumes/nextcloud


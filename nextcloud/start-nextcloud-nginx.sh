#/bin/bash


docker run -itd   \
--restart unless-stopped \
--privileged=true \
--name nginxfornextcloud \
-p 20080:80 \
-p 20443:443 \
-v /var/lib/docker/volumes/nextcloud:/var/www/html \
-v /opt/project/cluster/nextcloud/nginx:/etc/nginx \
--link mysql:mysql  \
--link nextcloud:nextcloud \
nginx


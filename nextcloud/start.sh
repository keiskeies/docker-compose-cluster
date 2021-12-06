#/bin/bash
docker run -itd \
--name=nextcloud \
--restart=always \
--privileged=true \
-p 20080:80 \
-v /var/lib/docker/volumes/nextcloud:/var/www/html \
nextcloud 

chmod -R 777 /var/lib/docker/volumes/nextcloud


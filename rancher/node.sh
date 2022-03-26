#/bin/bash

docker run -d --name=rancher_2 --net rancher_network --ip 172.21.0.3 --restart=unless-stopped -p 28082:8080 -p 29347:9345 -p 23308:3306 -v /var/lib/docker/volumes/rancher/mysql/:/var/lib/mysql rancher/server:stable --db-host 172.21.0.2 --advertise-address 192.168.31.236 --advertise-http-port 28082

docker run -d --name=rancher_3 --net rancher_network --ip 172.21.0.4 --restart=unless-stopped -p 28083:8080 -p 29348:9345 -p 23309:3306 -v /var/lib/docker/volumes/rancher/mysql/:/var/lib/mysql rancher/server:stable --db-host 172.21.0.2 --advertise-address 192.168.31.236 --advertise-http-port 28083

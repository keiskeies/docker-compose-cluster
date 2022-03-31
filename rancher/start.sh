#/bin/bash

docker rm -f rancher_1 rancher_2 rancher_3
docker network rm rancher_network


docker network create rancher_network --subnet 172.21.0.0/16

docker run -d --name=rancher_1 --net rancher_network --ip 172.21.0.2 --restart=unless-stopped -p 8080:8080 -p 9345:9345 -p 23307:3306 -v /var/lib/docker/volumes/rancher/mysql/:/var/lib/mysql rancher/server:stable --advertise-address 192.168.31.236 --advertise-http-port 8080


docker ps -a



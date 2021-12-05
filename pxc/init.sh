#!/bin/bash

firewall-cmd --zone=public --add-port=4001/tcp --permanent
firewall-cmd --zone=public --add-port=13306/tcp --permanent
firewall-cmd --zone=public --add-port=33061/tcp --permanent
firewall-cmd --zone=public --add-port=33062/tcp --permanent
firewall-cmd --zone=public --add-port=33063/tcp --permanent
firewall-cmd --reload
# 1.清理现有容器
echo "\n******* 1.clear all containers start***************\n"
sh ./install_scripts/clear_all.sh
echo "\n******* 1.clear all containers finished***************\n"


mkdir -p /var/lib/docker/volumes/mysql/node1/log
mkdir -p /var/lib/docker/volumes/mysql/node1/data

mkdir -p /var/lib/docker/volumes/mysql/node2/log
mkdir -p /var/lib/docker/volumes/mysql/node2/data

mkdir -p /var/lib/docker/volumes/mysql/node3/log
mkdir -p /var/lib/docker/volumes/mysql/node3/data

chmod -R 777 /var/lib/docker/volumes/mysql/*

# 2.docker-compose 全量部署
echo "\n******* 2.docker-compose start***************\n"
docker-compose -f master.yml up -d
sleep 60
echo "\n******* 2.docker-compose finished***************\n"

# 3.进入pxc节点创建haproxy用户（docker exec container_name 命令 可以在容器外执行命令）
echo "\n******* 3.add user haproxy to pxc start***************\n"
docker cp ./install_scripts/add_user_haproxy_to_pxc.sh  mysql_pxc_node1:/home
docker exec mysql_pxc_node1 sh /home/add_user_haproxy_to_pxc.sh
echo "\n******* 3.add user haproxy to pxc finished***************\n"





docker-compose -f node.yml up -d
docker-compose -f haproxy.yml up -d

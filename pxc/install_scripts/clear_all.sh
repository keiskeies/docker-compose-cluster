o 'clear all containers start'
docker rm -f mysql_pxc_node1 mysql_pxc_node2 mysql_pxc_node3 mysql_pxc_h1
#docker volume rm v1 v2 v3 v4 v5
docker network rm mysql_pxc_network
echo 'clear all containers over'

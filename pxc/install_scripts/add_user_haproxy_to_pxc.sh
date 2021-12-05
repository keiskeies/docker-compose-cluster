#!/bin/bash

mysql -u root -p123456 <<EOF
    CREATE USER "haproxy"@"%" IDENTIFIED BY "";
EOF

while [ $? -ne 0 ]; do
    echo "create user haproxy failed ...please wait"
    sleep 5
    mysql -u root -p123456 <<EOF
     CREATE USER "haproxy"@"%" IDENTIFIED BY "";
EOF
done

echo "create user haproxy success!"
exit

#!/bin/bash

mysql -u root -p <<EOF

    CREATE USER "haproxy"@"%" IDENTIFIED BY "";
EOF
mysql -u root -p123456 <<EOF

         CREATE USER "haproxy"@"%" IDENTIFIED BY "";
EOF


echo "create user haproxy success!"
exit

#!/bin/sh

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    mysql_install_db \
        --user=mysql \
        --datadir=/var/lib/mysql > /dev/null
fi
#!/bin/bash

if [ -f /docker-entrypoint-initdb.d/mysql.sql.template ]; then
    envsubst < /docker-entrypoint-initdb.d/mysql.sql.template > /etc/mysql/init.sql
    rm /docker-entrypoint-initdb.d/mysql.sql.template
fi

exec "$@"

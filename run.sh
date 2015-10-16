#!/bin/bash

sed -i "s/Listen 80/Listen $APACHE_PORT/" /etc/apache2/ports.conf
mkdir -p /srv/webdav
chown www-data /srv/webdav

_term() {
  echo "Caught SIGTERM signal!"
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

/usr/sbin/apache2 -D FOREGROUND &

pid=$!
wait "$pid"

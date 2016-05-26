#!/bin/bash

sed -i "s/Listen 80/Listen $APACHE_PORT/" /etc/apache2/ports.conf
getent passwd $APACHE_UID || groupadd webdav -g $APACHE_GID && useradd -r webdav -u $APACHE_UID -g $APACHE_GID
mkdir -p /srv/common/webdav
chown $APACHE_UID /srv/common/webdav

_term() {
  echo "Caught SIGTERM signal!"
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGTERM

/usr/sbin/apache2 -D FOREGROUND &

pid=$!
wait "$pid"

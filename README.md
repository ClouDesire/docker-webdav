WebDAV Server docker image
==========================

Simple container to expose a WebDAV server (apache2 on ubuntu 14.04):

```
docker run -e 'APACHE_PORT=8080' \
           -p '8080:8080' \
           -v '/tmp/webdav:/srv/webdav' cloudesire/webdav
```

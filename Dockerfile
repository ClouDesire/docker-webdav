FROM ubuntu:14.04

RUN apt-get install -y apache2 && apt-get clean
RUN a2enmod dav dav_fs
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN mkdir -p /var/lock/apache2; chown www-data /var/lock/apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PORT 80

ADD webdav.conf /etc/apache2/sites-enabled/webdav.conf
ADD run.sh /run.sh

VOLUME ["/srv/webdav"]
EXPOSE $APACHE_PORT

CMD ["bash", "-x", "/run.sh"]

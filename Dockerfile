FROM lsiobase/alpine
MAINTAINER sparklyballs

# install packages
RUN \
 apk add --no-cache \
	apache2-ssl \
	apache2-utils \
	fcgi \
	git \
	logrotate \
	nano \
	openssl \
	php5 \
	php5-apache2 \
	php5-cli \
	php5-curl \
	php5-fpm

# add local files
COPY root/ /

# configure apache and fpm
RUN \
 cp /defaults/httpd.conf /etc/apache2/httpd.conf && \
 cp /defaults/php-fpm.conf /etc/php5/php-fpm.conf

# ports and volumes
EXPOSE 80 443
VOLUME /config

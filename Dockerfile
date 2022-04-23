# Dockerfile for lighttpd

FROM alpine

ENV LIGHTTPD_VERSION=1.4.64-r0

RUN apk add --update --no-cache \
	lighttpd=${LIGHTTPD_VERSION} \
	lighttpd-mod_auth \
	php7-common \
	php7-session \
	php7-iconv \
	php7-json \
	php7-gd \
	php7-curl \
	php7-xml \
	php7-mysqli \
	php7-imap \
	php7-cgi \
	fcgi \
	php7-pdo \
	php7-pdo_mysql \
	php7-soap \
	php7-xmlrpc \
	php7-posix \
	php7-mcrypt \
	php7-gettext \
	php7-ldap \
	php7-ctype \
	php7-dom \
	php7-simplexml \
  && rm -rf /var/cache/apk/*

COPY etc/lighttpd/* /etc/lighttpd/
COPY start.sh /usr/local/bin/

RUN mkdir -p /var/run/lighttpd/
RUN chown lighttpd /var/run/lighttpd

EXPOSE 80

VOLUME /var/www/localhost/htdocs
VOLUME /etc/lighttpd

CMD ["start.sh"]

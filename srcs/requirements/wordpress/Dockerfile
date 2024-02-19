FROM	debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y

RUN	apt-get install -y wget
RUN	apt-get install -y php \
php-fpm \
php-mysql \
mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
COPY	./conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN mkdir /run/php

COPY	./tools/config_wordpress.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/config_wordpress.sh
ENTRYPOINT ["/usr/local/bin/config_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD	["/usr/sbin/php-fpm8.2", "-F"]

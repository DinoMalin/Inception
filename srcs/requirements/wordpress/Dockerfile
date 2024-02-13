FROM	debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y

RUN	apt-get install -y wget
RUN	apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY	./tools/config_wordpress.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/config_wordpress.sh
ENTRYPOINT ["/usr/local/bin/config_wordpress.sh"]

WORKDIR /var/www/html

CMD	["/usr/sbin/php-fpm7.3", "-F"]

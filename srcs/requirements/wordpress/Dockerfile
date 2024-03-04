FROM debian:buster

RUN apt-get update
RUN apt-get -y install
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysqli
RUN apt-get -y install php-fpm
RUN apt-get -y install wget
RUN apt-get -y install sendmail

EXPOSE 9000

RUN mkdir -p /run/php/ /var/www/html/wordpress/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/config_wordpress.sh /var/www

RUN chmod +x /var/www/config_wordpress.sh
ENTRYPOINT [ "/var/www/config_wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
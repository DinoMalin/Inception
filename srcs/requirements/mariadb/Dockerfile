FROM	debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

EXPOSE 3306

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb.sh usr/local/bin/

RUN	chmod +x /usr/local/bin/mariadb.sh
ENTRYPOINT	["/usr/local/bin/mariadb.sh"]
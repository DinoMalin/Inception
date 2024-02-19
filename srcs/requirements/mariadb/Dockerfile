FROM	debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/mariadb.sh usr/local/bin/
RUN	chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT	["/usr/local/bin/mariadb.sh"]

CMD	["mysqld", "--user=root", "--bind-address=0.0.0.0", "--skip-networking=0"]

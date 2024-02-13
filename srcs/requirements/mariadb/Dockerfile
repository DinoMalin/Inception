FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/mariadb.sh usr/local/bin/
RUN	chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT	["/usr/local/bin/mariadb.sh"]

CMD	["mysqld", "--bind-address=0.0.0.0"]

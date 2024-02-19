FROM	debian:buster

RUN     apt update -y
RUN     apt upgrade -y
RUN     apt install -y nginx
RUN     apt install -y openssl

RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=LeHavre/L=LeHavre/O=42LeHavre/OU=jcario/CN=jcario"

RUN		mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/

RUN		mkdir -p /var/www/html
RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]

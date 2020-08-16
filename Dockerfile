FROM debian:buster

LABEL maintainer="jamrabhi@student.42.fr"

RUN apt update && \
	apt install -y nginx \
	mariadb-server \
	php-fpm php-mysql \
	wget

COPY srcs/ft_server_conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/ft_server_conf /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	mkdir /var/www/ft_server && \
	cd /tmp/ && \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz -O phpmyadmin.tar.gz && \
	tar -xvf /tmp/phpmyadmin.tar.gz -C /var/www/ft_server/

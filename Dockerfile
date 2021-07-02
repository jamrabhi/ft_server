FROM debian:buster

LABEL maintainer="jamrabhi@student.42.fr"

#PACKAGES INSTALL
RUN apt update && \
	apt install -y nginx \
	mariadb-server \
	php-fpm php-mysql \
	wget

#SSL CONF
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/L=Paris/O=42/CN=localhost"

#NGINX CONF
COPY srcs/ft_server_conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/ft_server_conf /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	mkdir /var/www/ft_server

#MYSQL CONF
RUN service mysql start && \
	mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'pass'" && \
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost'" && \
	mysql -e "CREATE DATABASE wordpress" && \
	mysql -e "FLUSH PRIVILEGES"

#PMA CONF
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz -P /tmp/ && \
	tar -xvf /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz -C /tmp/ && \
	mv /tmp/phpMyAdmin-5.0.2-all-languages /var/www/ft_server/phpmyadmin

#WP CONF
RUN wget https://wordpress.org/wordpress-5.5.tar.gz -P /tmp/ && \
	tar -xvf /tmp/wordpress-5.5.tar.gz -C /var/www/ft_server/

COPY srcs/wp-config.php /var/www/ft_server/wordpress/

#SERVICES LAUNCH & CHECK AUTOINDEX
COPY srcs/script_autoindex.sh /.

ENV INDEX=on

CMD service nginx start && \
	service php7.3-fpm start && \
	service mysql start && \
	bash script_autoindex.sh && \
	sleep infinity


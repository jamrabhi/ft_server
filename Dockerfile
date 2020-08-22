FROM debian:buster

LABEL maintainer="jamrabhi@student.42.fr"

#INSTALLATION DES PAQUETS
RUN apt update && \
	apt install -y nginx \
	mariadb-server \
	php-fpm php-mysql \
	wget

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/L=Paris/O=42/CN=localhost"

COPY srcs/ft_server_conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/ft_server_conf /etc/nginx/sites-enabled/ && \
unlink /etc/nginx/sites-enabled/default && \
mkdir /var/www/ft_server && \
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz -P /tmp/ && \
tar -xvf /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz -C /tmp/ && \
mv /tmp/phpMyAdmin-5.0.2-all-languages /var/www/ft_server/phpmyadmin

RUN service mysql start && \
	mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'pass'" && \
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost'" && \
	mysql -e "CREATE DATABASE wordpress" && \
	mysql -e "FLUSH PRIVILEGES"

RUN wget https://wordpress.org/wordpress-5.5.tar.gz -P /tmp/ && \
	tar -xvf /tmp/wordpress-5.5.tar.gz -C /var/www/ft_server/

COPY srcs/wp-config.php /var/www/ft_server/wordpress/

COPY srcs/service_starter.sh /tmp/

CMD service nginx start && \
	service php7.3-fpm start && \
	service mysql start && \
	sleep infinity

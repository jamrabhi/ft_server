#!/bin/sh

if [ "$INDEX" = "on" ]
	then
		sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/ft_server_conf
		rm /var/www/ft_server/index.nginx-debian.html
		service nginx reload
elif [ "$INDEX" = "off" ]
	then
		sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/ft_server_conf
		cp /var/www/html/index.nginx-debian.html /var/www/ft_server/
		service nginx reload
fi

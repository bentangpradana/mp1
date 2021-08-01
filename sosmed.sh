#!/bin/bash

install_apache() {

        echo "mengupdate apt"
        sudo apt-get update
        echo "menginstall apache webserver"
        sudo apt-get -y install apache2
        echo "selesai menginstall apache"
}

install_php() {
	echo "menginstall php7.4"
	sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
	echo "selesai menginstall php"
}

install_mysql(){
	echo "installing mysql"
	apt-get -y install mysql-server
	echo "selesai menginstall mysql"
	echo "start mysql"
	service mysql start
}

update_mysql(){
echo "setting database"
            echo "membuat database sosialmedia"
            sudo mysql -u root -e "create database dbsosmed"
            echo "creating dbusername and dbpassword"
            sudo mysql -u root -e "CREATE USER 'devopscilsy'@'localhost' IDENTIFIED BY '1234567890';"
            sudo mysql -u root -e "GRANT ALL PRIVILEGES ON dbsosmed . * TO 'devopscilsy'@'localhost';"
            sudo mysql -u root -e "FLUSH PRIVILEGES;"
            echo "selesai"
            }

clone_project() {
        echo "clone repository socialmedia"
        cd /var/www/html
        git clone https://github.com/sdcilsy/sosial-media.git
	sudo mysql -u root dbsosmed  < /var/www/html/sosial-media/dump.sql
        echo "selesai clone repository"
}

install_apache
install_php
install_mysql
update_mysql
clone_project
exit 0


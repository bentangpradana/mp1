#! /bin/bash

echo "Jalankan dalam mode root/sudo"
echo "jalankan script? (y/n)"

read -e run
if [ "$run" == n ] ; then
echo “test”
exit
else

# we'll install 'expect' to input keystrokes/y/n/passwords
apt-get -y install expect 

# Install Apache
apt-get -y install apache2

# Start Apache
service apache2 start

# Restart Apache
service apache2 restart

# Install MySQL
apt-get -y install mysql-server

# Start MySQL
service mysql start

# Create a database named blog
mysql -u root create blog

# Change directory to web root
cd /var/www/html

# Download Wordpress
wget http://wordpress.org/latest.tar.gz

# Extract Wordpress
tar -xzvf latest.tar.gz

# Rename wordpress directory to blog
mv wordpress blog

# Change directory to blog
cd /var/www/html/blog/

# Create a WordPress config file 
mv wp-config-sample.php wp-config.php

#create database dengan nama blog
mysql -u root -e "CREATE DATABASE blog;"
mysql -u root -e "GRANT ALL PRIVILEGES ON blog . * TO 'root1'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

#set database details with perl find and replace
sed -i "s/database_name_here/blog/g" /var/www/html/blog/wp-config.php
sed -i "s/username_here/root1/g" /var/www/html/blog/wp-config.php
sed -i "s/password_here/root1/g" /var/www/html/blog/wp-config.php

#create uploads folder and set permissions
mkdir wp-content/uploads
chmod 777 wp-content/uploads

#remove wp file
rm /var/www/html/latest.tar.gz

echo "selesai instalasi"
fi

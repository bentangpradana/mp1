#!/bin/bash

install_apache() {

	echo "mengupdate repository apt"
	sudo apt-get update
	echo "menginstall apache webserver"
	sudo apt-get -y install apache2
	echo "selesai menginstall apache"
}

clone_project() {
	echo "clone repository landingpage"
	cd /var/www/html
	git clone https://github.com/sdcilsy/landing-page.git 
	echo "selesai clone repository"
}

install_apache
clone_project

exit 0

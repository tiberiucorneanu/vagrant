#Update Packages
apt-get update

#upgrade packages
apt-get upgrade

#basic linux stuff
apt-get install -y git

#apache
apt-get install -y apache2

#enable apache mods
a2enmod rewrite

#add ppa repo
apt-add-repository ppa:ondrej/php
apt-get update

#install php
apt-get install -y php7.2

#php apache mod
apt-get install- libapache2-mod-php7.2

#restore apache
service apache2 restore

#php mods
apt-get install -y php7.2-common
apt-get install -y php7.2-mcrypt
apt-get install -y php7.2-zip

#set mysql pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

#install mysql
apt-get install -y mysql-server

#php-mysql lib
apt-get install -y php.2-mysql

#restore apache
sudo service apache2 restart
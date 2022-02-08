#!/bin/bash
echo "MySql provisioning - begin"
#installare mysql-server
sudo apt-get install mysql-server -y
#impostare la pw di root
#abilitare le connessioni da altri server
echo "Updating bind address"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
#riavviare mysql in modo da applicare le modifiche
echo "Restarting mysql service"
sudo service mysql restart
echo "MySql provisioning - end"
ROOTPASSWD=root
DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass
echo "Creating new db $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%'
identified by '$DBPASSWD'"


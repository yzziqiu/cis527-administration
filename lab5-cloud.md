## Create Droplet
##### on ubuntu client side
###### basic test
```shell
ls -a
cd .ssh
ssh-keygen -t rsa
cat id_rsa.pub
cat id_rsa
ssh-copy-id -?
scp id_rsa.pub yisiqiu@cislinux.cis.ksu.edu:~/
ssh yisiqiu@cislinux.cis.ksu.edu

connected to ssh 
```shell
on cislinux machine
cd .ssh
ls 
cat ~/id_rsa.pub >> authorized_keys2
```

on github you can also use ssh

back to ubuntu
```shell
in ~/.ssh
nano config

Host cis 
IdentityFile ~/.ssh/id_rsa

on mac
cat .ssh/config

on ubuntu 
ssh cis
```
basically
"cat ~/id_rsa.pub >> authorized_keys"



ssh frontend
netstat -peanut //show the ports
nano /etc/ssh/sshd_config //change ports of ssh
sudo ufw status //firewall

```shell
#####database
on backend 
sudo apt-get update

sudo apt-get install mysql-server
no need to 'sudo mysql+secure+installation'
sudo mysql_install_db
sudo nano /etc/mysql/my.conf

cd /etc/mysql/mysql/conf/d/mysqld.conf
bind-address = (backend private IP address) from (127.0.0.1)

sudo systemctl restart mysql
netstat -peanut
check the new ip address

mysql -u root -p 
enter database root password
```

```mysql
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'purpl321' 
//which is password
GRANT ALL PRIVILEGES ON wordpress.

CREATEUSER 'wordpressuser'@'frontend private ip address' IDENTIFIED BY 'purpl321'

GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'frontend private ip address'

FULSH PRIVILEGES;
exit

mysql -u wordpressuser -p 

```
sudo ufw status
sudo ufw allow from private...to any port 

on front end
sudo apt-get install mysql-client
mysql -u wordpressuser -h private backend -p

sudo apt-get install apache2
sudo apt-get install apache2 php php7.0-fpm php7.0-mysql

sudo ufw allow 80
sudo ufw status
cd /var/www/html/
sudo nano test.php
```php
<?php
  phpinfo()
?>
```
tar -zxvf latest.tar.gz
cd wordpress/
ls
sudo rm /var/www/html/index.html
cd ..
sudo rmdir /var/www/html
sudo mv worpress /var/www/html
cd /var/www/html
ls
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
database -> wordpress
username -> wordpressusername
password
hostname


Blog
username -> yisiqiu
email:xx@hotmail.com
ls -al
sudo chown -R 


####ZNC
```shell
sudo apt-get install build-essential libssl-dev libperl-dev pkg-config
cd /usr/local...
sudo make 
sudo make install
adduser znc-admin
su znc-admin
cd ~
no need for SSL

```shell

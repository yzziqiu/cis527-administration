## SSH key
##### on ubuntu client side
###### basic test
```shell
ls -a
cd .ssh
ssh-keygen -t rsa
cat id_rsa.pub
cat id_rsa
ssh-copy-id -?
scp id_rsa.pub yisiu@cislinux.cis.ksu.edu:~/
ssh yisiu@cislinux.cis.ksu.edu

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
## Create Droplet

```
```shell
cat ~/.ssh/id_rsa.pub | ssh root@[your.ip.address.here] "cat >> ~/.ssh/authorized_keys"
ssh root@ip-address
#ssh frontend
netstat -peanut #show the ports
nano /etc/ssh/sshd_config #change ports of ssh
sudo ufw status #firewall
```
```shell
## Configuration
on front end
sudo nano /etc/ssh/sshd_config
# change premitrootlogin to yes
# change port to 22123
# scp -P 22123 id_rsa.pub root@45.55.235.128:~/
adduser cis527
# root privileges
usermod -aG sudo cis527

# copy public key
sudo ufw allow 22123
ssh-copy-id -p 22123 cis527@104.13.125.149
```
##### database


using your computer to generate and install the public key to front end
manual method
##### on your computer


```shell
ssh-add
ssh-copy-id -p 22123 cis527@...ip
cat ~/.ssh/id_rsa.pub
```

on front end, log in as root
```shell
su - cis527
mkdir ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
# copy your id_rsa.pub
chmod 600 ~/.ssh/authorized_keys
```

same for front end to back end
"connection to agent" problem


?every time
eval "$(ssh-agent)"

```shell
ssh-add

sudo systemctl reload sshd


Disable the Root Login via SSH
using root
sudo nano /etc/ssh/sshd_config
PermitRootLogin no

```
##### alias ssh backend
```shell
# contents of ~/.ssh/config
Host backend
    HostName 45.55.235.128
    Port 22123
    User cis527
# private key only

ssh -i ~/.ssh/id_rsa -p 22123 cis527@host.com
```

---

##### configure firewall
```shell
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 22123
sudo ufw allow 80/http
sudo ufw allow 443/https
# lastly


~ only on backend
sudo ufw allow from 104.131.125.149 to any port 22123

sudo ufw enable
(or disable)
```
---
#### timezone
``` shell
 sudo dpkg-reconfigure tzdata
```
#### ntp service
```shell
sudo apt-get update
sudo apt-get install ntp

```
---
#### mysql -server
on backend
``` shell
sudo apt-get update

sudo apt-get install mysql-server
no need to 'sudo mysql+secure+installation'

//mysqld --initialize
//delete the directory /var/lib/mysql and re-initialize the database
 sudo apt-get purge mysql-server
 mkdir -p /var/lib/mysql
Note: If you want to change the default dir above for mysql data storage, then you need to add the new dir in the apparmor config as well in order to use.
```

~~tar -zcvf /msql_backup.tar.gz /etc/mysql /var/lib/mysql
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-5.7 mysql-client-core-5.7
sudo rm -rfv /etc/mysql /var/lib/mysql
sudo apt autoremove
sudo apt autoclean~~

~~sudo apt update    
sudo apt install mysql-server mysql-client --fix-broken --fix-missing~~

---
something wrong here
```shell
sudo mysql_install_db
sudo nano /etc/mysql/my.conf

cd /etc/mysql/mysql.conf.d/mysqld.cnf
bind-address = (backend private IP address) from (127.0.0.1)

sudo systemctl restart mysql
netstat -peanut
check the new ip address

mysql -u root -p
enter database root password
```

```mysql
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password'
//which is password
GRANT ALL PRIVILEGES ON wordpress.

CREATEUSER 'wordpressuser'@'frontend private ip address' IDENTIFIED BY 'purpl321'

GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'frontend private ip address'

FLUSH PRIVILEGES;
exit

mysql -u wordpressuser -p

```
```shell
sudo ufw status
sudo ufw allow from private front end...to any port 3306

on front end
sudo apt-get install mysql-client
mysql -u wordpressuser -h private backend -p

sudo apt-get install apache2 php php7.0-fpm php7.0-mysql

enter front end public ip
sudo ufw allow 80
sudo ufw status
cd /var/www/html/
sudo nano test.php
```
##### phpmyadmin
```php
<?php
  phpinfo()
?>
```

```shell
sudo apt-get install libapache2-mod-php7.0
frontend -ip /test.php

wget http://wordpress.org/latest.tar.gz
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
username -> wordpressuser
password
hostname backend - private
```
---
Blog
```shell
username -> yisiqiu
email:xx@hotmail.com
ls -al
/var/www$ sudo chown -R www-data:www-data html
```
---

##### SSL
```shell
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

common name http://104.131.125.149/ public front end
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

sudo nano /etc/apache2/conf-available/ssl-params.conf

sudo cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak

sudo nano /etc/apache2/sites-available/default-ssl.conf

sudo nano /etc/apache2/sites-available/000-default.conf

sudo ufw allow 'Apache Full'
sudo ufw delete allow 'Apache'
```

---
#### ZNC
```shell
sudo apt-get install build-essential libssl-dev libperl-dev pkg-config
cd /usr/local/src...
sudo wget...
sudo tar -xzvf
./configure
sudo make
sudo make install

adduser znc-admin
su znc-admin
cd ~

sudo ufw allow from 104.131.125.149 to any port 5000
```
no need for SSL

 http://<droplet_ip>:<specified_port>
 /server <znc_server_ip> 5000 yisiqiu:<pass>



### Lab 6 notes
RAID 0 faster
RAID 1 security
more drives
RAID 5 pair can construct data (4 disks)
RAID 6 (5 disks)
smaller one, less latency



#### apache
```shell
cd /etc/apache2/
cat apache2.conf
cat magic
cat ports.conf
cd mods-available/
cd mods-enabled/
nano dir.conf
cd conf-available/
cd sites-available/

a2ensite 000-default
a2dissite 000-default

apache
nano flowchart.conf
nano blockly.conf
ping flowchart.rs.me
ping blockly.rs.me
same ip address

ssh cis
cd public-html/secure
ls -al
cat .htaccess

```
on ubuntu
install phpmyadmin
apache2 hit 'space' to show the 'x'

set up samba
make new folder(share) in computer
check share this folder
sudo mkdir /share in /etc/samba
allow others share


on server sudo smbpasswd -a cis527

on client
connect to server smb://ip.../share
then log in as registered user
sudo apt-get install cifs-utils




```shell

apache2ctl
sudo a2dissite 000-default.conf
```

```shell

cis527@CIS527U-yisiqiu:~$ sudo nano /etc/hosts
[sudo] password for cis527:
>>>>>>> update lab6
cis527@CIS527U-yisiqiu:~$ sudo ufw allow from 192.168.42.130
Rule added
cis527@CIS527U-yisiqiu:~$ sudo smbpasswd -a cis527
New SMB password:
Retype new SMB password:
Added user cis527.
cis527@CIS527U-yisiqiu:~$ sudo smbpasswd -e cis527
Enabled user cis527.

cis527@CIS527U-yisiqiu:~$ 

=======
cis527@CIS527U-yisiqiu:~$
```
```shell


cis527@CIS527U-yisiqiu:~$ sudo chmod 777 /media/share
cis527@CIS527U-yisiqiu:~$ cd
cis527@CIS527U-yisiqiu:~$ cd /media/share
cis527@CIS527U-yisiqiu:/media/share$ ls
cis527@CIS527U-yisiqiu:/media/share$ cd

cis527@CIS527U-yisiqiu:~$ sudo nano /etc/fstab 
cis527@CIS527U-yisiqiu:~$ sudo mount -a
cis527@CIS527U-yisiqiu:~$ sudo nano ~/.smbcredentials
cis527@CIS527U-yisiqiu:~$ sudo chmod 600 ~/.smbcredentials
cis527@CIS527U-yisiqiu:~$ sudo nano /etc/fstab 
cis527@CIS527U-yisiqiu:~$ sudo mount -a


sudo apt-get install tasksel 
=======
cis527@CIS527U-yisiqiu:~$ sudo nano /etc/fstab
cis527@CIS527U-yisiqiu:~$ sudo mount -a
cis527@CIS527U-yisiqiu:~$ sudo nano ~/.smbcredentials
cis527@CIS527U-yisiqiu:~$ sudo chmod 600 ~/.smbcredentials
cis527@CIS527U-yisiqiu:~$ sudo nano /etc/fstab
cis527@CIS527U-yisiqiu:~$ sudo mount -a


sudo apt-get install tasksel
>>>>>>> update lab6
sudo tasksel install lamp-server

/etc/apache2/sites-available$ sudo nano 000-default.conf
NameVirtualHost *:80
<VirtualHost *:80>
   ServerName www.example.com
   Redirect permanent / https://secure.example.com/
</VirtualHost>
; Maximum allowed size for uploaded files.
upload_max_filesize = 40M

; Must be greater than or equal to upload_max_filesize
post_max_size = 40M

sudo apt-get install phpmyadmin

```

login as root and password
create new user and (As database)

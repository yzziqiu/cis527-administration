cis527@CIS527U-yisiqiu:~$ sudo nano /etc/hosts
[sudo] password for cis527: 
cis527@CIS527U-yisiqiu:~$ sudo ufw allow from 192.168.42.130
Rule added
cis527@CIS527U-yisiqiu:~$ sudo smbpasswd -a cis527
New SMB password:
Retype new SMB password:
Added user cis527.
cis527@CIS527U-yisiqiu:~$ sudo smbpasswd -e cis527
Enabled user cis527.
cis527@CIS527U-yisiqiu:~$ 


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



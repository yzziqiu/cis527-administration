## cis527-administration
### Labs and Notes for enterprise system administration
======
#### Lab1 Secure Workstation
Basic installation and configuration about Ubuntu 16.04 and Windows 10 on VMWare Fusion
1. Create users and groups for both OS
2. Install softwares on Windows 10
..1. [IIS Web Server](http://www.howtogeek.com/112455/how-to-install-iis-8-on-windows-8/)
..2. [BGInfo] (http://technet.microsoft.com/en-us/sysinternals/bb897557.aspx)
3. Files and Permissions
```shell
Get-Childitem -Recurse | Get-Acl | Format-List
```
4. Ubuntu 16.04 and VMWare Tools
5. Ubuntu softwares
..* Mozilla Firefox (firefox)
..* Mozilla Thunderbird (thunderbird)
..* Apache Web Server (apache2)
..* Synaptic Package Manager (synaptic)
..* GUFW Firewall Management Utility (gufw)
..* Conky (conky)

6. File and Permission
```shell
ls -lR
```
#### Lab2 Configuration Management with Puppet
using puppet to Configure Ubuntu and Windows

#### Lab3 Core Networking Service
1. set up a remote connecetion
..* windows, using Remmina on Linux to test
..* ubuntu SSH, using PUTTY on Windows to test
2. set static IP address
3. set up a DNS server
 using bind9 on Linux server
4. set up DHCP server
	 install isc-dhcp-server
5. Install an SNMP Daemon
6. install Wireshark to capture packets
..* A DNS standard query
..* A DNS standard query response
..* An ICMP Echo (ping) request
..* An SNMP get-next-request packet for an item within the ICMP MIB section
..* An SNMP get-response packet for an item within the ICMP MIB section
..* An HTTP 301 Moved Permanently Redirect response
..*  An HTTP Basic Authentication Request

to set a Ubuntu client and a Ubuntu server as well as Windows.
Lab includes RDP,SSH for remote control. And setting up DNS server on Ubuntu and DHCP (which is frustrating :) Finally,
	we use SNMP to grep loads of information. And using Wireshark to capture packets based on different protocols

#### Lab4 Directory Service
1. Configure your Windows Server as an Active Directory Domain Controller
2. Add a Windows 10 VM to your new Domain
3. Set up an OpenLDAP server for Linux
4. Configure an Ubuntu VM to Authenticate using your OpenLDAP server
5. Query your Active Directory and LDAP servers using LDAPSearch
```shell
ldapsearch -LLL -H ldap://<AD_IP_address>:389 -b "dc=cis527<your_eID>,dc=local" -D "cis527<your_eID>\Administrator" -w "cis527_windows"
ldapsearch -LLL -H ldap://<OpenLDAP_IP_address>:389 -b "dc=cis527<your_eID>,dc=local" -D "cn=admin,dc=cis527<your_eID>,dc=local" -w "cis527_linux"
```

#### Lab5 Cloud
1. create two droplets
2. Configure virtual servers
3. Configure the Firewall, Timezones & NTP
4. Set up Wordpress
5. Set up SSL Certificates
6. Install & Configure ZNC

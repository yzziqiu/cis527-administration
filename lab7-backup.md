#### account in active directory

(1) run gpmc.msc (Group Policy Management)

(2) Expand your Domain

(3) Expand <Group Policy Objects> and right-click <default domain controllers policy>.  Click Edit.

(4) Expand: <Computer Configurations> <Policies> <Windows Settings> <Security Settings> <Local Policies> <User Rights Assignment>

(5) Right click <Allow log on locally> and click Properties.  Amend as required.

(6) Run gpupdate and wait for confirmation: "user policy update has completed succesfully" (default gpudate without switches should only apply the changes)

(7) Log out and log back in as domain user


#### new disk

In the Start menu, type diskmgmt.msc and click OK.

Right-click the disk to be initialized and then click Initialize Disk. Windows prompts you to initialize the disk before Logical Disk Manager can access it.

Select MBR (Master Boot Record) and click OK.
Right-click the unallocated space and click New Simple Volume.

Enter the size of the partition (in MB) and click Next.
Select a drive letter and click Next.
Select the file system type and volume name.


Click Finish. Windows prompts you to format the drive.
Click Format.

```
     WBADMIN ENABLE BACKUP -addtarget:{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}
 C:\> wbadmin start backup -backuptarget:E: -allcritical -systemstate -vssfull -quiet 
 
 ```
 bcdedit /set safeboot dsrepair

restart-computer

 to return to a normal boot, once the restore operation is complete, we enter this command:

```
bcdedit /deletevalue safeboot


##### to log in safe mode
.\Administrator
wbadmin get versions -backuptarget:E: -machine:
wbadmin start systemstaterecovery -version:01/01/2014-2:36 -backuptarget:E: -machine:

##### authoritive

C:\Users\admin>ntdsutil
ntdsutil: activate instance ntds
Active Instance set to "NTDS".
ntdsutil: authoritative restore
authoritative restore: restore object "cn=Alan Reid,ou=ExchangeUsers,dc=mynet,dc=lan"


#linux


#ganglia


udp_recv_channel {
  #mcast_join = 239.2.11.71 ## comment out
  port = 8649
  #bind = 239.2.11.71 ## comment out
}

/* You can specify as many tcp_accept_channels as you like to share
   an xml description of the state of the cluster */
tcp_accept_channel {
  port = 8649
}

sudo vi /etc/ganglia/gmond.conf
cluster {
  name = "my cluster"     ## Cluster name
  owner = "unspecified"
  latlong = "unspecified"
  url = "unspecified"


udp_send_channel {
  #mcast_join = 239.2.11.71   ## Comment
  host = 1.1.1.1   ## IP address of master node
  port = 8649
  ttl = 1
}



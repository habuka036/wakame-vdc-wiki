###### Info for RPM wakame-vdc-hva-common-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 4162 bytes  
##### MD5 Checksum: d686e7b19a6e604d39e6cd639f51c648  
##### Table of Contents  
1. [RPM Version Information](#version)  
2. [RPM Provides these Packages ](#provides)  
3. [RPM Requires these Packages](#requires)  
4. [RPM Provides these Scripts](#scripts)  
5. [RPM Provides these Config Files](#config)  
6. [RPM All Verifiable Information](#verifiable)  
&nbsp;  
&nbsp;  
&nbsp;  

<a name="version" />
#### RPM Version Information  
&nbsp;  

```  
Name        : wakame-vdc-hva-common-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 2354                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for hva VM appliance
Description :
<insert long description, indented with spaces>
```  

&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  

```  
config(wakame-vdc-hva-common-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-hva-common-vmapp-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  

```  
/bin/sh  
bridge-utils  
config(wakame-vdc-hva-common-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
dosfstools  
dracut-kernel  
ebtables  
ethtool  
iproute  
iptables  
iscsi-initiator-utils  
kmod-openvswitch  
kpartx  
libcgroup  
libpcap  
openvswitch  
pv  
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
scsi-target-utils  
sqlite  
vconfig  
wakame-vdc = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  

```  
postinstall scriptlet (using /bin/sh):
/opt/axsh/wakame-vdc/rpmbuild/helpers/sysctl.sh < /etc/sysctl.d/30-bridge-if.conf
/opt/axsh/wakame-vdc/rpmbuild/helpers/add-loopdev.sh
```  

&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  

```  
/etc/default/vdc-hva
/etc/init/vdc-hva-worker.conf
/etc/init/vdc-hva.conf
/etc/sysctl.d/30-bridge-if.conf
```  

&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  

```  
/etc/default/vdc-hva 234 1366612999 b77b4321a4d626c8b35ee75896d36cb0 0100644 root root 1 0 0 X
/etc/init/vdc-hva-worker.conf 816 1366612999 b9f7c2af24359a8ac586d89ddd05006f 0100644 root root 1 0 0 X
/etc/init/vdc-hva.conf 1087 1366612999 0c3c51621ddaeeccbe62fbdab0543af3 0100644 root root 1 0 0 X
/etc/sysctl.d/30-bridge-if.conf 217 1366612999 e42644aad60fb9a08b3c9b1c6908d9fe 0100644 root root 1 0 0 X
/var/lib/wakame-vdc/instances 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
/var/lib/wakame-vdc/instances/tmp 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
```  

&nbsp;  

### Info for RPM wakame-vdc-ha-common-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 4912 bytes  
##### MD5 Checksum: e001b4bdf106aa93ad7bd1650f0796f4  
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
Name        : wakame-vdc-ha-common-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 5195                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for HA
Description :
<insert long description, indented with spaces>
```  

&nbsp;  
&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  

```  
wakame-vdc-ha-common-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  

```  
/bin/bash  
drbd84-utils  
kmod-drbd84  
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
ucarp  
wakame-vdc = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  

```  
```  

&nbsp;  
&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  

```  
```  

&nbsp;  
&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  

```  
/etc/ucarp/init-common.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/ucarp/init-down.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/ucarp/init-down.d/vip 106 1366612999 51125cc83a2e1b47a9249c73230f9886 0100755 root root 0 0 0 X
/etc/ucarp/init-up.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/ucarp/init-up.d/vip 102 1366612999 8a13a9b7391db81b3d02086efeeb30cf 0100755 root root 0 0 0 X
/etc/ucarp/vip-common.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/ucarp/vip-down.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/ucarp/vip-up.d 4096 1366612999 00000000000000000000000000000000 040755 root root 0 0 0 X
/opt/axsh/wakame-vdc/rpmbuild/helpers/lodrbd-mounter.sh 1542 1366612999 a816a3b5cbdae640d99bb8167d9f30e0 0100755 root root 0 0 0 X
/opt/axsh/wakame-vdc/rpmbuild/helpers/lodrbd.sh 3445 1366612999 a807b714b1377071f9ad5b37b42c68cd 0100755 root root 0 0 0 X
```  

&nbsp;  

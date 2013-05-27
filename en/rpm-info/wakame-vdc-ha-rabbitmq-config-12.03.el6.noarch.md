##### Info for RPM: wakame-vdc-ha-rabbitmq-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 3341 bytes  
##### MD5 Checksum: 3c1771a2a396e89a3dd4e704095cca28  
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
Name        : wakame-vdc-ha-rabbitmq-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 2112                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for HA rabbitmq
Description :
<insert long description, indented with spaces>
```  

&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  

```  
wakame-vdc-ha-rabbitmq-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  

```  
/bin/bash  
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
wakame-vdc-ha-common-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  

```  
```  

&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  

```  
```  

&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  

```  
/etc/ucarp/init-common.d/rabbitmq 1679 1366612999 aea8225ba8b298faa8c4a70704ec9f04 0100755 root root 0 0 0 X
/etc/ucarp/vip-common.d/rabbitmq 433 1366612999 4e2169f7f7df984df66fa14857d8b93e 0100755 root root 0 0 0 X
/etc/ucarp/vip-down.d/rabbitmq 24 1366612999 00000000000000000000000000000000 0120777 root root 0 0 0 ../vip-common.d/rabbitmq
/etc/ucarp/vip-up.d/rabbitmq 24 1366612999 00000000000000000000000000000000 0120777 root root 0 0 0 ../vip-common.d/rabbitmq
```  

&nbsp;  

### Info for RPM wakame-vdc-hva-openvz-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 2767 bytes  
##### MD5 Checksum: a392ecb2bc2a3512917ce0d5baed0b79  
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
Name        : wakame-vdc-hva-openvz-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 524                              License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for hva OpenVZ VM appliance
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
config(wakame-vdc-hva-openvz-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-hva-openvz-vmapp-config = 12.03-20130422152723git7ffafa2.el6
```  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  
```  
/bin/sh  
config(wakame-vdc-hva-openvz-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
ploop = 1.4-1
ploop-lib = 1.4-1
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
vzctl = 3.3-1
vzctl-lib = 3.3-1
vzkernel = 2.6.32-042stab055.16
vzquota = 3.1-1
wakame-vdc-hva-common-vmapp-config = 12.03-20130422152723git7ffafa2.el6
```  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  
```  
postinstall scriptlet (using /bin/sh):
/opt/axsh/wakame-vdc/rpmbuild/helpers/sysctl.sh < /etc/sysctl.d/30-openvz.conf
```  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  
```  
/etc/sysctl.d/30-openvz.conf
```  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  
```  
/etc/sysctl.d/30-openvz.conf 524 1366612999 e30edadc6e27a51a8bb33d63a8d26847 0100644 root root 1 0 0 X
```  
&nbsp;  
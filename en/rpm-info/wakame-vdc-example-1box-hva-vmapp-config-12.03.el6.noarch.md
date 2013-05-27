##### Info for RPM: wakame-vdc-example-1box-hva-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 3303 bytes  
##### SHA-1 Checksum: aaa46d8244af3e59e7e779ad8a59b0167ff8553e  
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
Name        : wakame-vdc-example-1box-hva-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-example-1box-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 1589                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for hva example-1box
Description :
<insert long description, indented with spaces>
```  

&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  

```  
config(wakame-vdc-example-1box-hva-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-example-1box-hva-vmapp-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  

```  
/bin/sh  
config(wakame-vdc-example-1box-hva-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
wakame-vdc-example-1box-common-vmapp-config  
wakame-vdc-hva-full-vmapp-config  
```  

&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  

```  
postinstall scriptlet (using /bin/sh):
/sbin/chkconfig --add iscsi
/sbin/chkconfig       iscsi  on
/sbin/chkconfig --add iscsid
/sbin/chkconfig       iscsid on
/sbin/chkconfig --add tgtd
/sbin/chkconfig       tgtd on
# activate upstart system job
sys_default_confs="hva"
for sys_default_conf in ${sys_default_confs}; do
  sed -i s,^#RUN=.*,RUN=yes, /etc/default/vdc-${sys_default_conf}
done
```  

&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  

```  
/etc/wakame-vdc/hva.conf
```  

&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  

```  
/etc/wakame-vdc/hva.conf 1589 1366613516 7af5529d6e142ec802eea7ca0eeebef7 0100644 root root 1 0 0 X
```  

&nbsp;  

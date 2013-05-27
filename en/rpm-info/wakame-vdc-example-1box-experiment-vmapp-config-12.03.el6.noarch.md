### Info for RPM wakame-vdc-example-1box-experiment-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 1998 bytes  
##### MD5 Checksum: 188d49d44c188b49cbe2b475db07fa82  
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
`````  
Name        : wakame-vdc-example-1box-experiment-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-example-1box-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 0                                License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for experiment example-1box
Description :
<insert long description, indented with spaces>
`````  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  
`````  
wakame-vdc-example-1box-experiment-vmapp-config = 12.03-20130422152723git7ffafa2.el6
`````  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  
`````  
wakame-vdc-example-1box-full-vmapp-config  
/bin/sh  
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
rpmlib(CompressedFileNames) <= 3.0.4-1
`````  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  
`````  
postinstall scriptlet (using /bin/sh):
# add ifcfg-br0 ifcfg-eth0
/opt/axsh/wakame-vdc/rpmbuild/helpers/setup-bridge-if.sh
# add vzkernel entry
/opt/axsh/wakame-vdc/rpmbuild/helpers/edit-grub4vz.sh add
# edit boot order to use vzkernel as default.
/opt/axsh/wakame-vdc/rpmbuild/helpers/edit-grub4vz.sh enable

# set demo parameters
for sys_default_conf in /etc/default/vdc-*; do sed -i s,^#NODE_ID=.*,NODE_ID=demo1, ${sys_default_conf}; done
`````  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  
`````  
(contains no files)
`````  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  
`````  
(contains no files)
`````  
&nbsp;  

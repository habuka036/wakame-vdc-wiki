### Info for RPM wakame-vdc-example-1box-dcmgr-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 6302 bytes  
##### MD5 Checksum: 3b89b3d513a9c16d3d2d2dc522d9b337  
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
``  
Name        : wakame-vdc-example-1box-dcmgr-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-example-1box-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 6436                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for dcmgr example-1box
Description :
<insert long description, indented with spaces>
``  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  
``  
config(wakame-vdc-example-1box-dcmgr-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-example-1box-dcmgr-vmapp-config = 12.03-20130422152723git7ffafa2.el6
``  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  
``  
/bin/sh  
config(wakame-vdc-example-1box-dcmgr-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
wakame-vdc-dcmgr-vmapp-config  
wakame-vdc-example-1box-common-vmapp-config  
``  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  
``  
postinstall scriptlet (using /bin/sh):
/sbin/chkconfig --add mysqld
/sbin/chkconfig       mysqld on
/sbin/chkconfig --add rabbitmq-server
/sbin/chkconfig       rabbitmq-server on
# activate upstart system job
sys_default_confs="auth collector dcmgr metadata nsa proxy sta webui"
for sys_default_conf in ${sys_default_confs}; do
  sed -i s,^#RUN=.*,RUN=yes, /etc/default/vdc-${sys_default_conf}
done

# set demo parameters
for sys_default_conf in /etc/default/vdc-*; do sed -i s,^#NODE_ID=.*,NODE_ID=demo1, ${sys_default_conf}; done
[ -f /etc/wakame-vdc/unicorn-common.conf ] && sed -i "s,^worker_processes .*,worker_processes 1," /etc/wakame-vdc/unicorn-common.conf
``  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  
``  
/etc/wakame-vdc/convert_specs/load_balancer.yml
/etc/wakame-vdc/dcmgr.conf
/etc/wakame-vdc/dcmgr_gui/database.yml
/etc/wakame-vdc/dcmgr_gui/dcmgr_gui.yml
/etc/wakame-vdc/dcmgr_gui/instance_spec.yml
/etc/wakame-vdc/dcmgr_gui/load_balancer_spec.yml
/etc/wakame-vdc/nsa.conf
/etc/wakame-vdc/proxy.conf
/etc/wakame-vdc/sta.conf
``  
&nbsp;  
&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  
``  
/etc/wakame-vdc/convert_specs/load_balancer.yml 173 1366613516 a25b8cee4263fba86b40d8d4b0a74ade 0100644 root root 1 0 0 X
/etc/wakame-vdc/dcmgr.conf 3181 1366613516 47cf1e90ebf6f2a841fbcabbfa84af82 0100644 root root 1 0 0 X
/etc/wakame-vdc/dcmgr_gui/database.yml 304 1366613516 9c2622f618101fa3706759fe513cdd5d 0100644 root root 1 0 0 X
/etc/wakame-vdc/dcmgr_gui/dcmgr_gui.yml 150 1366613516 ce3370b89da5c6489e4226d475e9fd87 0100644 root root 1 0 0 X
/etc/wakame-vdc/dcmgr_gui/instance_spec.yml 514 1366613516 856aa86c3838ffdea4225ad660eb3789 0100644 root root 1 0 0 X
/etc/wakame-vdc/dcmgr_gui/load_balancer_spec.yml 111 1366613516 9393a25150023ad5e5c11413e0822e30 0100644 root root 1 0 0 X
/etc/wakame-vdc/nsa.conf 241 1366613516 175af7882e6c24cffdf1d430b15390b6 0100644 root root 1 0 0 X
/etc/wakame-vdc/proxy.conf 1461 1366613516 f236b76ff9f8ea98c8ae92049b7e2b90 0100644 root root 1 0 0 X
/etc/wakame-vdc/sta.conf 301 1366613516 c6d24e95b85646b7e71a84028a565fb2 0100644 root root 1 0 0 X
``  
&nbsp;  

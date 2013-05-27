##### Info for RPM wakame-vdc-dcmgr-vmapp-config-12.03-20130422152723git7ffafa2.el6.noarch.rpm  
##### Size: 6087 bytes  
##### MD5 Checksum: 20966392a53d8ddcff71534635750954  
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
Name        : wakame-vdc-dcmgr-vmapp-config  Relocations: /opt/axsh 
Version     : 12.03                             Vendor: Axsh Co. LTD <dev@axsh.net>
Release     : 20130422152723git7ffafa2.el6   Build Date: Mon 22 Apr 2013 03:50:49 PM JST
Install Date: (not installed)               Build Host: kemukins01.shinjuku
Group       : Development/Languages         Source RPM: wakame-vdc-12.03-20130422152723git7ffafa2.el6.src.rpm
Size        : 9553                             License: see https://github.com/axsh/wakame-vdc/blob/master/README.md
Signature   : (none)
URL         : http://wakame.jp/
Summary     : Configuration set for dcmgr VM appliance
Description :
<insert long description, indented with spaces>
```  

&nbsp;  
&nbsp;  
<a name="provides" />
#### RPM Provides these Packages  
&nbsp;  

```  
config(wakame-vdc-dcmgr-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-dcmgr-vmapp-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="requires" />
#### RPM Requires these Packages  
&nbsp;  

```  
/bin/sh  
config(wakame-vdc-dcmgr-vmapp-config) = 12.03-20130422152723git7ffafa2.el6
dnsmasq  
erlang  
mysql-server  
nginx  
rabbitmq-server  
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
wakame-vdc = 12.03-20130422152723git7ffafa2.el6
wakame-vdc-rack-config = 12.03-20130422152723git7ffafa2.el6
```  

&nbsp;  
&nbsp;  
<a name="scripts" />
#### RPM Provides these Scripts  
&nbsp;  

```  
postinstall program: /bin/sh
```  

&nbsp;  
&nbsp;  
<a name="config" />
#### RPM Provides these Config Files  
&nbsp;  

```  
/etc/default/vdc-auth
/etc/default/vdc-collector
/etc/default/vdc-dcmgr
/etc/default/vdc-metadata
/etc/default/vdc-nsa
/etc/default/vdc-nwmongw
/etc/default/vdc-proxy
/etc/default/vdc-sta
/etc/default/vdc-webui
/etc/init/vdc-auth.conf
/etc/init/vdc-collector.conf
/etc/init/vdc-dcmgr.conf
/etc/init/vdc-metadata.conf
/etc/init/vdc-nsa.conf
/etc/init/vdc-nwmongw.conf
/etc/init/vdc-proxy.conf
/etc/init/vdc-sta.conf
/etc/init/vdc-webui.conf
```  

&nbsp;  
&nbsp;  
<a name="verifiable" />
#### RPM All Verifiable Information  
&nbsp;  

```  
/etc/default/vdc-auth 253 1366612999 0e900d11c4a8a295710be6862171dbaf 0100644 root root 1 0 0 X
/etc/default/vdc-collector 188 1366612999 e8aa847fdef29d830c6ad0c028dcc02d 0100644 root root 1 0 0 X
/etc/default/vdc-dcmgr 251 1366612999 2a47c412bca7fc62961827b7f5c571d2 0100644 root root 1 0 0 X
/etc/default/vdc-metadata 251 1366612999 4eacf0acdca0c22df2b7ae9c1c8bddfa 0100644 root root 1 0 0 X
/etc/default/vdc-nsa 203 1366612999 8658b08b62e0d74b0d192c795bd93d23 0100644 root root 1 0 0 X
/etc/default/vdc-nwmongw 188 1366612999 e8aa847fdef29d830c6ad0c028dcc02d 0100644 root root 1 0 0 X
/etc/default/vdc-proxy 202 1366612999 d2477e3f9fda321ac1a218eb8f5ab9fb 0100644 root root 1 0 0 X
/etc/default/vdc-sta 206 1366612999 548b026eeb20a2d109602cd8c974efe9 0100644 root root 1 0 0 X
/etc/default/vdc-webui 251 1366612999 dec479b82a920745524a3e53e740f736 0100644 root root 1 0 0 X
/etc/init/vdc-auth.conf 804 1366612999 66e276210deaef93dde307dc72da1c1d 0100644 root root 1 0 0 X
/etc/init/vdc-collector.conf 918 1366612999 d7fa37f47415c9688dd46431cd32b819 0100644 root root 1 0 0 X
/etc/init/vdc-dcmgr.conf 798 1366612999 3c4e1858da69f0c60775e097a457c983 0100644 root root 1 0 0 X
/etc/init/vdc-metadata.conf 806 1366612999 4f7eff92eb42c72c8480e037abd6b88c 0100644 root root 1 0 0 X
/etc/init/vdc-nsa.conf 866 1366612999 4ac747f478f28829fe227f5b81348c5d 0100644 root root 1 0 0 X
/etc/init/vdc-nwmongw.conf 879 1366612999 5e893af61693071afe7146f7f2053946 0100644 root root 1 0 0 X
/etc/init/vdc-proxy.conf 827 1366612999 5446595c31aa96331a05778b21acc8a3 0100644 root root 1 0 0 X
/etc/init/vdc-sta.conf 858 1366612999 b32f65c67b1e1547d39e30e873e86f8d 0100644 root root 1 0 0 X
/etc/init/vdc-webui.conf 804 1366612999 f3d278c03a1b814a0e1f30aeb3599b91 0100644 root root 1 0 0 X
/etc/wakame-vdc/convert_specs 4096 1366613376 00000000000000000000000000000000 040755 root root 0 0 0 X
/etc/wakame-vdc/dcmgr_gui 4096 1366613376 00000000000000000000000000000000 040755 root root 0 0 0 X
/var/lib/wakame-vdc/images 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
/var/lib/wakame-vdc/snap 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
/var/lib/wakame-vdc/volumes 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
/var/log/wakame-vdc/dcmgr_gui 4096 1366613380 00000000000000000000000000000000 040755 root root 0 0 0 X
```  

&nbsp;  

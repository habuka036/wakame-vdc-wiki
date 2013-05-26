component process "disappeared"
===============================

Scenario here is the log ending suddenly with no error or shutdown
messages logged.

collector
---------

# tail -F /var/log/vdc-collector.log

hva
---

# tail -F /var/log/vdc-hva.log

sta
---

# tail -F /var/log/vdc-sta.log

nsa
---

# tail -F /var/log/vdc-nsa.log

# tail -F /var/log/dnsmasq.log

webui
-----

# tail -F /var/log/vdc-webui.log

# tail -F /home/wakame/wakame-vdc/frontend/dcmgr_gui/log/development.log

api
---

# tail -F /var/log/vdc-api.log

metadata
--------

# tail -F /var/log/vdc-metadata.log

checking services
=================

on local node
-------------

### rabbitmq

$ sudo rabbitmqctl status

ex.

$ sudo rabbitmqctl status
Status of node rabbit@localhost ...
[{pid,7087},
{running_applications,[{rabbit,"RabbitMQ","2.6.1"},
{os_mon,"CPO  CXC 138 46","2.2.6"},
{sasl,"SASL  CXC 138 11","2.1.9.4"},
{mnesia,"MNESIA  CXC 138 12","4.4.19"},
{stdlib,"ERTS  CXC 138 10","1.17.4"},
{kernel,"ERTS  CXC 138 10","2.14.4"}]},
{os,{unix,linux}},
{erlang_version,"Erlang R14B03 (erts-5.8.4) [source] [64-bit] [smp:2:2] [rq:2] [async-threads:30] [kernel-poll:true]\n"},
{memory,[{total,25607640},
{processes,10552600},
{processes_used,10527792},
{system,15055040},
{atom,1118785},
{atom_used,1111984},
{binary,187224},
{code,11166935},
{ets,803456}]}]
...done.

### mysql

$ sudo initctl status mysql
$ mysqladmin -uroot -h[mysql ipaddr] ping

ex.

$ sudo initctl status mysql
mysql start/running, process 19682

$ mysqladmin -uroot -hlocalhost ping
mysqld is alive

### webui

$ sudo initctl status vdc-webui
$ netstat -na | grep -w LISTEN | grep :9000

ex.

$ sudo initctl status vdc-webui
vdc-webui start/running, process 13065

$ netstat -na | grep -w LISTEN | grep :9000
tcp        0      0 0.0.0.0:9000                0.0.0.0:*                   LISTEN

### api

$ sudo initctl status vdc-api
$ netstat -na | grep -w LISTEN | grep :9001

ex.

$ sudo initctl status vdc-api
vdc-api start/running, process 8164

$ netstat -na | grep -w LISTEN | grep :9001
tcp        0      0 0.0.0.0:9001                0.0.0.0:*                   LISTEN

### metadata

$ sudo initctl status vdc-metadata
$ netstat -na | grep -w LISTEN | grep :9002

ex.

$ sudo initctl status vdc-metadata
vdc-metadata start/running, process 8228

$ netstat -na | grep -w LISTEN | grep :9002
tcp        0      0 0.0.0.0:9002                0.0.0.0:*                   LISTEN

### tgt

$ sudo initctl status tgt
$ netstat -na | grep LISTEN | grep :5672
$ sudo iscsiadm -m discovery -t sendtarget -p localhost

ex.

$ sudo initctl status tgt
tgt start/running, process 335

$ netstat -na |grep LISTEN | grep :5672
tcp        0      0 0.0.0.0:5672            0.0.0.0:*               LISTEN

$ sudo iscsiadm -m discovery -t sendtarget -p localhost
iscsiadm: discovery record [localhost,3260] not found!

### dnsmasq-dns

$ ps -ef | grep dnsmasq
$ netstat -na | grep udp | grep :53

ex.

$ ps -ef | grep dnsmasq
nobody    8206  8198  0 Apr03 ?        00:00:00 /usr/sbin/dnsmasq -k --no-hosts --no-resolv --leasefile-ro --dhcp-leasefile=/dev/null --addn-hosts=/var/tmp/dnsmasq-dhcp.conf.hosts --dhcp-hostsfile=/var/tmp/dnsmasq-dhcp.conf.dhcp --conf-file=/var/tmp/dnsmasq-dhcp.conf
500      13954 12936  0 16:08 pts/0    00:00:00 grep dnsmasq
$ netstat -na | grep udp | grep :53
udp        0      0 0.0.0.0:53                  0.0.0.0:*
udp        0      0 :::53       

### dnsmasq-dhcp

$ ps -ef | grep dnsmasq
$ netstat -na | grep :67

ex.

$ ps -ef | grep dnsmasq
nobody    8206  8198  0 Apr03 ?        00:00:00 /usr/sbin/dnsmasq -k --no-hosts --no-resolv --leasefile-ro --dhcp-leasefile=/dev/null --addn-hosts=/var/tmp/dnsmasq-dhcp.conf.hosts --dhcp-hostsfile=/var/tmp/dnsmasq-dhcp.conf.dhcp --conf-file=/var/tmp/dnsmasq-dhcp.conf
500      14062 12936  0 16:09 pts/0    00:00:00 grep dnsmasq

from remote node
----------------

### rabbitmq

in preparation

### mysql

$ mysqladmin -uroot -h[mysql ipaddr] ping

ex.

$ mysqladmin -uroot -h192.168.2.21 ping
mysqld is alive

### webui

$ curl http://[webui addr]:9000/

ex.

$ curl http://192.0.2.21:9000/
<html><body>You are being <a href="http://192.0.2.21:9000/session/new">redirected</a>.</body></html>

### api

$ curl http://[api addr]:9001/

ex.

$ curl.exe http://192.0.2.21:9001/
{
"message": "Dcmgr::Endpoints::InvalidRequestCredentials",
"code": "103",
"error": "Dcmgr::Endpoints::InvalidRequestCredentials"
}

### metadata

$ curl http://[addr]:9002/

ex.

$ curl http://192.0.2.21:9002/
latest
2011-01-01

### tgt

$ iscsiadm -m discovery -t sendtargets -p [sta ipaddr]

ex.

$ sudo iscsiadm -m discovery -t sendtarget -p 192.0.2.22
iscsiadm: discovery record [192.0.2.22,3260] not found!

### dnsmasq-dns

$ nslookup www.google.com [nsa ipaddr]

ex.

$ nslookup www.google.com 192.0.2.21
Server:         192.0.2.21
Address:        192.0.2.21#53

Non-authoritative answer:
www.google.com  canonical name = www.l.google.com.
Name:   www.l.google.com
Address: 74.125.235.112
Name:   www.l.google.com
Address: 74.125.235.113
Name:   www.l.google.com
Address: 74.125.235.114
Name:   www.l.google.com
Address: 74.125.235.115
Name:   www.l.google.com
Address: 74.125.235.116

### dnsmasq-dhcp

in preparation

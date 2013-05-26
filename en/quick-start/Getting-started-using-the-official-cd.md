OpenFlow Architecture
=====================

*OpenFlow* is based on an Ethernet switch, with an internal flow-table,
and a standardized interface to add and remove flow entries.

Initially designed to allow researchers to run experiments on
heterogeneous switches in a uniform way at line-rate and with high
port-density, without requiring the internals of switches to be exposed,
the specification seem ideal for the implementation of virtual networks.

The *OpenFlow* controller remains encapsulated from the complexities of
the switch setup and operation, while reversely the *OpenFlow* switch
does not need to know anything about the topology of the virtual
networks.

When you have a large numbers of virtual machines sharing the same
physical networks and machines, and with these each participating in
virtual networks of their own there are potential issues with populating
the various routing, translation and forwarding tables. *OpenFlow* works
around this issue by allowing the switch to request instructions on how
to handle unknown packets at the time they are received, thus keeping
only routing information that is in active use.

Parts of this document is based on and/or copied from the *OpenFlow*
1.1.0 specification, found at;
<http://www.openflow.org/documents/openflow-spec-v1.1.0.pdf>.

### OpenFlow Switch

> [image](Image:OpenFlow_Integration_switch_overview.png "wikilink")
> {fig:flow table and controller}

An *OpenFlow* Switch consists of one or more flow tables and a group
table, which perform packet look-ups and forwarding, and an *OpenFlow*
channel to an external controller. The controller manages the switch via
the *OpenFlow* protocol.

Each flow table in the switch contains a set of flow entries; each flow
entry consists of match fields, counters, and a set of instructions to
apply to matching packets. I spoiled my rates attempting to cope with
research papers accomplishing and my job at one time. I became smarter
at this time. I buy [term papers online](http://essaysexperts.com) and
buy custom academic papers and my marks get better!

Flow entries in the table can be added, updated or deleted in four ways;

-   *Reactively* through the *OpenFlow* channel in response to packets.
-   *Proactively* by the *OpenFlow* controller.
-   *Manually* with command-line utilities.
-   *Purged* after an idle or absolute timeout.

Each table can handle unmatched packets in four possible ways;

-   *Pass to table N*, where N is always larger than current table
index.
-   *Send to controller*, allowing the controller to add flows and
decide on what to do with the packet.
-   *Handle normally*, with the default L2/L3 switch. (Not universally
supported)
-   *Drop the packet*, if not of interest.

### OpenFlow Protocol

The *OpenFlow* channel is the interface that connects each *OpenFlow*
switch to a controller. Through this interface, the controller
configures and manages the switch, receives events from the switch, and
sends packets out the switch.

Between the datapath and the *OpenFlow* channel, the interface is
implementation-specific, however all *OpenFlow* channel messages must be
formatted according to the *OpenFlow* protocol. The *OpenFlow* channel
is usually encrypted using TLS, but may be run directly over TCP or unix
sockets.

Support for multiple simultaneous controllers is currently undefined,
however Open vSwitch does allow the use of different controllers on a
per-bridge basis. This makes it possible to support multiple controllers
on the same host as long as the virtual machines are connected to
separate bridges.

Installation
============

1.  Download the iso image.
2.  Burn image downloaded to DVD.
3.  Set the DVD to a target machine and then rebooted it.
4.  Interact with installer. (See the [ screen
shots](Installation_Guide_for_official_CD "wikilink").)

**Note:** Near the end of the installation, it will seem like the
installer is stuck on "26% Running Preseed...". Don't panic. At this
stage Wakame Machine Images are being copied to your server. This is
expected to take some time.

**Note 2:** If you want to install to VMWare(Player or Workstation),
please refer to a page, '[When Using
VMWare](When Using VMWare "wikilink"),' for details.)

Using Wakame-vdc
================

Web UI
------

Connect to it with a browser and the web interface should come up. If
your server's IP is 192.168.222.137, that is

http://192.168.222.137

You will met a login form. Now log in with username "**demo**" and
password "**demo**" to test your installation.

Launch the Instance
-------------------

1.  Select the 'Machine Images' under the 'IMAGES' of menu.
2.  Choose the radio button of the image for launching of an instance.
3.  Click the 'Launche Instance' button.
4.  Launch Instance dialog openes. Enter the 'Host Name', and select
'Instance spec' and 'Security Group'
5.  Click the 'Launche' button.

In order to check the state of the launched instance, 'Instances' under
INSTANCES is chosen from a menu. The information on the instance
launched at the head of the instance list is displayed. It waits until
State is displayed as 'running'.It can connect now with the launched
instance using the IP address currently displayed on the screen.

How to Connect to an Instance
=============================

Now you can connect to your instance using your private key. You can
find it on the web UI under Key Pair.

1.  Select the 'Key Pairs' under the 'NETWORK & SECURITY' of menu.
2.  Clicks the 'Show Secret Access Key' button of the line of
'ssh-demo', Then, a private key(ssh\_demo.pem) downloads.
3.  SSH connection is made using the downloaded private key.
4.  For example, When the IP address of an instance is 192.168.222.75.

<!-- -->

ssh -i /home/geek/ssh_demo.pem ubuntu@192.168.222.75

If you can not connect, please check the following;

1.  The ssh service might not have been started up yet because your
instance just started booting. Wait a few minutes and try again.
2.  The permissions for your\_private\_key.pem might be incorrect.

Especially in the latter case, you might see a log like the one below.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0744 for '/home/geek/ssh_demo.pem' are too open.
It is recommended that your private key files are NOT accessible by others.
This private key will be ignored.
bad permissions: ignore key: /home/geek/ssh_demo.pem

The issue is that permissions of your\_private\_key.pem are still 0744.
This means all users are allowed to read your key which is a serious
security liability. You should modify the permissions with the following
command.

chmod 600 /home/geek/ssh_demo.pem

Enjoy!

Previous Version
----------------

v11.06  
<http://dlc.wakame.axsh.jp.s3.amazonaws.com/beta/11.06/install_cd/wakame-11.06-amd64.iso>



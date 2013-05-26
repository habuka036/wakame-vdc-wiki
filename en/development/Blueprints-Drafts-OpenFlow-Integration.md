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
apply to matching packets. I am here because I want to get know if it's
OK to purchase custom research paper or get help from [term paper
services](http://essaysprofessors.com) in the web. I guess buying essay
papers in the web is risky. Students should know exactly that an
organization, which offers custom papers is reliable!

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

Testing Open vSwitch with wakame-vdc
====================================

> [image](Image:OpenFlow_Integration_ovs-switch_kernel.png "wikilink")
> {fig:ovs-switch and kernel}

Use the “openflow” branch of *wakame-vdc* which includes a set of
scripts in “./wakame-vdc/tests/openflow/” for staging the system. Note
that these scripts assume you are using “/usr/share/axsh/”.

# Quick-start guide for with the 'openflow' branch.
# Assumes cwd '&lt;prefix&gt;/wakame-vdc/tests/'.

# Call only once.
./openflow/setup-openflow.sh

./openflow/enable-ovs.sh
./vdc openflow

# Recovering from a bad state.

# To clear the flows table and add the default flow.
./ovs/bin/ovs-ofctl del-flows br0 &amp;&amp; ./ovs/bin/ovs-ofctl add-flows br0 priority=0,action=normal

# Reset everything.
./ovs/bin/ovs-vsctl emer-reset
./tests/openflow/enable-ovs.sh

Installing Open vSwitch
-----------------------

# From ``wakame-vdc/tests/openflow/setup-openflow.sh''.
git clone git://openvswitch.org/openvswitch

cd openvswitch/
./boot.sh
./configure --prefix=/usr/share/axsh/ovs-switch/ --with-linux=/lib/modules/`uname -r`/build/
make &amp;&amp; sudo make install

sudo install --mode=0644 ./datapath/linux/*_mod.ko /lib/modules/`uname -r`/kernel/drivers/net
sudo depmod

cat ./debian/openvswitch-switch.init | sed -e &quot;s:/usr/:$OVS_PREFIX:g&quot; &gt; ./ovs-switch.tmp
sudo install --mode=0755 ./ovs-switch.tmp /etc/init.d/ovs-switch

Note that the kernel module *bridge* conflict with *openvswitch\_mod*,
thus loading the Open vSwitch module will not work with an active
*bridge* module. The *ovs-switch* script automatically handles this
conflict.

To include legacy support for *brctl* by default, add *BRCOMPAT=yes* to
*“/etc/init.d/ovs-switch”*. We will be explicitly setting *BRCOMPAT*
when calling the script, thus it is not mandatory.

# From ``wakame-vdc/tests/openflow/setup-openflow.sh'', second part.
ovsdb-tool create $OVS_PREFIX/etc/openvswitch/conf.db ./vswitchd/vswitch.ovsschema
$OVS_PREFIX/sbin/ovsdb-server --pidfile --detach --remote=punix:$OVS_PREFIX/var/run/openvswitch/db.sock $OVS_PREFIX/etc/openvswitch/conf.db
ovs-vsctl --no-wait init

The database needs to be initialized before Open vSwitch can run.

Running Open vSwitch
--------------------

# From ``wakame-vdc/tests/openflow/enable\_ovs.sh''.
# If remotely connected, use a script to ensure the
# network gets restarted.
sudo brctl delif br0 eth0
sudo ip link set br0 down
sudo brctl delbr br0

export BRCOMPAT=yes
sudo /etc/init.d/ovs-switch restart
sudo /etc/init.d/networking restart

Check that *bridge* module got unloaded and *ovs-vswitchd* is
up-and-running. When the network got restarted *br0* should have been
recreated automatically assuming it was defined in
*“/etc/network/interfaces”*.

# Verify that ovs-switchd works.
&gt; lsmod | grep bridge
&gt; sudo ovs-vsctl list-ports br0
eth0
&gt; sudo ovs-ofctl dump-flows br0
NXST_FLOW reply (xid=0x4):
cookie=0x0, duration=11601.804s, table=0, n_packets=0, n_bytes=0, priority=0 actions=NORMAL

Connect two instances of *wireshark* to *br0* and *eth0* with the filter
*“not (tcp.port == 22) and not stp”* and make sure no instances are
already running. Launch a single instance and start monitoring the
*vif-xxxxxxxx* interface with another wireshark session. There should be
unsuccessful attempts by the instance to connect to 169.254.169.254,
which will not show up in *br0*.

When the instance boots up it should have gotten information about the
default gateway for outgoing traffic, thus packets to IP addresses
outside the local network (like 169.254.169.254) will not result in ARP
requests that the *OpenFlow* switch can modify. As such the packet is
pushed out *eth0* and will not be seen by listening ports on the host
even if we modify the destination IP address.

Configuring Wakame for OpenFlow
-------------------------------

Adding flows
------------

# Define a few variables.
export HOST_IP=192.168.2.23
export HOST_PORT=9002
export HOST_HW=00:1e:0b:ea:fb:7e
export GATEWAY_HW=88:43:e1:42:4f:60

Match packets to 169.254.169.254:80 with the gateway datalink address,
and modify them to the host ip, port and datalink address.

Then output to local, which is a special port that makes allows the
packet to be received by local programs through br0.

# Redirect packets from instance going to 169.254.169.254:80.
sudo ovs-ofctl add-flow br0 \
priority=100,idle_timeout=50000,tcp,\
dl_dst=$GATEWAY_HW,nw_dst=169.254.169.254,tp_dst=80,\
actions=mod_dl_dst:$HOST_HW,mod_nw_dst:$HOST_IP,\
mod_tp_dst:$HOST_PORT,local

The returning packet is again modified so as to appear to come from the
gateway, with the choice to either use "output:2" if we know the port or
"flood" to send it out all ports.

# Restore expected source for packets from 169.254.169.254:80.
sudo ovs-ofctl add-flow br0 \
priority=100,idle_timeout=50000,tcp,\
dl_src=$HOST_HW,nw_src=$HOST_IP,tp_src=$HOST_PORT,\
actions=mod_dl_src:$GATEWAY_HW,\
mod_nw_src:169.254.169.254,mod_tp_src:80,output:2

After installing the flows, HTTP connection attempts should show up on
*lo*, not *eth0*, and the destination IP address, port and datalink
address will have changed.

The above flows should allow the instances to contact the meta-data
server.

Adding an OpenFlow controller
-----------------------------

git clone git://github.com/trema/trema
cd trema &amp;&amp; ./build.sh

# Verify Trema runs.
./trema run -v ./src/examples/learning_switch/learning-switch.rb

sudo /usr/share/axsh/ovs-switch/bin/ovs-vsctl set-controller br0 tcp:127.0.0.1

# To run the wakame-vdc compatible Trema controller.
./trema/trema run ../wakame-vdc/dcmgr/bin/ofc

Setting a controller will remove the default flow, so if the controller
does not work properly connection to the host may be lost for a while if
until the fail-mode kicks in.

The “learning-switch” is a simple L2 learning switch, which in it’s
initial state will not allow instances to connect to the meta-data
server.

Integrating OpenFlow
====================

One thing to realize about OpenFlow that it is not intended to provide
for per-connection dynamic NAT or routing, except in special cases. The
cost of handing a packet to the controller for analysis and installation
of a connection-specific set of flows is relatively high.

Rather it is in the construction of a dynamicly configurable virtual
network where the strength of *OpenFlow* lies, and as such modifications
to how security groups and private/public IPs work might be prudent.

A couple potential candidate solutions are presented below, and support
for several of these should not require much additional effort and could
find use in different use-cases.

Accessing 169.254.169.254:80
----------------------------

Note that different tables should be used in order to optimize matching
and minimize number of unnesseary comparisons. E.g. all the flows that
match *n**w*\_*d**s**t* = 169. 254. 169. 254, *t**p*\_*d**s**t* = 80 for
Dynamic NAT should be in a dedicated table, with table 0 (classifier)
sending any packets matching the ip and port to the table.

# For each non-instance and local ports, drop 169.254.169.254:80.
priority=200,tcp,in_port=$IGN_PORT,\
dl_dst=$HOST_HW,nw_dst=169.254.169.254,tp_dst=80,\
actions=drop

### With Dynamic NAT using per-connection flows (CURRENTLY TESTING)

An *OpenFlow* switch does not have native support for Dynamic NAT,
however one can simulate such functionality through installing flows as
a reaction to specific packets.

Matching against DNAT flows happens before passing to controller.

# Pass to controller any new connection to 169.254.169.254:80.
priority=100,tcp,\
nw_dst=169.254.169.254,tp_dst=80,\
actions=controller

When the controller received an unmatched packet, we install a set of
new temporary flows to handle this particular connection.

# Per-connection DNAT flow matching instance to 169.254.169.254:80 packets.
priority=101,tcp,idle_timeout=300,in_port=$INST_PORT,\
dl_src=$INST_HW,nw_src=$INST_IP,tp_src=$SRC_PORT,\
dl_dst=$GATE_HW,nw_dst=169.254.169.254,tp_dst=80,\
actions=mod_dl_dst:$HOST_HW,mod_nw_dst:$HOST_IP,mod_tp_dst:9002,\
local

# Per-connection DNAT flow matching return packets.
priority=101,tcp,idle_timeout=300,in_port=local,\
dl_src=$HOST_HW,nw_src=$HOST_IP,tp_src=9002,\
dl_dst=$INST_HW,nw_dst=$INST_IP,tp_dst=$SRC_PORT,\
actions=mod_dl_src:$GATE_HW,mod_nw_src:169.254.169.254,mod_tp_src:80,\
output:$INST_PORT

### With Dynamic NAT using per-instance flows

# Per-instance DNAT flow matching packets to 169.254.169.254:80.
priority=101,tcp,in_port=$INST_PORT,\
dl_src=$INST_HW,nw_src=$INST_IP,\
dl_dst=$GATE_HW,nw_dst=169.254.169.254,tp_dst=80,\
actions=mod_dl_dst:$HOST_HW,mod_nw_dst:$HOST_IP,mod_tp_dst:9002,\
local

If the above rule is not matched, we send the packet to the controller
which can then install a new set of flows for that particular gateway
mac/in\_port pair.

# Per-gateway DNAT flow matching return packets.
priority=101,tcp,in_port=local,\
dl_src=$HOST_HW,nw_src=$HOST_IP,tp_src=9002,\
dl_dst=$INST_HW,nw_dst=$INST_IP,\
actions=mod_dl_src:$GATE_HW,mod_nw_src:169.254.169.254,mod_tp_src:80,\
output:$INST_PORT

Note that access to HOST\_IP:9002 from the instance will conflict with
the return flow. The benefits are that there only needs to be installed
a set of flows on first access to the metadata server by an instance,
which means that subsequent accesses will not suffer any delay.

### With dedicated metadata-server subnet

Instead of relying on the instance attempting to send the packets to any
random gateway who claims to route to 169.254.169.254, we explicitly add
a subnet for connecting to the metadata server.

E.g. with 169.254.169.252/30 added to *eth0* any packets sent to
169.254.169.254:80 will be have consistent datalink and network address
allowing for simpler flows to do routing.

When an instance sends an ARP requests from 169.254.169.252 the
controller will return a response, and possibly also send an ARP
broadcast to newly started instances.

There are some issues with the default gateway being used even for
packets bound to the 169.254.169.252 IP.

# Translate packets from instances to metadata server.
priority=100,tcp,\
nw_src=169.254.169.252,\
dl_dst=$HOST_HW,nw_dst=169.254.169.254,tp_dst=80,\
actions=mod_nw_dst:$HOST_IP,mod_tp_dst:9002,local

The return packets can use three different rules;

# Option 1; For each instance, add a return path.
priority=100,tcp,in_port=local,\
dl_src=$HOST_HW,nw_src:$HOST_IP,tp_src=9002,\
dl_dst=$INST_HW,nw_dst=169.254.169.252,\
actions=mod_nw_src:169.254.169.254,mod_tp_src:80,\
output:$INST_PORT

The above option results in having to create a metadata specific flow
for every single instance, and as such is not optimal.

# Option 2; Use the OFPP\_NORMAL output port. (OFPP\_NORMAL is an optional feature)
priority=100,tcp,in_port=local,\
dl_src=$HOST_HW,nw_src:$HOST_IP,tp_src=9002,\
nw_dst=169.254.169.252,\
actions=mod_nw_src:169.254.169.254,mod_tp_src:80,\
normal

A simple solution would be to take advantage of the OFPP\_NORMAL support
in Open vSwitch, which does normal L2/L3 switching.

# Option 3; Use a separate table for L2 switching.
priority=100,tcp,in_port=local,\
dl_src=$HOST_HW,nw_src:$HOST_IP,tp_src=9002,\
nw_dst=169.254.169.252,\
actions=mod_nw_src:169.254.169.254,mod_tp_src:80,\
resubmit(,$L2_INSTANCE_TABLE)

In the future we should aim at adding a table that acts as an L2 switch
for the instances, and use that for both normal packet switching and to
process packets we have modified.

L2/L3 switching with OpenFlow
-----------------------------

*OpenFlow* has two different approaches to handling L2 switching;
sending packets out the OFPP\_NORMAL port to process using the normal
L2/L3 switch, or one can use flows to switch the packets to the right
ports.

Performance and suitability of OFPP\_NORMAL is still unknown, being an
optional part of the *OpenFlow* specification (as of 1.1). For that
reason we need to implementent an L2 switch in our controller,
particularly for switching packets to instances.

Note that network address matches in flows need to be defined both for
arp and ip type, and the controller must provide faked ARP responses in
some cases.

### L2 switching, default network

All L2 traffic not matching any of the L3 specific flows will receive
normal L2 processing.

# Required flows.
From instance A: (table classifier)
priority=$LOW,in_port=$A_PORT,dl_src=$A_HW,action=resubmit(,$SWITCH_NORMAL)

From any host C: (table classifier)
priority=$LOW,in_port=$ETH_OR_LOCAL,action=resubmit(,$SWITCH_NORMAL)

To instance B: (table switch_normal)
dl_dst=$B_HW,action=output:$B_PORT

To any host C: (table switch_normal)
dl_dst=$C_HW,action=output:$ETH_PORT

We can replace the \$SWITCH\_NORMAL table with OFPP\_NORMAL, however
that might be an issue for filtering out unwanted packets to private
networks.

Only pass through L2 packets if they aren’t for the private IP’s.

### L3 switching, publically routable private IPs

# Required flows.
From instance A: (table classifier)
in_port=$A_PORT,nw_src=$A_PRIVATE_1_IP,action=set_metadata:$PRIVATE_1,resubmit(,$SWITCH_PRIVATE)

From any host C: (table classifier)
in_port=$ETH_PORT,nw_dst=$B_PRIVATE_1_IP,action=set_metadata:$PRIVATE_1,resubmit(,$VERIFY_SOURCE)

To instance B: (table switch_private)
dl_dst=$B_HW,nw_dst=$B_PRIVATE_1_IP,metadata=$PRIVATE_1,action=output:$B_PORT

To any host C: (table switch_private) (populate on demand with dl/nw_dst?)
priority=$LOWEST,action=output:$ETH_PORT

Drop unknown traffic to private IPs: (table switch_normal)
dl_dst=$X_HW,nw_dst=$X_PRIVATE_1_IP,action=drop

Drop any unmatched packets from the network: (table switch_private)
priority=$LOW,in_port=$ETH_PORT,action=drop

Verify source: (table verify_source) (populate on-demand, table action: controller)
nw_src=$C_PRIVATE_1_IP,metadata=$PRIVATE_1,action=resubmit(,$SWITCH_PRIVATE)

Verify destination: (table verify_destination) (populate on-demand, drop table action)
nw_dst=$C_PRIVATE_1_IP,metadata=$PRIVATE_1,action=output:$ETH_PORT

We don’t need to verify outgoing private ip addresses as the reply
packet will never get past the filters, thus no connection to
un-verified IP’s will never succeed.

### L3 switching, vlan/mpls

Assumption is that vlan or mpls is properly supported on the network.

# Required flows.
From instance A: (table classifier)
in_port=$A_PORT,nw_src=$A_VLAN_1_IP,action=set_metadata:$VLAN_1,resubmit(,$SWITCH_VLAN)

From any host C: (table classifier) (remove nw_dst)
in_port=$ETH_PORT,vlan=$VLAN_1,action=strip_vlan,set_metadata:$VLAN_1,resubmit(,$SWITCH_VLAN)

To instance B: (table switch_vlan)
dl_dst=$B_HW,nw_dst=$B_VLAN_1_IP,metadata=$VLAN_1,action=output:$B_PORT

To any host C: (table switch_vlan) (populate on demand with dl/nw_dst?)
priority=$LOWEST,metadata=$VLAN_1,action=add_vlan:$VLAN_1,output:$ETH_PORT

Drop any unmatched packets from the network: (table switch_vlan)
priority=$LOW,in_port=$ETH_PORT,action=drop

### L2 switching, virtual network with PBB

A fully L2 virtualized network will require each instance connected to
this network to have a dedicated vnic for access, separate from one with
access to the regular network. Main reason for this is the need for a
dedicated datalink address and ability to fully control what packets
each interface sees.

*OpenFlow* data structures only deals with one datalink address per port
and for example ARP broadcasts, requests and replies would not be
possible to segregate with a single outport.

Note that L2 virtualized networks are currently messy to implement using
current *OpenFlow* 1.1 specification, as support for encapsulating
datalink layer packets is not directly supported. The two following
improvements would ease implementation considerably, and they may be
partially available in Open vSwitch;

# OpenFlow 1.2 proposal suited for L2 vnetwork implementation
http://www.openflow.org/wk/index.php/OpenFlow_1_2_proposal#Virtual_Port_Tunnel_configuration_protocol
http://www.openflow.org/wk/index.php/OpenFlow_1_2_proposal#PBB_support_.28MAC_in_MAC.29

With these features implemented, we can create virtual ports that tunnel
to specific hosts automatically encapsulating packets without the need
to have external services running or a myriad of virtual network
interfaces.

# Required flows.
From instance A: (table classifier)
in_port=$A_VIRT_PORT,action=set_metadata:$VNET_1,resubmit(,$SWITCH_VNET)

From any host C: (table classifier)
in_port=$ETH_VIRT_PORT,pbb_id=$VNET_1,action=strip_pbb,set_metadata:$VNET_1,resubmit(,$SWITCH_VNET)

To instance B: (table switch_vnet)
dl_dst=$B_VNET_1_MAC,metadata=$VNET_1,action=output:$B_VIRT_PORT

To any host C: (table switch_vnet) (populate on-demand)
dl_dst=$C_VNET_1_MAC,metadata=$VNET_1,action=add_pbb:$VNET_1,output:$ETH_VIRT_PORT

### L2 switching, virtual network with OpenFlow routers

Work-in-progress...

Implementation issues and restrictions of current OpenFlow
----------------------------------------------------------

### Lack of OpenFlow action for rewriting ARP packets

As the current specification and implementations of OpenFlow stand at
this moment, it is not possible to rewrite the content of ARP packets in
the fast-path. That is to say, the datalink and ip address for source
and target cannot be changed.

Thus the OpenFlow controller is relied on to rewrite ARP packets, with
flows only useful for routing.

This issue can be worked around by adding flows for sending all ARP
packets to the OpenFlow controller and performing modifications there.
This should be sufficient if combined with flows for dropping unwanted
ARP requests / replies.

### Circumvention of flow table by localhost sending ARP requests

# [ovs-discuss] ARP Behavior in XenServer Host
http://openvswitch.org/pipermail/discuss/2011-September/005624.html  

To guarantee that communication with the OpenFlow controller does not
get disrupted, ovs-switchd uses in-band communication that circumvents
the flow table. This results in e.g. ARP packets from localhost not
being passed to the flow table.

# Disable in-band communication with the controller.
ovs-vsctl set bridge br0 other_config:disable-in-band=true

Disabling use of in-band communication between ovs-vswitch and the
controller fixes this issue, however it depends on the flow table always
being properly configured.

The optimal solution would be using unix socket for controller
communication, however ovs-vswitch has disabled unix sockets due to the
risk of remote exploits. A fix would need to be implemented so as to
restrict the ability of users to use unix sockets for malicious
purposes.

Another solution, as discussed in the thread above, includes only using
in-band channels for communication with the tracker itself. E.g. those
packets with address of the controller would be routed in-band, while
the remaining would be handled by the flow tables.

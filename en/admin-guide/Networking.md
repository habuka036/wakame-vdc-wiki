The Wakame-vdc team is currently working on full network virtualization
using OpenFlow. In the current version 11.06 beta, you will have to
configure your network hardware yourself and then register them to
Wakame-vdc. This article assumes that you have basic networking
knowledge.

Registering networks
====================

First you will have to configure a default gateway and make sure it is
reachable from the Wakame-vdc nodes you are using. Also make sure that
there is no DHCP server present in the network. Wakame-vdc will create
its own DHCP server to provision with instances with their static IPs.
After the gateway's set up, you can use the [admin
CLI](vdc-manage "wikilink") to set them up.

Let's say we want to place our instances in the network `192.168.0.0/24`
with the gateway at `192.168.0.1` and Wakame-vdc's [dcmgr
node](dcmgr "wikilink") at `192.168.0.2`. We will register this network
to the account `a-shpoolxx`. This is a system account that we use for
shared resources. We'll assign a domain name of `vdc.local` to our
network.

`cd /usr/share/axsh/wakame-vdc/dcmgr/bin`  
`./vdc-manage network add --ipv4-gw 192.168.0.1 \`  
`--prefix 24 \`  
`--account a-shpoolxx \`  
`--metadata 192.168.0.2 \`  
`--metadata-port 9002 \`  
`--vlan-id 0 \`  
`--dns 192.168.0.2 \`  
`--dhcp 192.168.0.2 \`  
`--domain vdc.local`

The above command explained:

-   **--ipv4-gw 192.168.0.1**: This is the default gateway for the
network being registered.
-   **--prefix 24**: This is the routing prefix that determines how many
IP addresses are available in this network.
-   **--account a-shpoolxx**: Sets a-shpoolxx as the account to own this
network.
-   **--metadata 192.168.0.2**: The IP address where the metadata server
for this network is running. Instances in the network will use this
to fetch information like their hostname, trusted public keys, etc.
-   **--metadata-port 9002**: The port on which the [metadata
server](Machine Image#Metadata "wikilink") listens. From inside an
instance, this will always be port 80. Wakame-vdc makes sure that it
is rerouted to the port specified here.
-   **--vlan-id 0**: The vlan tag that should be added to packets from
this network. Setting this to 0 like we are doing here, means that
we're not using VLAN.
-   **--dns 192.168.0.2**: If we use a domain name for this network,
Wakame-vdc will provide a DNS server that gives instances a DNS
mapping of `hostname.domain_name`. This is the IP of the node that
runs that DNS server.
-   **--dhcp 192.168.0.2**: Wakame-vdc uses a DHCP server to distribute
IP addresses to the instances. This is the IP of the node that is
running that DHCP server.
-   **--domain vdc.local**: The domain name that instances in this
network should use. If an instance with hostname `u4nc95ls` is
started, his DNS name will become `u4nc95ls.vdc.local`

If the above command is run successfully, it will return the unique ID
of the network you have just registered.

Reserving IP addresses
======================

When starting an instance in your network, Wakame-vdc will lease it a
random IP address from that network. Wakame-vdc keeps track of which IP
addresses have been assigned but is not automatically aware of other
Wakame nodes in the same network. To make sure their IP addresses don't
get leased to instances, you have to reserve them manually with [admin
CLI](vdc-manage "wikilink"). You can do so with the following command,
substituting the network id and ip address for your own values.

`cd /usr/share/axsh/wakame-vdc/dcmgr/bin`  
`./vdc-manage network reserve `**`nw-demonet`**` -i `**`192.168.0.2`**

Configuring NSA
===============

Wakame-vdc provisions its instances with IP addresses through a DHCP
server. This server is run by Wakame-vdc's *Naming Service Agent* or NSA
for short. You should have one in every network you want Wakame-vdc to
provision IP addresses for. If your network has a domain name, the NSA
will also handle DNS for that.

nsa.conf
--------

Any configuration of NSA is done in
`/usr/share/axsh/wakame-vdc/dcmgr/config/nsa.conf`.

NSA uses dnsmasq to handle both DHCP and DNS. Therefore it needs to know
where the dnsmasq binary is installed. Usually this is
`/usr/sbin/dnsmasq`.

You also have to set which networks this NSA will provision. This can be
either a network id or a [network
pool](Networking#Network_pools "wikilink") id.

Substitute the values in the below example for your own.

`# path for dnsmaq binary`  
`config.dnsmasq_bin_path='`**`/usr/sbin/dnsmasq`**`'`  

`# UUID of Network or NetworkPool to be delivered DHCP.`  
`config.network_name='`**`nw-demonet`**`'`

Network pools
=============

As mentioned in the [NSA section](Networking#nsa.conf "wikilink"),
networks can be grouped into pools. This is done by creating a <tag> and
mapping networks to it. The following command creates a network tag.

`cd /usr/share/axsh/wakame-vdc/dcmgr/bin/`  
`./vdc-manage tag add -a a-shpoolxx -n my_network_pool -t 10`

The above command explained:

-   **-a a-shpoolxx**: The account that this tag will belong to. Again,
`a-shpoolxx` is a system account for shared resources.
-   **-n my\_network\_pool**: The name for our new tag.
-   **-t 10**: The type of our tag. There are various types of tags but
for now let's just remember that 10 is for networks.

If successful, the command will return the id of your new tag. This will
look somewhat like `tag-i92ya2no`. Next we can map networks to it like
this.

`./vdc-manage tag map `**`tag-i92ya2no`**` -o `**`nw-demonet`**

Repeat this command for any network you want to map to this tag. When
you have all the networks you want in there, you can set up NSA to
provision it with DHCP. To do so, set this line in
[nsa.conf](Networking#nsa.conf "wikilink").

`config.network_name='`**`tag-i92ya2no`**`'`

Static NAT
==========

Wakame-vdc provides static NAT functionality which allows an instance to
have two IP addresses each of which is in another network. This is
mostly used for making an instance accessible from the outside public
network.

To use NAT, you have to [register two
networks](Networking#Registering_networks "wikilink") and then mark one
of them as the other's *outside network*. Let's say we have registered
networks `nw-inside` and `nw-outside`. You can use the [admin
CLI](vdc-manage "wikilink") to map them together.

`cd /usr/share/axsh/wakame-vdc/dcmgr/bin/`  
`./vdc-manage network nat `**`nw-inside`**` -o `**`nw-outside`**

Any new instances started in `nw-inside` from now will get two IP
addresses leased to them. An IP from `nw-inside` will be assigned to the
instance's NIC and used for any connections to other instance in the
same [security group](Networking#Security_Groups "wikilink"). Whenever
the instance connects to any IP address that doesn't belong to the same
security group, it will use the an address from `nw-outside`.

Security Groups
===============

Instances are started in the *Hypervisor agent* (HVA) nodes. Each of
these use Linux Netfilter to set up a firewall and
[|NAT](Networking#Static_NAT "wikilink"). The former is a standard
whitelist principle. By default all incoming packets are dropped except
those that have been explicitly authorized. This is where security
groups come in.

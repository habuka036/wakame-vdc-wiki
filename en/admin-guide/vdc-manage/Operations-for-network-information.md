**Register a new network entry**
--------------------------------

SYNOPSIS  
vdc-manage network add [options] --account-id=ACCOUNT\_ID
--ipv4-network=IPV4\_NETWORK --prefix=N

DESCRIPTION  
Register a newnetwork entry.

'--account-id', 'ipv4-network' and 'prefix' options are required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this network belongs to. required.

--ipv4-network=IPV4\_NETWORK


IPv4 network address. required.

--prefix=N


IP network mask size (1 \< prefix \< 32). required.

--bandwidth=N


The maximum bandwidth for the network in Mbit/s.

--metadata-port=METADATA\_PORT


Port for the metadata server of the network.

--link-interface=LINK\_INTERFACE


Link interface name from virtual interfaces.

--metric=N


Routing priority order of this network segment. Default: 100

--vlan-id=N


Tag VLAN (802.1Q) ID of the network. 0 is for no VLAN network. Default:
0

--domain=DOMAIN


DNS domain name of the network.

--ipv4-gw=IPV4\_GW


Gateway address for IPv4 network.

--description=DESCRIPTION


Description for the network.

--dns=DNS


IP address for DNS server of the network.

--uuid=UUID


The UUID for the new network. It's necessary that prefix is 'nw-'.

In addition, the string after the prefix will be within 255
characters.(any string)

--dhcp=DHCP


IP address for DHCP server of the network.

--metadata=METADATA


IP address for metadata server of the network.

**Delete registered network entry**
-----------------------------------

SYNOPSIS  
vdc-manage network del *UUID*

DESCRIPTION  
Unregister the network specified by *UUID*.

**Add dynamic IP address range to the network**
-----------------------------------------------

SYNOPSIS  
vdc-manage network dhcp addrange *UUID* *ADDRESS\_BEGIN* *ADDRESS\_END*

DESCRIPTION  
Add dynamic IP address range to the network.

*UUID* is the UUID of the network.

Register the IP address of the range of *ADDRESS\_BEGIN* -
*ADDRESS\_END*.

**Delete dynamic IP address range from the network**
----------------------------------------------------

SYNOPSIS  
vdc-manage network dhcp delrange *UUID* *ADDRESS\_BEGIN* *ADDRESS\_END*

DESCRIPTION  
Delete dynamic IP address range from the network.

*UUID* is the UUID of the network.

Unregister the IP address of the range of *ADDRESS\_BEGIN* -
*ADDRESS\_END*.

**Describe subcommands for 'dhcp**'
-----------------------------------

SYNOPSIS  
vdc-manage network dhcp help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [addrange,
delrange, help].

If omitted, returns the simple use of all of the subcommands.

**Set forward interface for network**
-------------------------------------

SYNOPSIS  
vdc-manage network forward *UUID* *PHYSICAL*

DESCRIPTION  
Set forward interface for network.

*UUID* is the UUID of the network.

*PHYSICAL* is the name of physical network.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage network help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del,
forward, help, leases, modify, nat, release, reserve, show].

If omitted, returns the simple use of all of the subcommands.

**Show IPs used in the network**
--------------------------------

SYNOPSIS  
vdc-manage network leases *UUID*

DESCRIPTION  
Show IPs used in the network.

*UUID* is the UUID of the network.

**Modify an existing network**
------------------------------

SYNOPSIS  
vdc-manage network modify *UUID* [options] --ipv4-network=IPV4\_NETWORK

DESCRIPTION  
Modify a registered network specified by *UUID*.

' --ipv4-network=IPV4\_NETWORK' option is required.

The updated value of the options specified.

OPTIONS  
--ipv4-network=IPV4\_NETWORK


IPv4 network address. required.

--account-id=ACCOUNT\_ID


The UUID of the account that this network belongs to.

--prefix=N


IP network mask size (1 \< prefix \< 32).

--bandwidth=N


The maximum bandwidth for the network in Mbit/s.

--metadata-port=METADATA\_PORT


Port for the metadata server of the network.

--link-interface=LINK\_INTERFACE


Link interface name from virtual interfaces.

--metric=N


Routing priority order of this network segment. Default: 100

--vlan-id=N


Tag VLAN (802.1Q) ID of the network. 0 is for no VLAN network. Default:
0

--domain=DOMAIN


DNS domain name of the network.

--ipv4-gw=IPV4\_GW


Gateway address for IPv4 network.

--description=DESCRIPTION


Description for the network.

--dns=DNS


IP address for DNS server of the network.

--uuid=UUID


The UUID for the new network. It's necessary that prefix is 'nw-'.

In addition, the string after the prefix will be within 255
characters.(any string)

--dhcp=DHCP


IP address for DHCP server of the network.

--metadata=METADATA


IP address for metadata server of the network.

**Set or clear nat mapping for a network**
------------------------------------------

SYNOPSIS  
vdc-manage network nat *UUID* [options]

DESCRIPTION  
Set/clear nat mapping for a network specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--outside-network-id=OUTSIDE\_NETWORK\_ID


The network that this network will be natted to.

--clear


Clears a previously natted network.

**Add new physical network**
----------------------------

SYNOPSIS  
vdc-manage network phy add *NAME* [options]

DESCRIPTION  
Add new physical network specified by *NAME*.

OPTIONS  

--null

**Delete physical network**
---------------------------

SYNOPSIS  
vdc-manage network phy del *NAME*

DESCRIPTION  
Delete physical network specified by *NAME*.

**Describe subcommands for 'phy**'
----------------------------------

SYNOPSIS  
vdc-manage network phy help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del, help,
modify, show].

If omitted, returns the simple use of all of the subcommands.

**Modify physical network parameters**
--------------------------------------

SYNOPSIS  
vdc-manage network phy modify *NAME* [options]

DESCRIPTION  
Modify parameters of physical network specified by *NAME*.

The updated value of the options specified.

OPTIONS  
--null


Do not attach to any physical interfaces.

--description=DESCRIPTION


Description for the physical network.

--interface=INTERFACE


Physical interface name on host nodes.

**Show list of the physical network**
-------------------------------------

SYNOPSIS  
vdc-manage network phy show *NAME*

DESCRIPTION  
Show list of physical network and details.

*NAME* is the name of the target physical network.

If omitted, returns the list of the key pairs.

**Release a reserved IP from the network**
------------------------------------------

SYNOPSIS  
vdc-manage network release *UUID* --ipv4=IPV4

DESCRIPTION  
Release a reserved IP(specified by '--ipv4' option) from the network.

OPTIONS  
--ipv4=IPV4


The ip address to release. required.

*Add reserved IP to the network*'
---------------------------------

SYNOPSIS  
vdc-manage network reserve *UUID* --ipv4=IPV4

DESCRIPTION  
Add reserved IP(specified by '--ipv4' option) to the network.

OPTIONS  
--ipv4=IPV4


The ip address to reserve. required.

**Show list of networks**
-------------------------

SYNOPSIS  
vdc-manage network show [*UUID*]

DESCRIPTION  
Show list of networks and details.

*UUID* is UUID of the target key pair.

If *UUID* is specified, returns the details of the network entry.

If omitted, returns the list of the networks.

OPTIONS  
--vlan-id=N


Show networks in the VLAN ID.



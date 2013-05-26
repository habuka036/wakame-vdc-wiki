Instances | <Images> | [Host Nodes](Host Nodes "wikilink") | <Volumes> |
[Volume Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | [Storage
Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of instances.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instances`

### Method

GET

### Request Parameters

<table>
<thead>
<tr class="header">
<th align="left"><p>parameter</p></th>
<th align="left"><p>type</p></th>
<th align="left"><p>required</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>limit</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Maximum number of items in the result.<br />If omitted, set to nil.</p></td>
</tr>
<tr class="even">
<td align="left"><p>start</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Offset value to the result starts from.<br />If omitted, set to 0.</p></td>
</tr>
<tr class="odd">
</tr>
</tbody>
</table>

### Response

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>limit</p></td>
<td align="left"><p>Maximum number of items in the result.</p></td>
</tr>
<tr class="even">
<td align="left"><p>owner_total</p></td>
<td align="left"><p>Number of total instances the user can access.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>result</p></td>
<td align="left"><p>A list of the instances.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
<tr class="even">
<td align="left"><p>start</p></td>
<td align="left"><p>Offset value to the result starts from.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show a instance details.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instances/id`

### Method

GET

### Request Parameters

<table>
<thead>
<tr class="header">
<th align="left"><p>parameter</p></th>
<th align="left"><p>type</p></th>
<th align="left"><p>required</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the instance to get the status. UUID representation of this instance.<br />It's necessary that prefix is 'i-'.</p></td>
</tr>
</tbody>
</table>

### Response

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>cpu_cores</p></td>
<td align="left"><p>Number of cpu core of this instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ha_enabled</p></td>
<td align="left"><p>If the HA feature is enabled, this flag is true. false otherwise.</p></td>
</tr>
<tr class="even">
<td align="left"><p>hostname</p></td>
<td align="left"><p>The name of the host, running this instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>ID of the instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>image_id</p></td>
<td align="left"><p>ID of the machine image of this instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>instance_spec_id</p></td>
<td align="left"><p>ID of the instance spec of this instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>memory_size</p></td>
<td align="left"><p>Size of memory of this instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>network</p></td>
<td align="left"><p>A list of networks.<br />The element of the list, please see the table below.</p></td>
</tr>
<tr class="even">
<td align="left"><p>security_groups</p></td>
<td align="left"><p>One or more ID's of the security groups.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ssh_key_pair</p></td>
<td align="left"><p>ID of the ssh key pair.</p></td>
</tr>
<tr class="even">
<td align="left"><p>state</p></td>
<td align="left"><p>State of this instance.<br />scheduling / pending / starting / running / failingover / shuttingdown / terminated</p></td>
</tr>
<tr class="odd">
<td align="left"><p>status</p></td>
<td align="left"><p>Health status about this instace.<br /> online / offline.</p></td>
</tr>
<tr class="even">
<td align="left"><p>vif</p></td>
<td align="left"><p>A list of the instance NIC.<br />The element of the list, please see the table below.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>volume</p></td>
<td align="left"><p>A list of volumes.<br />The element of the list, please see the table below.</p></td>
</tr>
</tbody>
</table>

**Element of the list of networks**

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>dns_name</p></td>
<td align="left"><p>Domain name of DNS.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ipaddr</p></td>
<td align="left"><p>IP address (ipv4).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>nat_dns_name</p></td>
<td align="left"><p>Domain name of DNS for NAT.</p></td>
</tr>
<tr class="even">
<td align="left"><p>nat_ipaddr</p></td>
<td align="left"><p>IP address for NAT (ipv4).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>nat_network_name</p></td>
<td align="left"><p>name of NAT network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>network_name</p></td>
<td align="left"><p>name of the network.</p></td>
</tr>
</tbody>
</table>

**Element of the list of the voluems**

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>guest_device_name</p></td>
<td align="left"><p>name of the guest device.</p></td>
</tr>
<tr class="even">
<td align="left"><p>state</p></td>
<td align="left"><p>status of the volume.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>vol_id</p></td>
<td align="left"><p>ID of the volume.</p></td>
</tr>
</tbody>
</table>

**Element of the list of the instance NIC**

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ipv4</p></td>
<td align="left"><p>Hash of the ipaddress information, consites following items.</p></td>
</tr>
<tr class="even">
<td align="left"><p>vif_id</p></td>
<td align="left"><p>ID of the instance NIC.</p></td>
</tr>
</tbody>
</table>

**Hash of the ipaddress information**

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>address</p></td>
<td align="left"><p>IP address.</p></td>
</tr>
<tr class="even">
<td align="left"><p>nat_address</p></td>
<td align="left"><p>IP address of nat.</p></td>
</tr>
</tbody>
</table>

**create**
==========

### Description

Runs a new VM instance.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instances`

### Method

POST

### Request Parameters

<table>
<thead>
<tr class="header">
<th align="left"><p>parameter</p></th>
<th align="left"><p>type</p></th>
<th align="left"><p>required</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>ha_enabled</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>If you enable the HA feature are true, false otherwise. Default is false.</p></td>
</tr>
<tr class="even">
<td align="left"><p>hostname</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Name of the instance to launch. Will be downcased automatically.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>host_node_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the host node to launch the instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>image_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the machine imange for launch the instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>instance_spec_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the instance spec for launch the instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>network_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>security_groups</p></td>
<td align="left"><p>array</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>One or more ID's of the security groups.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ssh_key_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the ssh key pair.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>user_data</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Any string for user.</p></td>
</tr>
</tbody>
</table>

### Response

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>cpu_cores</p></td>
<td align="left"><p>Number of cpu core of this instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ha_enabled</p></td>
<td align="left"><p>If the HA feature is enabled, this flag is true. false otherwise.</p></td>
</tr>
<tr class="even">
<td align="left"><p>hostname</p></td>
<td align="left"><p>The name of the host, running this instace.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>ID of the instance. UUID representation of this instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>image_id</p></td>
<td align="left"><p>ID of the machine image of this instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>instance_spec_id</p></td>
<td align="left"><p>ID of the instance spec of this instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>memory_size</p></td>
<td align="left"><p>Size of memory of this instance.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>network</p></td>
<td align="left"><p>A List of networks.<br />The element of the list, please see the 'Responce' of 'show' method.</p></td>
</tr>
<tr class="even">
<td align="left"><p>security_groups</p></td>
<td align="left"><p>One or more ID's of the security groups.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ssh_key_pair</p></td>
<td align="left"><p>ID of the ssh key pair.</p></td>
</tr>
<tr class="even">
<td align="left"><p>state</p></td>
<td align="left"><p>State of this instance.<br />Always return the 'scheduling'.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>status</p></td>
<td align="left"><p>Health status about this instace.<br /> Always return the 'offline'.</p></td>
</tr>
<tr class="even">
<td align="left"><p>vif</p></td>
<td align="left"><p>A list of the instance NIC.<br />The element of the list, please see the 'Responce' of 'show' method.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>volume</p></td>
<td align="left"><p>A list of volumes.<br />The element of the list, please see the 'Responce' of 'show' method.<br />The volume state is scheduling.</p></td>
</tr>
</tbody>
</table>

**destroy**
===========

### Description

Shutdown the instance

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instances/id`

### Method

DELETE

### Request Parameters

<table>
<thead>
<tr class="header">
<th align="left"><p>parameter</p></th>
<th align="left"><p>type</p></th>
<th align="left"><p>required</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the instance to be destroied. UUID representation of this instance.<br />It's necessary that prefix is 'i-'.</p></td>
</tr>
</tbody>
</table>

### Response

ID of the shuting down instance.

**reboot**
==========

### Description

Reboots the instance

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instances/id/reboot`

### Method

PUT

### Request Parameters

<table>
<thead>
<tr class="header">
<th align="left"><p>parameter</p></th>
<th align="left"><p>type</p></th>
<th align="left"><p>required</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the instance to be rebooted. UUID representation of this instance.<br />It's necessary that prefix is 'i-'.</p></td>
</tr>
</tbody>
</table>

### Response

Returns a empty list of json format.

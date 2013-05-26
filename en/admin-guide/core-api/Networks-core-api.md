[Instances](Instance-core-api)\|[Images](Images-core-api)\|[Host Nodes](Host-Nodes-core-api)\|[Volumes](Volumes-core-api)\|
[Volume Snapshots](Volume-Snapshots-core-api)\|[Security Groups](Security-Groups-core-api)\|[Storage Nodes](Storage-Nodes-core-api)\|[SSH key pairs](SSH-key-pairs-core-api)\|[Networks](Networks-core-api)\|[Instance specs](Instance-specs-core-api)  

**index**
=========

### Description

List networks in account.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks`

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
<td align="left"><p>start</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Offset value to the result starts from.<br />If omitted, set to 0.</p></td>
</tr>
<tr class="even">
<td align="left"><p>limit</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Maximum number of items in the result.<br />If omitted, set to nil.</p></td>
</tr>
</tbody>
</table>

### Responce

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>owner_total</p></td>
<td align="left"><p>Number of total networks the user can access.</p></td>
</tr>
<tr class="even">
<td align="left"><p>start</p></td>
<td align="left"><p>Offset value to the result starts from.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>limit</p></td>
<td align="left"><p>Maximum number of items in the result.</p></td>
</tr>
<tr class="even">
<td align="left"><p>result</p></td>
<td align="left"><p>A list of the networks.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Retrieve details about a network.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id`

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
<td align="left"><p>ID of the network to get the status. UUID representation of this network. It's necessary that prefix is 'nw-'.</p></td>
</tr>
</tbody>
</table>

### Responce

<table>
<thead>
<tr class="header">
<th align="left"><p>field</p></th>
<th align="left"><p>description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>id</p></td>
<td align="left"><p>ID of the network. UUID representation of this network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own the network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ipv4_network</p></td>
<td align="left"><p>IP address of the network(ipv4).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ipv4_gw</p></td>
<td align="left"><p>Default gateway adress of the network(ipv4).</p></td>
</tr>
<tr class="even">
<td align="left"><p>prefix</p></td>
<td align="left"><p>Netmask bit length. it will be set 24.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>metric</p></td>
<td align="left"><p>Metric of the network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>domain_name</p></td>
<td align="left"><p>Domain name of the network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>dns_server</p></td>
<td align="left"><p>IP address of DNS server.</p></td>
</tr>
<tr class="even">
<td align="left"><p>dhcp_server</p></td>
<td align="left"><p>IP adress of DHCP server</p></td>
</tr>
<tr class="odd">
<td align="left"><p>metadata_server</p></td>
<td align="left"><p>IP address of metadata server.</p></td>
</tr>
<tr class="even">
<td align="left"><p>metadata_server_port</p></td>
<td align="left"><p>Port number of metadata server.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>bandwidth</p></td>
<td align="left"><p>Bandwidth of the network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>vlan_lease_id</p></td>
<td align="left"><p>ID of leased vlan.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>nat_network_id</p></td>
<td align="left"><p>ID of the nat network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>physical_network_id</p></td>
<td align="left"><p>ID of the physical network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>link_interface</p></td>
<td align="left"><p>Interface name of the link network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>description</p></td>
<td align="left"><p>Description of the network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="even">
<td align="left"><p>updated_at</p></td>
<td align="left"><p>Time of last record updated. ISO8601 form.</p></td>
</tr>
</tbody>
</table>

**create**
==========

### Description

Create new network.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks`

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
<td align="left"><p>gw</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>Default gateway adress of the network.</p></td>
</tr>
<tr class="even">
<td align="left"><p>network</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>Network address of the network.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>prefix</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Netmask bit length. it will be set 24 if none.</p></td>
</tr>
<tr class="even">
<td align="left"><p>description</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>The description for the network.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**destroy**
===========

### Description

Remove network information.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id`

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
<td align="left"><p>ID of the network to be deleted. UUID representation of this nework. It's necessary that prefix is 'sg-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of the deleting network.

**reserve**
===========

### Description

Register reserved IP address to the network.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id/reserve`

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
<td align="left"><p>ID of the network to be reserved. UUID representation of this network. It's necessary that prefix is 'nw-'.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ipaddr</p></td>
<td align="left"><p>string,array</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>IP address to be reserved of the network.</p></td>
</tr>
</tbody>
</table>

### Responce

Returns a empty list of json format.

**release**
===========

### Description

Unregister reserved IP address from the network.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id/release`

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
<td align="left"><p>ID of the network to be released. UUID representation of this network. It's necessary that prefix is 'nw-'.</p></td>
</tr>
<tr class="even">
<td align="left"><p>ipaddr</p></td>
<td align="left"><p>string,array</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>IP address to be released of the network.</p></td>
</tr>
</tbody>
</table>

### Responce

Returns a empty list of json format.

**add\_pool**
=============

### Description

Label network pool name.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/add_pool/id`

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
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>name</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

### Responce

Returns a empty list of json format.

**del\_pool**
=============

### Description

Unlabel network pool name.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id/del_pool`

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
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>name</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

### Responce

Returns a empty list of json format.

**get\_pool**
=============

### Description

List network pool name.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/networks/id/get_pool`

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
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>name</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

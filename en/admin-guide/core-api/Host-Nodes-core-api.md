<Instances> | <Images> | Host Nodes | <Volumes> | [Volume
Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | [Storage
Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the host nodes.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/host_nodes`

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
<td align="left"><p>start</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Offset value to the result starts from.</p></td>
</tr>
<tr class="even">
<td align="left"><p>limit</p></td>
<td align="left"><p>fixnum</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Maximum number of items in the result.</p></td>
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
<td align="left"><p>owner_total</p></td>
<td align="left"><p>Number of total host nodes the user can access.</p></td>
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
<td align="left"><p>A list of the host nodes.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show detail about single host node.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/host_nodes/id/`

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
<td align="left"><p>ID of the host node to get the status. UUID representation of this host node.<br />It's necessary that prefix is 'hn-'.</p></td>
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
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID representation of this host node.</p></td>
</tr>
<tr class="even">
<td align="left"><p>account_id</p></td>
<td align="left"><p>Owner account of this host node.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>status</p></td>
<td align="left"><p>Health status about this host node: online, offline</p></td>
</tr>
<tr class="even">
<td align="left"><p>arch</p></td>
<td align="left"><p>Host node architecture name: x86, x86_64</p></td>
</tr>
<tr class="odd">
<td align="left"><p>hypervisor</p></td>
<td align="left"><p>Running Hypervisor name on this node: kvm, lxc</p></td>
</tr>
<tr class="even">
<td align="left"><p>offering_cpu_cores</p></td>
<td align="left"><p>Number of virtual CPU core can be leased to instances.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>offering_memory_size</p></td>
<td align="left"><p>Amount of memory (in MB) can be leased to instances.</p></td>
</tr>
<tr class="even">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>updated_at</p></td>
<td align="left"><p>Time of last record updated. ISO8601 form.</p></td>
</tr>
</tbody>
</table>



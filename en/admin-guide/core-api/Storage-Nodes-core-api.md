<Instances> | <Images> | [Host Nodes](Host Nodes "wikilink") | <Volumes>
| [Volume Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | Storage Nodes | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the storage nodes.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/storage_nodes`

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
<td align="left"><p>Number of total storage nodes the user can access.</p></td>
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
<td align="left"><p>A list of the storage nodes.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show the storage node status.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/storage_nodes/id`

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
<td align="left"><p>ID of the storage node to get the status. UUID representation of this volume. It's necessary that prefix is 'sn-'.</p></td>
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
<td align="left"><p>ID of the storage node. UUID representation of this storage node.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the strage node.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own this security group.</p></td>
</tr>
<tr class="even">
<td align="left"><p>status</p></td>
<td align="left"><p>The status of storage node.<br />[offline, online, timeout]</p></td>
</tr>
<tr class="odd">
<td align="left"><p>export_path</p></td>
<td align="left"><p>The base path of volume files.</p></td>
</tr>
<tr class="even">
<td align="left"><p>offering_disk_space</p></td>
<td align="left"><p>The offering disk size of storage node.(MB).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>transport_type</p></td>
<td align="left"><p>The transport type of volume. [iscsi]</p></td>
</tr>
<tr class="even">
<td align="left"><p>storage_type</p></td>
<td align="left"><p>The type of storage. [raw, zfs]</p></td>
</tr>
<tr class="odd">
<td align="left"><p>ipaddr</p></td>
<td align="left"><p>IP address of storage node.</p></td>
</tr>
<tr class="even">
<td align="left"><p>snapshot_base_path</p></td>
<td align="left"><p>The base path to store volume snapshot files.</p></td>
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



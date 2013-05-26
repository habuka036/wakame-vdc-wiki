<Instances> | <Images> | [Host Nodes](Host Nodes "wikilink") | <Volumes>
| Volume Snapshots | [Security Groups](Security Groups "wikilink") |
[Storage Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the volume snapshots.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volume_snapshots`

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
<td align="left"><p>Number of total volume snapshots the user can access.</p></td>
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
<td align="left"><p>A list of the volume snapshots.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show the volume snapshot status.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volume_snapshots/id`

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
<td align="left"><p>ID of the volume snapshot to get the status. UUID representation of this volume. It's necessary that prefix is 'snap-'.</p></td>
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
<td align="left"><p>ID of the volume snapshot. UUID representation of this volume snapshot.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the volume snapshot.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>state</p></td>
<td align="left"><p>The state of the volume snapshot.<br />[creating, registering, avilable, failed, deleting, deleted]</p></td>
</tr>
<tr class="even">
<td align="left"><p>size</p></td>
<td align="left"><p>Size of volume snapshot(MB).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>origin_vokume_id</p></td>
<td align="left"><p>ID of the volume which created snapshot.</p></td>
</tr>
<tr class="even">
<td align="left"><p>destination_id</p></td>
<td align="left"><p>The storage location of this snapshot. ex) local</p></td>
</tr>
<tr class="odd">
<td align="left"><p>destination_name</p></td>
<td align="left"><p>The name of the destination.</p></td>
</tr>
<tr class="even">
<td align="left"><p>backing_store</p></td>
<td align="left"><p>The type of storage. ex) raw</p></td>
</tr>
<tr class="odd">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="even">
<td align="left"><p>deleted_at</p></td>
<td align="left"><p>Time of record detached. ISO8601 form.</p></td>
</tr>
</tbody>
</table>

**create**
==========

### Description

Create new volume snapshot.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volume_snapshots`

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
<td align="left"><p>volume_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>ID of the original volume of a new snapshot. UUID representation of the volume.</p></td>
</tr>
<tr class="even">
<td align="left"><p>destination</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>The storage location of a new snapshot.<br />It's defined as wakame_vdc/dcmgr/config/snapshot_repojitory.yml.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>storage_pool_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the storage node which stores a snapshot.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**destroy**
===========

### Description

Delete the volume snapshot.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volume_snapshots/id`

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
<td align="left"><p>ID of the volume snapshot to be deleted. UUID representation of this volume. It's necessary that prefix is 'snap-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of deleting volume snapshot.

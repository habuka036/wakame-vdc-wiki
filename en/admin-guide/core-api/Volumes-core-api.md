<Instances> | <Images> | [Host Nodes](Host Nodes "wikilink") | Volumes |
[Volume Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | [Storage
Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the volume.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes`

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
<td align="left"><p>Number of total volumes the user can access.</p></td>
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
<td align="left"><p>A list of the volumes.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show the volume status.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes/id`

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
<td align="left"><p>ID of the volume to get the status. UUID representation of this volume.<br />It's necessary that prefix is 'vol-'.</p></td>
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
<td align="left"><p>ID of the volume. UUID representation of this volume.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the volume.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>snapshot_id</p></td>
<td align="left"><p>ID of the volume snapshot. UUID representation of the snapshot.</p></td>
</tr>
<tr class="even">
<td align="left"><p>size</p></td>
<td align="left"><p>Size of volume(MB).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>state</p></td>
<td align="left"><p>The state of the volume.<br />[creating, registering, available, attaching, attached, detaching, failed, deregistering, deleting, deleted]</p></td>
</tr>
<tr class="even">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>deleted_at</p></td>
<td align="left"><p>Time of record deleted. ISO8601 form.</p></td>
</tr>
<tr class="even">
<td align="left"><p>attached_at</p></td>
<td align="left"><p>Time of record attached. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>detached_at</p></td>
<td align="left"><p>Time of record detached. ISO8601 form.</p></td>
</tr>
</tbody>
</table>

**create**
==========

### Description

Create the new volume.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes`

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
<td align="left"><p>volume_size</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>Size of the new volume.</p></td>
</tr>
<tr class="even">
<td align="left"><p>snapshot_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the volume snapshot, if you generate a volume from a snapshot.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>storage_pool_id</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>ID of the storage node to store a new volume.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**destroy**
===========

### Description

Delete the volume.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes/id`

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
<td align="left"><p>ID of the volume to be deleted. UUID representation of this volume.<br />It's necessary that prefix is 'vol-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of the deleting volume.

**attach**
==========

### Description

Attached the volume.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes/id/attach`

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
<td align="left"><p>ID of the volume to be attached. UUID representation of this volume.<br />It's necessary that prefix is 'vol-'.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**detach**
==========

### Description

Detached the volume.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/volumes/id/detach`

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
<td align="left"><p>ID of the volume to be detached. UUID representation of this volume.<br />It's necessary that prefix is 'vol-'.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

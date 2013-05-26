<Instances> | Images | [Host Nodes](Host Nodes "wikilink") | <Volumes> |
[Volume Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | [Storage
Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of machine images.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/images`

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
<td align="left"><p>Number of total images the user can access.</p></td>
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
<td align="left"><p>A list of the images.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show a machine image details.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/images/id`

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
<td align="left"><p>ID of the image to get the status. UUID representation of this image.<br />It's necessary that prefix is 'wmi-'.</p></td>
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
<td align="left"><p>ID of the image. UUID representation of this image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own this image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>created_at</p></td>
<td align="left"><p>Time of record created. ISO8601 form.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>updated_at</p></td>
<td align="left"><p>Time of record updated. ISO8601 form.</p></td>
</tr>
<tr class="even">
<td align="left"><p>boot_dev_type</p></td>
<td align="left"><p>Type of boot device. For SNA 1 or for LOCAL 2.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>source</p></td>
<td align="left"><p>A Information of image source. This is yaml format.<br />Currentry URI of the image is valid.</p></td>
</tr>
<tr class="even">
<td align="left"><p>arch</p></td>
<td align="left"><p>The CPU architecture type. [x86, x86_64].</p></td>
</tr>
<tr class="odd">
<td align="left"><p>description</p></td>
<td align="left"><p>Description of the image.</p></td>
</tr>
<tr class="even">
<td align="left"><p>md5sum</p></td>
<td align="left"><p>The md5 checksum of the image.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>is_public</p></td>
<td align="left"><p>A flag that determines whether the machine image is public or not.</p></td>
</tr>
<tr class="even">
<td align="left"><p>state</p></td>
<td align="left"><p>The state of the image. [init]</p></td>
</tr>
<tr class="odd">
<td align="left"><p>features</p></td>
<td align="left"><p>A List of features. This is yaml format.<br />Currently 'virtio' is valid.</p></td>
</tr>
</tbody>
</table>

**destroy**
===========

### Description

Delete the machine image.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/images/id`

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
<td align="left"><p>ID of the image to be deleted. UUID representation of this image.<br />It's necessary that prefix is 'wmi-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of the deleting image.

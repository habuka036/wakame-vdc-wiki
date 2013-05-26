<Instances> | <Images> | [Host Nodes](Host Nodes "wikilink") | <Volumes>
| [Volume Snapshots](Volume Snapshots "wikilink") | Security Groups |
[Storage Nodes](Storage Nodes "wikilink") | [SSH key
pairs](SSH key pairs "wikilink") | <Networks> | [Instance
specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the security groups.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/security_groups`

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
<td align="left"><p>Number of total security groups the user can access.</p></td>
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
<td align="left"><p>A list of the security groups.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Show the security\_group.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/security_groups/id`

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
<td align="left"><p>ID of the security group to get the status. UUID representation of this security group. It's necessary that prefix is 'sg-'.</p></td>
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
<td align="left"><p>ID of the security group. UUID representation of this security group.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the security group.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own this security group.</p></td>
</tr>
<tr class="even">
<td align="left"><p>description</p></td>
<td align="left"><p>Description of the security group.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>rule</p></td>
<td align="left"><p>Rule of the security group.</p></td>
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

**create**
==========

### Description

Register a new security group.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/netfilter_groups/`

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
<td align="left"><p>description</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Description for new security group.</p></td>
</tr>
<tr class="even">
<td align="left"><p>rule</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Rule of secirity.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**update**
==========

### Description

Update parameters for the security group.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/security_groups/id`

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
<td align="left"><p>ID of the security group to update. UUID representation of this security group. It's necessary that prefix is 'sg-'.</p></td>
</tr>
<tr class="even">
<td align="left"><p>description</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Description for security group.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>rule</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>Rule of security group.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**destroy**
===========

### Description

Delete the security group.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/security_groups/id/`

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
<td align="left"><p>ID of the security group to be deleted. UUID representation of this security group. It's necessary that prefix is 'sg-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of the deleting security group.

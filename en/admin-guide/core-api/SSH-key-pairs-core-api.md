<Instances> | <Images> | [Host Nodes](Host Nodes "wikilink") | <Volumes>
| [Volume Snapshots](Volume Snapshots "wikilink") | [Security
Groups](Security Groups "wikilink") | [Storage
Nodes](Storage Nodes "wikilink") | SSH key pairs | <Networks> |
[Instance specs](Instance specs "wikilink")

**index**
=========

### Description

Show list of the ssh key pairs in account.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/ssh_key_pairs`

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
<td align="left"><p>Number of total SSH key pairs the user can access.</p></td>
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
<td align="left"><p>A list of the SSH key pairs.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

Retrieve details about ssh key pair.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/ssh_key_pairs/id`

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
<td align="left"><p>ID of the SSH key pair to get the status. UUID representation of this volume. It's necessary that prefix is 'ssh-'.</p></td>
</tr>
<tr class="even">
<td align="left"><p>format</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>'openssh' or 'putty'</p></td>
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
<td align="left"><p>ID of the SSH key paire. UUID representation of this SSH key paire.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the SSH key pair.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own this SSH key pair.</p></td>
</tr>
<tr class="even">
<td align="left"><p>finger_print</p></td>
<td align="left"><p>Finger print of the private key.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>public_key</p></td>
<td align="left"><p>Public key.</p></td>
</tr>
<tr class="even">
<td align="left"><p>private_key</p></td>
<td align="left"><p>Private key.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>description</p></td>
<td align="left"><p>Description of this SSH key pair.</p></td>
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

Create new information of the ssh key pair.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/ssh_key_pairs`

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
<td align="left"><p>name</p></td>
<td align="left"><p>string</p></td>
<td align="left"><p>required</p></td>
<td align="left"><p>key name (&lt;100 chars).</p></td>
</tr>
<tr class="even">
<td align="left"><p>download_once</p></td>
<td align="left"><p>true/false</p></td>
<td align="left"><p>optional</p></td>
<td align="left"><p>set true if you do not want to save private key info on database.</p></td>
</tr>
</tbody>
</table>

### Responce

Please refer to the 'Responce' section of the 'show' method.

**destroy**
===========

### Description

Remove information of the ssh key pair.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/ssh_key_pairs/id`

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
<td align="left"><p>ID of the SSH key pair to be deleted. UUID representation of this volume. It's necessary that prefix is 'ssh-'.</p></td>
</tr>
</tbody>
</table>

### Responce

ID of the deleting SSH key pair.

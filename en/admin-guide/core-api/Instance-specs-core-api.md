[Instances](Instance-core-api)\|[Images](Images-core-api)\|[Host Nodes](Host-Nodes-core-api)\|[Volumes](Volumes-core-api)\|
[Volume Snapshots](Volume-Snapshots-core-api)\|[Security Groups](Security-Groups-core-api)\|[Storage Nodes](Storage-Nodes-core-api)\|[SSH key pairs](SSH-key-pairs-core-api)\|[Networks](Networks-core-api)\|[Instance specs](Instance-specs-core-api)  

**index**
=========

### Description

Show list of instance template.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instance_specs`

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
<td align="left"><p>Number of total instance specs the user can access.</p></td>
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
<td align="left"><p>A list of the instance specs.<br />The element of the list, please refer to the 'Responce' section of the 'show' method.</p></td>
</tr>
</tbody>
</table>

**show**
========

### Description

how the instance template.

### Request URL

[`http://`](http://)*`DCMGR` `HOST`*`/api/instance_specks/id`

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
<td align="left"><p>ID of the instance spec to get the status. UUID representation of this instance spec. It's necessary that prefix is 'is-'.</p></td>
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
<td align="left"><p>ID of the instance spec. UUID representation of this instance spec.</p></td>
</tr>
<tr class="even">
<td align="left"><p>uuid</p></td>
<td align="left"><p>UUID of the instance spec.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>account_id</p></td>
<td align="left"><p>The account ID to own this instance spec.</p></td>
</tr>
<tr class="even">
<td align="left"><p>hypervisor</p></td>
<td align="left"><p>The hypervisor type for the instance. [kvm, lxc].</p></td>
</tr>
<tr class="odd">
<td align="left"><p>cpu_cores</p></td>
<td align="left"><p>The initial cpu cores for the new instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>memory_size</p></td>
<td align="left"><p>The size of memory for the new instance (in MB).</p></td>
</tr>
<tr class="odd">
<td align="left"><p>quota_weight</p></td>
<td align="left"><p>The cost weight factor for the new instance.</p></td>
</tr>
<tr class="even">
<td align="left"><p>vifs</p></td>
<td align="left"><p>The attached virtual interfaces. It is described by YML format.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>drives</p></td>
<td align="left"><p>The attached disks. It is described by YML format.</p></td>
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



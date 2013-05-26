Overview
========

Install Environment
-------------------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>OS</p></td>
<td align="left"><p>RedHat / CentOS series</p></td>
<td align="left"><p>Recommend</p></td>
</tr>
<tr class="even">
<td align="left"><p>Ubuntu</p></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>Gentoo</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

Compute
-------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Hyper Visor</p></td>
<td align="left"><p>KVM</p></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>VMware ESXi</p></td>
<td align="left"><p>Limited support</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Container</p></td>
<td align="left"><p>LXC</p></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>OpenVZ</p></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>Instance Login</p></td>
<td align="left"><p>SSH PKI</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

Network
-------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Edge Networking</p></td>
<td align="left"><p>Distributed Firewall (aka Security Groups)</p></td>
<td align="left"><p>Netfilter (Full Function) / OpenFlow (Limited)</p></td>
</tr>
<tr class="even">
<td align="left"><p>MAC to MAC Virtual Network</p></td>
<td align="left"><p>OpenFlow</p></td>
</tr>
<tr class="odd">
<td align="left"><p>GRE Tunnel Virtual Network</p></td>
<td align="left"><p>OpenFlow</p></td>
</tr>
<tr class="even">
<td align="left"><p>DHCP</p></td>
<td align="left"><p>Direct Physical Network</p></td>
<td align="left"><p>dnsmasq</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Virtual Network</p></td>
<td align="left"><p>OpenFlow (Open vSwitch + Trema)</p></td>
</tr>
<tr class="even">
<td align="left"><p>DNS</p></td>
<td align="left"><p>Direct Physical Network</p></td>
<td align="left"><p>dnsmasq</p></td>
</tr>
<tr class="odd">
<td align="left"><p>(Virtual Network)</p></td>
<td align="left"><p>OpenFlow (in progress)</p></td>
</tr>
<tr class="even">
<td align="left"><p>Metadata</p></td>
<td align="left"><p>Metadata Server</p></td>
<td align="left"><p>enable AWS compatibility</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Metadata Drive (vfat / ISO)</p></td>
<td align="left"><p>the instance can know own IP address by itself without network</p></td>
</tr>
</tbody>
</table>

Storage
-------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Block Storage</p></td>
<td align="left"><p>Local Storage</p></td>
<td align="left"><p>on edge server</p></td>
</tr>
<tr class="even">
<td align="left"><p>ZFS</p></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>tgt</p></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>Indelible FS</p></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>Snapshot Backup</p></td>
<td align="left"><p>Mounted Disk</p></td>
<td align="left"><p>Local Disk / NFS</p></td>
</tr>
<tr class="even">
<td align="left"><p>AWS S3</p></td>
<td align="left"><p>Amazon</p></td>
</tr>
<tr class="odd">
<td align="left"><p>IIJ-GIO FS/V</p></td>
<td align="left"><p>IIJ</p></td>
</tr>
</tbody>
</table>

Management
----------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Configuration CLI</p></td>
<td align="left"><p>Account &amp; User Management</p></td>
<td align="left"><p>including per quota</p></td>
</tr>
<tr class="even">
<td align="left"><p>Physical Resource Management</p></td>
<td align="left"><p>Compute Node &amp; Network &amp; Storage</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Instance Specification Management</p></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>Machine Image Management</p></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left"><p>Operation GUI</p></td>
<td align="left"><p>Retrieve Resource Booking Information</p></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><p>Authentication on Behalf of User for Operator</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>

User Interface
--------------

<table>
<thead>
<tr class="header">
<th align="left"><p>Category</p></th>
<th align="left"><p>Support</p></th>
<th align="left"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>User Web API</p></td>
<td align="left"><p>Authentication + HTTP + JSON</p></td>
<td align="left"><p>RESTful</p></td>
</tr>
<tr class="even">
<td align="left"><p>DC Web API</p></td>
<td align="left"><p>HTTP + JSON</p></td>
<td align="left"><p>RESTful</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Graphical Interface</p></td>
<td align="left"><p>Modern Browser DHTML</p></td>
<td align="left"></td>
</tr>
</tbody>
</table>



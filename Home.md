# Wakame-vdc
Wakame-vdc is an IaaS (Infrastructure as a Service) cloud computing framework, facilitating the provisioning and management of a heterogeneous virtualized infrastructure. Wakame-vdc virtualizes the entire data center; servers, storage, and networking. Wakame-vdc is managed via a native Web Interface, the Wakame-vdc CLI, or the powerful Wakame-vdc API.

Wakame-vdc is a Datacenter Level Hypervisor, and gives your infrastructure higher portability. Since it is fully Open Sourced, with Wakame-vdc you are free to design and extend your own datacenter. Wakame-vdc provides the best method to build your cloud infrastructure. Enjoy!

#### Table of Contents
1. [Quickstart](#quickstart)
2. [Framework](#framework)
3. [Documentation](#documentation)
4. [Support](#support)
5. [Sponsor](#sponsor)

### Overview

### Wakame-vdc's Goal

Wakame-vdc allows the administrator to spend less time managing the entire data center infrastructure.

Wakame-vdc strives to provide the same experience to the entire data center, as virtual machines have done for operating systems. The VDC (Virtual Data Center) offers virtualized facilities such as servers, storage, and networking, in what can be described as a data center level hypervisor. Deployment, migration and backup of a Wakame-vdc installation can freely be replicated between any site running Wakame-vdc, with minimal reconfiguration.

### License

Wakame-vdc components are licensed under LGPL 3.0 and Apache 2.0

<a name="quickstart" />
## Quickstart

[Wakame-vdc pre-installed as a VirtualBox image](http://wakameusersgroup.org/demo_image.html)

[Wakame-vdc install guide on a single Centos 6.4 host](install-guide)

<a name="framework" />
## Framework

### Core Components
#### ~ vdc-dcmgr (Data Center Manager)
The <big>Wakame-vdc-dcmgr</big> is the brain of Wakame-vdc. The Data Center Manager communicates with and manages all of the other components. Master -> Slave failover is supported using [UCarp](https://github.com/jedisct1/UCarp).
##### ~ ~ vdc-dcmgr_gui (Data Center Manager Web API)
The <big>Wakame-vdc-dcmgr_gui</big> provides communication between the Data Center Manager and the GUI Server
##### ~~ vdc-dcmgr_collector (Data Center Manager Collector)
<big>Wakame-dc-dcmgr_collector</big> provides DB Access Endpoints, Scheduler, Job Queues
##### ~ ~ vdc-dcmgr_API (Data Center Manager API)
The <big>Wakame-vdc-dcmgr_API</big> provides a powerful way to automate Wakame-vdc however you prefer. The Wakame-vdc-dcmgr_API is a RESTful API.
#### ~ vdc-hva (Hyper Visor Agent)
<big>Wakame-vdc-hva</big> provides VM and Edge Networking Management
#### ~ vdc-sta (Storage Target Agent)
<big>Wakame-vdc-sta</big> communicates with the Data Center Manager and the Hyper Visor Agents.
#### ~ vdc-bksta (Backup Storage Agent)
<big>Wakame-vdc-bksta</big> Relays to External Datacenter.
#### ~ vdc-nwmongw (Network Monitoring Gateway)
<big>Wakame-vdc-nwmongw</big> serves as a gateway between VM instances and monitoring.
#### ~ vdc-natbox (Network Address Server)
<big>vdc-natbox</big> handles external IP address management.
#### ~ OS
Wakame-vdc runs as an application suite on CentOS 6/RHEL 6.
#### ~ Database
Wakame-vdc uses [MySql](http://www.mysql.com/) to store information such as virtual machine configuration and state.
#### ~ Messaging
Wakame-vdc uses [RabbitMQ](http://www.rabbitmq.com/) for messaging between Hyper Visor Agents, Storage Target Agents, and the Data cennter Manager.
#### ~ GUI Server
  Wakame-vdc uses [Unicorn](http://unicorn.bogomips.org/) and [Nginx](http://nginx.org/) to provide a rich graphical interface, accessed via web browser.


### Sub-Systems
#### ~ Hypervisor Support
##### ~ ~ Containers Virtualization
[OpenVZ](http://openvz.org/Main_Page)
[LXC](http://lxc.sourceforge.net/)
##### ~ ~ Paravirtualized
[KVM](http://www.linux-kvm.org/page/Main_Page)
[VMWare ESXi](http://www.vmware.com/products/vsphere-hypervisor/overview.html) (Limited Support)


#### ~ Virtual Machine Support
CentOS/RHEL and Ubuntu 10.04 Linux guests VMs are suppported on all Hypervisors.

#### ~ Storage Support.
Storage can be local, NFS, or iSCSI. The Wakame-vdc-sta can automatically create new volumes and root file systems.

#### ~ Networking
[Trema](http://trema.github.io/trema/) + [OpenFlow](http://www.openflow.org/)
#### ~ Interfaces (API, etc.)

#### ~ Monitoring
[Zabbix](http://www.zabbix.com/)

<a name="documentation" />
## Documentation
### Overview
#### ~ [[Requirements|Requirements]]
###Installation
#### ~ Downloads
[RPMs](http://dlc.wakame.axsh.jp/packages/rhel/6/current/index.html)
[Source](https://github.com/axsh/wakame-vdc)

### [[Wakame-vdc Quick Start|Wakame-vdc-Quick-Start]]

### [[Wakame-vdc Administrator's Guide|Wakame-vdc-Administrator-Guide]]
[[Vdc-manage command reference|Vdc-manage-command-reference]]
[[Gui-manage command reference|Gui-manage-command-reference]]
[[Core API Reference|Core-API-reference]]

### [[Development|Development]]

PLEASE JOIN THE WAKAME PROJECT!

<a name="support" />
## Support
### Community
### Mailing Lists
[Google Group](http://groups.google.com/group/wakame-ug?hl=en)
[Japanese Google Group](http://groups.google.com/group/wakametech?hl=jp)

### Hipchat
[Public HipChat Room](https://www.hipchat.com/gC3AhFzIa)
You won't need to install anything!

### Twitter
[@Wakamevdc](https://twitter.com/wakamevdc)
Follow us on twitter!

<a name="sponsor" />
## Sponsor
<span class="float-left><a href="http://axsh.jp/"><img src="http://axsh.github.io/wiki/img/wakame-logo-70.png" alt="Wakame Logo" /></a></span><Font size=6>Axsh Co.</font>


[How to Install to Gentoo?](https://github.com/s1061123/wakame-vdc/wiki/Wakame-vdc-install-memo-for-Gentoo-linux-v1.0)


# Virtual Data center Concept

## What is a virtual data center?

Think about the concept of virtual machines like [VirtualBox](https://www.virtualbox.org) or [KVM](http://www.linux-kvm.org) for a bit. What do they do? They run on some kind of physical hardware. It can be either a big tower PC or a small laptop. On top of those they can create virtual machines.

A virtual machine is software. Therefore it can be moved, copied and deleted easily. You can take a virtual machine image and copy it over to any other machine which might have a completely different hardware configuration. On top of that completely different hardware, the exact same virtual machine will come up.

Wakame-vdc extends this from a single machine to an entire data center. You install Wakame-vdc on top a physical data center. After that you can use Wakame-vdc to set up a virtual data center. That virtual data center is software. It can be copied.

If you have another physical data center with Wakame-vdc installed on it, it is possible to copy over your virtual data center to that, even if its physical hardware is completely different. It could run on a single laptop or it could run on a huge data center with many servers.

Virtualizing the data center provides these merits:

* Portability

* Scalability

* Reliability

## What do these buzzwords even mean?

### Portability

You can run the same virtual data center on any physical data center that has Wakame-vdc installed. In this context we use the term physical data center loosely. Wakame-vdc can run perfectly on something as simple as one single laptop. It will even run just fine [in a virtual machine](http://wakameusersgroup.org/demo_image.html).

The same virtual data center you've created on that single laptop, you can then move over to a production environment running on a physical data center composed of a hundred servers.

### Scalability

When you need to add a new server to a physical data center, what do you do? You buy the hardware, put it in place and set up the networking infrastructure and firewalls to connect it. It's a very time consuming and expensive process.

In a virtual data center like Wakame-vdc, all you do is click a few buttons. This creates a new server (instance) and puts it in the data center while all network settings get configured automatically. Depending on the size of the server's vm image, it comes up in a matter of seconds.

Now imagine that a user has a website running on top of a virtual data center. They get a traffic spike and the servers hosting their website just aren't enough any more. They are now able to quickly create a bunch of new virtual servers to help you take care of that extra traffic. Once things settle down again, you can easily delete those extra servers.

### Reliability

A virtual data center provides much more flexible failover alternatives. Its virtual servers on top of physical servers in a physical data center. From the user's point of view it doesn't matter on which physical server a virtual server is running. All the user cares about is being able to connect to their virtual server. If a physical server fails, virtual servers can be quickly migrated to another virtual server.

Since a virtual data center is software and software can be copied, it is very easy to take regular backups of certain servers or even the entire data center.

## Virtual data center components

There are three things that make up a data center, either physical or virtual.

* A number of servers.

* A network that connects these servers to each other.

* A type of storage that holds all the data.

### Servers

Wakame-vdc virtualizes servers by implementing the very virtual machine software (hypervisors) mentioned at the top of this page. Check out the [[F.A.Q.|faq]] to see which ones it uses exactly.

Wakame keeps track of a number of *machine images*. These are essentially virtual servers. It doesn't boot these up directly though. Instead it boots *instances* of these images. That basically means that it starts up a copy of a machine image, leaving the original image unchanged. In theory you can start up an infinite amount of instances.

### Network

Wakame-vdc by itself has only partial network virtualization. Namely, it has a virtualized firewall that updates itself automatically as the data center changes. This is refered to as security groups.

In order to let users connect to instances, Wakame-vdc uses bridged networking. This is explained in the usage guides of several hypervisors and beyond the scope of this wiki.

In order to do full network virtualization, Wakame-vdc integrates with our other product, [OpenVNet](http://www.openvnet.com). OpenVNet achieves full network virtualization using [OpenFlow](http://archive.openflow.org). This is currently still experimental.

### Storage

Wakame-vdc virtualizes storage using [iSCSI](http://en.wikipedia.org/wiki/ISCSI) targets or [NFS](http://en.wikipedia.org/wiki/Network_File_System). In the case of iSCSI, several backends are supported.

# Virtual Datacenter Concept

## What is a virtual datacenter?

It is a virtual datacenter that runs on top of a physical datacenter.

Think about the concept of virtual machines like [VirtualBox](https://www.virtualbox.org) or [KVM](https://www.virtualbox.org) for a bit. What do they do? They run on some kind of physical hardware. It can be either a big tower PC or a small laptop. On top of those they can spin up virtual machines. A virtual machine is software. Therefore it can be moved, copied and deleted easily. You can take a virtual machine image and copy it over to any other machine which might have a completely different hardware configuration. It will run just the same. Keeping that in mind virtualization provides the following merits.

* Virtual machines are software and can thus be copied. This means they can also be backed up.

* The hardware a virtual machine runs on can be changed without the virtual machine changing.

* The virtual machine can change without the hardware changing.

Wakame-vdc takes these exact merits and extends them from a single machine to an entire datacenter. You install Wakame-vdc on top a physical datacenter. After that you can use Wakame-vdc to set up a virtual datacenter. That virtual datacenter is software. It can be copied. If you have another physical datacenter with Wakame-vdc installed on it, it is possible to copy over your virtual datacenter to that, even if its physical hardware is completely different. It could run on a single laptop or it could run on a huge datacenter with many servers.

## Virtual datacenter components

There are three things that make up a datacenter, either physical or virtual.

* A bunch of servers.

* A network that connects these servers to each other.

* A method of storage that holds all the data.

Wakame-vdc currently virtualizes the servers and the storage. For the network part, Wakame-vdc implements our other project, [OpenVNet](http://openvnet.com). OpenVNet is still experimental at the time of writing.

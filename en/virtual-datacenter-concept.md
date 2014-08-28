# Virtual Datacenter Concept

## What is a virtual datacenter?

It is a virtual datacenter that runs on top of a physical datacenter.

Think about the concept of virtual machines like [VirtualBox](https://www.virtualbox.org) or [KVM](https://www.virtualbox.org) for a bit. What do they do? They run on some kind of physical hardware. It can be either a big tower PC or a small laptop. On top of those they can spin up virtual machines. A virtual machine is software. Therefore it can be moved, copied and deleted easily. You can take a virtual machine image and copy it over to any other machine which might have a completely different hardware configuration. On top of that completely different hardware, the exact same virtual machine will come up. Keeping that in mind, virtualization provides the following merits.

* Virtual machines are software and can thus be copied. This means they can also be backed up.

* The hardware a virtual machine runs on can be changed without the virtual machine changing.

* The virtual machine can change without the hardware changing.

Wakame-vdc takes these exact merits and extends them from a single machine to an entire datacenter. You install Wakame-vdc on top a physical datacenter. After that you can use Wakame-vdc to set up a virtual datacenter. That virtual datacenter is software. It can be copied.

If you have another physical datacenter with Wakame-vdc installed on it, it is possible to copy over your virtual datacenter to that, even if its physical hardware is completely different. It could run on a single laptop or it could run on a huge datacenter with many servers.

## Virtual datacenter components

There are three things that make up a datacenter, either physical or virtual.

* A bunch of servers.

* A network that connects these servers to each other.

* A type of storage that holds all the data.

Wakame-vdc assigns jobs to certain servers in the physical data center. The most essential of these jobs include:

* **Data center manager (dcmgr):** This one is in charge of processing user input a adjusting the virtual datacenter accordingly.

* **Hypervisor agent (hva):** This one is in charge of spinning up virtual machines or virtual servers rather. In Wakame-vdc we call those *instances*.

* **Storage target agent (sta):** This one is in charge of storage. It basically provides storage in the form of iSCSI targets that can be attached to instances.

### Servers

Wakame-vdc virtualizes servers by implementing the very virtual machine software mentioned above. Check out the [[F.A.Q.|faq]] to see which ones it uses exactly.

Wakame keeps track of a number of `machine images`. These are essentially virtual servers. It doesn't boot these up directly though.

### Storage

### Network

It virtualizes storage using iSCSI targets that support various backends. For the network part, Wakame-vdc implements our other project, [OpenVNet](http://openvnet.com). OpenVNet is still experimental at the time of writing.

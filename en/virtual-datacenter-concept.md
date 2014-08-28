# Virtual Data center Concept

## What is a virtual data center?

It is a virtual data center that runs on top of a physical data center.

Think about the concept of virtual machines like [VirtualBox](https://www.virtualbox.org) or [KVM](https://www.virtualbox.org) for a bit. What do they do? They run on some kind of physical hardware. It can be either a big tower PC or a small laptop. On top of those they can spin up virtual machines. A virtual machine is software. Therefore it can be moved, copied and deleted easily. You can take a virtual machine image and copy it over to any other machine which might have a completely different hardware configuration. On top of that completely different hardware, the exact same virtual machine will come up.

Wakame-vdc extends this from a single machine to an entire data center. You install Wakame-vdc on top a physical data center. After that you can use Wakame-vdc to set up a virtual data center. That virtual data center is software. It can be copied. If you have another physical data center with Wakame-vdc installed on it, it is possible to copy over your virtual data center to that, even if its physical hardware is completely different. It could run on a single laptop or it could run on a huge data center with many servers.

Virtualizing the data center provides these merits:

* Portability

* Scalability

* Reliability

## What do these buzzwords even mean?

### Portability

You can run the same virtual data center on any physical data center that has Wakame-vdc installed. In this context we use the term physical data center loosely. Wakame-vdc can run perfectly on something as simple as one single laptop. It will even run just fine [in a virtual machine](http://wakameusersgroup.org/demo_image.html). The same virtual data center you've created on that single laptop, you can then move over to a production environment running on a physical data center composed of a hundred servers.

### Scalability

When you need to add a new server to a physical data center, what do you do? You buy the hardware, put it in place and set up the networking infrastructure and firewalls to connect it. It's a very time consuming and expensive process. In a virtual data center like Wakame-vdc, all you do is click a few buttons. This creates a new server (instance) and puts it in the data center while all network settings get configured automatically. Depending on the size of the server's vm image, it comes up in a matter of seconds.

Now imagine that you have a website running on top of your virtual data center. You get a traffic spike the servers hosting your website just aren't enough any more. You are now able to quickly spin up a bunch of new virtual servers to help you take care of that extra traffic. Once things settle down again, you can easily throw away those extra servers.

### Reliability

Since a virtual data center is software and software can be copied, it is very easy to take regular backups of certain servers or even the entire data center.

## Virtual data center components

There are three things that make up a data center, either physical or virtual.

* A bunch of servers.

* A network that connects these servers to each other.

* A type of storage that holds all the data.

Wakame-vdc assigns jobs to certain servers in the physical data center. The most essential of these jobs include:

* **Data center manager (dcmgr)** is in charge of processing user input a adjusting the virtual data center accordingly.

* **Hypervisor agent (hva)** is in charge of spinning up virtual machines or virtual servers rather. In Wakame-vdc we call those *instances*.

* **Storage target agent (sta)** is in charge of storage. It basically provides storage in the form of iSCSI targets that can be attached to instances.

### Servers

Wakame-vdc virtualizes servers by implementing the very virtual machine software mentioned above. Check out the [[F.A.Q.|faq]] to see which ones it uses exactly.

Wakame keeps track of a number of `machine images`. These are essentially virtual servers. It doesn't boot these up directly though.

### Storage

### Network

It virtualizes storage using iSCSI targets that support various backends. For the network part, Wakame-vdc implements our other project, [OpenVNet](http://openvnet.com). OpenVNet is still experimental at the time of writing.

# F.A.Q.

### What operating system will Wakame-vdc run on?

We are officially supporting Centos 6.4 x86 64 bit. It is possible that it'll run on other operating systems as well but this is the only one we're testing on. All current production environments also run on it.

### Is Wakame-vdc currently being used in production anywhere?

Yes, it is. Check our [[usage|home#usage]] section on the home page.

### Can I run Wakame-vdc in a virtual machine?

Absolutely. We do it all the time in development. Have a look at our [VirtualBox image](http://wakameusersgroup.org/demo_image.html) with Wakame-vdc pre-installed.

### What Hypervisors does Wakame-vdc support?

Currently the following:

  * [KVM](http://www.linux-kvm.org/page/Main_Page)

  * [OpenVZ](http://openvz.org)

  * [LXC](https://linuxcontainers.org)

  * [VMWare ESXi](http://www.vmware.com/products/esxi-and-esx/overview) (Experimental only. We've made it work before but can't guarantee that it will now.)

### What OS can I run on Wakame-vdc's instances?

Depends on which Hypervisor you use. If you use a container like OpenVZ or LXC, all instances will use the same kernel as your host OS. Therefore your instances will be running either the same OS as your host or something very close to it.

If you use a full virtualization hypervisor like KVM, you can run any OS that you want in your instances.

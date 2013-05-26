Supported Formats
-----------------

Wakame-vdc uses [KVM](http://www.linux-kvm.org/) as the underlying
hypervisor. This means that Wakame-vdc supports any image format that
KVM does. As explained on [their
FAQ](http://www.linux-kvm.org/page/FAQ):

*"KVM inherits a wealth of disk formats support from QEMU; it supports
raw images, the native QEMU format (qcow2), VMware format, and many
more."*

Metadata
--------

Technically, every KVM compatible image will work with Wakame-vdc. If
you want features such as a unique host name or trusted SSH key for each
instance, you will need to use the metadata server.

### Amazon EC2 Compatibility

Wakame-vdc's metadata server uses the same interface as Amazon EC2 does.
Therefore it is likely that any Amazon machine images you have will
seamlessly work with Wakame-vdc. However, Wakame-vdc is still in beta
and doesn't guarantee 100% compatibility. If you experience any
problems, please let us know and we will try to fix what we can. We can
be reached at wakametech@googlegroups.com.

### Pre Made Scripts

We offer some pre made scripts that use our metadata server. To use
these, place them anywhere in your machine images and make sure they are
executed at boot time. One way to do this is adding them to `rc.local`.
This file is usually located in `/etc/` or `/etc/rc.d/` depending on
your distribution.

-   [Debian 6.0
Squeeze](http://dlc.wakame.axsh.jp.s3.amazonaws.com/beta/11.06/init_scripts/wakame_init_debian6)

-   [Centos
5.6](http://dlc.wakame.axsh.jp.s3.amazonaws.com/beta/11.06/init_scripts/wakame_init_centos5.6)

-   [Ubuntu 10.04 Lucid
Lynx](http://dlc.wakame.axsh.jp.s3.amazonaws.com/beta/11.06/init_scripts/wakame_init_ubuntu10.04)

### Writing Your Own Script

From inside an instance, the metadata server will always be located at
`169.254.169.254/latest/meta-data/'''value'''`. You can use `curl` to
make http requests to the server and fetch the data. For instance the
following command will return the host name assigned to your instance.

`curl -s `[`http://169.254.169.254/latest/meta-data/local-hostname`](http://169.254.169.254/latest/meta-data/local-hostname)

Here is an overview of the possible metadata values in Wakame-vdc 11.06.

-   **wmi-id**: The ID of the machine image that was used to start this
instance.
-   **ami-id**: Synonym for wmi-id.
-   **mac**: The mac address of the instance's network interface.
-   **instance-id**: The instance's ID.
-   **local-hostname**: The instance's assigned host name.
-   **local-ipv4**: The instance's IP in the private inside network.
-   **public-ipv4**: The instance's IP in the public outside network.
-   **security-groups**: The security groups that this instance is part
of.
-   **user-data**: An arbitrary field that can hold user defined data.
This can be set when starting an instance through the WebUI.

You can write a script in a language of your choosing that queries these
values and sets the guest operating system up with them. Make sure your
script is executed at boot time. Feel free to use our [pre made
scripts](#Pre_Made_Scripts "wikilink") for reference.

Creating Images From Scratch
----------------------------

### Ubuntu VM Builder

If you are on a Ubuntu system yourself and want to make a Ubuntu image,
you can use
[ubuntu-vm-builder](https://help.ubuntu.com/8.04/serverguide/C/ubuntu-vm-builder.html)
to do the job for you. To make things even easier, we provide a script
that invokes ubuntu-vm-builder to build an image and sets it up to work
with Wakame-vdc. You can find it
[here](https://github.com/axsh/wakame-vdc/tree/master/tests/image_builder/ubuntu/10.04)
in our [Github repository](https://github.com/axsh/wakame-vdc).

Download both `create_ubuntu_image.sh` and `wakame_init` to the same
directory and make sure they are both executable. Now run
`create_ubuntu_image.sh` with sudo rights and it will make an image for
you.

### The Hard Way

#### Installing The OS

If you want to build an image with another operating system than Ubuntu,
you will have to do the work yourself. Here is a step by step
explanation on how to do so.

First you'll need to install qemu on your system. If you're on Ubuntu,
you can do so like this.

`sudo apt-get install qemu-kvm`

Create a disk image with qemu-img. You can make this as large as you
want but 10 Gigabytes should be enough.

`qemu-img create -f raw myimage.raw 10G`

Get the installation CD image for the OS you wish to install. For most
Linux distributions this can be downloaded from their website. This
guide will assume that we're installing Ubuntu 10.04 64bit. Now start a
virtual machine with `myimage.raw` as its hard drive and make it boot
from your CD image.

`sudo qemu-system-x86_64 -vnc :0 -net nic -net user -hda myimage.raw -m 512 -cdrom path/to/ubuntu-10.04.3-server-amd64.iso -boot d`

The Above Command Explained:

-   **qemu-system-x86\_64**: Specifies that we use a 64bit x86
processor. If you want ot use a 32 bit processor, change this to
**qemu**.

-   **-vnc :0**: This sets up a VNC server on port 5900 that will let us
connect to the virtual machine. Changing the 0 to 1 will make the
VNC server listen on port 5901 instead and so on.

-   **-net nic**: This provides a standard network interface for the
virtual machine.

-   **-net user**: This basically sets up DHCP and network sharing from
the host to the virtual machine. The virtual machine will be able to
access the host's network.

-   **-hda myimage.raw**: This sets the raw image we just created as the
virtual machine's hard drive.

-   **-m 512**: This gives 512 Megabytes of RAM memory to the virtual
machine.

-   **-cdrom path/to/ubuntu-10.04.3-server-amd64.iso**: This creates a
CD drive for the virtual machine and inserts our Ubuntu installer in
it.

-   **-boot d**: This tells the virtual machine to boot from the CD.

Now use a VNC viewer to connect to the virtual machine you just made.
Tightvnc should do the trick.

`vncviewer localhost:5900`

Now you can follow the onscreen steps to install your OS. There are a
few things you should be aware of before doing this.

-   **Use DHCP.**

Wakame-vdc assigns IP address to instances through use of DHCP. If you
use a static IP for your virtual machine, it will not work. Wakame-vdc
blocks all incoming traffic that doesn't use IP addresses it has
assigned.

-   **Make sure the MBR is installed.**

An instance will not be able to boot unless the Master Boot Record is
properly installed. Most Linux distributions will install GRUB to the
MBR at the end of the installation and this should work just fine.

-   **Do not boot the OS after it was installed.**

Booting the installed OS for the first time will generate SSH host keys.
These are keys that each instance will use to identify itself. Therefore
these have to be unique for every instance. We want those to be
generated when an instance is first started. If you have already booted
the installed OS though, it is still possible to remove those keys. More
on that later.

#### Post Install Tweaking

After the installation, there are still a number of settings you need to
tweak before you are ready to register your image into Wakame-vdc. The
best way to do this is to mount your image locally. You'll need kpartx
for this. Install it through your distribution's package manager.

`sudo apt-get install kpartx`

Use kpartx to create a mountable loop device from your image.

`sudo kpartx -va myimage.raw`

This should give you an output similar to this.

`add map `**`loop0p1`**` (251:2): 0 7998046 linear /dev/loop0 1`  
`add map loop0p2 (251:3): 0 1998848 linear /dev/loop0 7999488`

Mount the loop device like this, substituting the **loop0p1** for the
value that was returned to you by the above command.

`sudo mkdir -p /mnt/tmp`  
`sudo mount /dev/mapper/`**`loop0p1`**` /mnt/tmp`

The image should now be mounted on `/mnt/tmp`. We can now go ahead and
tweak settings in there without booting the OS. Again, these steps
assume we are installing an Ubuntu image. These commands will differ
depending on the OS you're installing.

##### Set the DNS server

Although Wakame-vdc will provide a name server through DHCP, it can't
hurt to add another. This example shows how to add Google's public DNS.

`echo "nameserver 8.8.8.8" > /mnt/tmp/etc/resolv.conf`

##### Clear the MAC address

A MAC address is a unique address for a network interface. This must be
different for every instance. We have to clear this in the image so a
new one is generated each time we start an instance.

`rm -f /mnt/tmp/etc/udev/rules.d/70-persistent-net.rules`  
`ln -s /mnt/tmp/dev/null /mnt/tmp/etc/udev/rules.d/70-persistent-net.rules`  
`sed -i 's/HWADDR=.*/#HWADDR=xx:xx:xx:xx:xx:xx/' /mnt/tmp/etc/sysconfig/network-scripts/ifcfg-eth0`

##### Remove the SSH host keys

If there are any host keys present on the system, they should be
deleted. If you haven't booted the image, this step shouldn't be
necessary.

`rm -f /mnt/tmp/etc/ssh/ssh_host*`

##### Make sure acpiphp.ko is loaded at boot

acpiphp.ko is a kernel module that Wakame-vdc needs to be able to attach
volumes to instances. If you wish to use this feature, make sure that
this module is loaded at boot.

`echo acpiphp >> /mnt/tmp/etc/modules`

##### Clean up log files

We want new instances to be as clean as possible when started. Therefore
it's best to remove all log files that are left from the installation.

`rm /mnt/tmp/var/log/*.gz`  
`find /mnt/tmp/var/log/ -type f | while read line; do : > $line; done`

##### Set up the metadata script

As explained above, you will need a [metadata
script](#Metadata "wikilink") to set up the values that Wakame-vdc
assigns to its instances. You can assure it runs at boot by executing it
from `/mnt/tmp/etc/rc.local`. This file is executed as root whenever the
OS starts. This file exists in one form or another in most Linux
distributions. Read more about metadata scripts in the
[Metadata](#Metadata "wikilink") section of this page.

After these steps your image is ready to be registered to Wakame-vdc.
Unmount it and delete the loop device.

`sudo umount /mnt/tmp`  
`sudo kpartx -vd myimage.raw`

This isn't absolutely necessary but you might want to convert it to
qcow2 format before registering. This will considerably speed up the
boot time of your instances.

`sudo qemu-img convert -O qcow2 myimage.raw myimage.qcow2`

Registering Images
------------------

Before an image can be used in Wakame-vdc, it must be uploaded and
registered so Wakame-vdc knows where it is. There are a couple of ways
for Wakame-vdc to store machine images.

### Local Storage

Local storage means that the image is simply stored locally on the
physical server's file system. Let's say we have an image called
`ubuntu10.04-amd64.qcow2` located in
`/usr/share/axsh/wakame-vdc/images/` and want to register it to
Wakame-vdc. We can use the [admin CLI](vdc-manage "wikilink") for this.

`cd /usr/share/axsh/wakame-vdc/dcmgr/bin`  
`./vdc-manage image add local /usr/share/axsh/wakame-vdc/images/ubuntu10.04-amd64.qcow2 --arch x86_64 --account-id a-shpoolxx --description "Ubuntu 10.04 64bit"`

This command will return the unique ID that Wakame-vdc has assigned to
the image. Do note that we are registering the image in account
**a-shpoolxx**. This is a special system account that shares its
resources with everybody. This means that every Wakame-vdc user will be
able to start instances from this image.

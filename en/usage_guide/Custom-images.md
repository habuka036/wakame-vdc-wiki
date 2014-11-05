## Overview

Although there are a variety of pre-built images for Wakame-vdc, in
most cases it will be necessary to install extra software and do other
miscellaneous setup after starting an instance.  To reduce this setup
effort, in some cases it makes sense for users to create their own
custom images.  Then by simply starting an instance Wakame-vdc, it is
possible to have a virtual machine up and running that is already
perfectly set up.  All necessary software and services, for whatever
purpose, can be "ready-to-go".

There are five basic steps for creating and using a custom image with Wakame-vdc:

1. Install an OS into a bootable disk or directory structure.

2. Specialize the OS installation for the intended purpose.

3. Specialize the OS installation for Wakame-vdc.

4. Package it all into one file.

5. Register this file with Wakame-vdc.

Wakame-vdc supports various virtualization technologies (KVM, OpenVZ,
LXC, etc.)  and methods of packaging (tar, gzip, etc.), and the
details for doing the above steps depends on which are chosen.  Below
we will explain the steps assuming OpenVZ virtualization and tarz
packaging.  The steps for other combinations are similar, but differ
in crucial ways that will be documented later.


#### Step 1: Install an OS into a bootable disk or directory structure 

For OpenVZ, specialized techniques are required to install an OS, so
the recommended procedure is to use one of the *precreated templates*
that can be found at
https://wiki.openvz.org/Download/template/precreated.  Minimal
installations of the major Linux distributions are available.

#### Step 2: Specialize the OS installation for the intended purpose

The most straightforward way to install and configure the installed OS
distribution is from inside OpenVZ itself.  An environment created by
following the [[installation guide|install-guide]] or the [VirtualBox
demo image guide](http://wakameusersgroup.org/demo_image.html) provide
enough OpenVZ functionality to do this.  As an example, running
following shell commands in a VM booted with the demo image will
download a minimal "template cache" for CentOS and install web server
software.  For example miscellaneous configure, the shell commands
create a top Web page configure the web service to to start when the
image is instantiated.

    ssh centos@a.b.c.d  # where a.b.c.d is the demo VM's IP address
    [centos@wakame-vdc-1box ~]$ sudo su
    [root@wakame-vdc-1box centos]# cd /vz/template/cache
    [root@wakame-vdc-1box cache]# wget http://download.openvz.org/template/precreated/centos-6-x86_64-minimal.tar.gz
    [root@wakame-vdc-1box cache]# vzctl create 101 --ostemplate centos-6-x86_64-minimal --ipadd a.b.c.vv --hostname localhost
    [root@wakame-vdc-1box cache]# vzctl set 101 --nameserver 8.8.8.8 --save
    [root@wakame-vdc-1box cache]# vzctl start 101
    [root@wakame-vdc-1box cache]# vzctl enter 101
    [root@localhost /]# yum install httpd
    [root@localhost /]# echo "<html>An Example top web page.</html>" >/var/www/html/index.html
    [root@localhost /]# service httpd start
    [root@localhost /]# chkconfig httpd on

#### Step 3: Specialize the OS installation for Wakame-vdc


##### Insert the wakame-init script and run it from /etc/rc.local:

Note: This step is necessary so that Wakame-vdc can do last-minute
specialization necessary when each instance is booted.

    [root@localhost /]# cd /etc
    [root@localhost etc]# wget https://raw.githubusercontent.com/axsh/wakame-vdc/master/wakame-init/rhel/6/wakame-init
    [root@localhost etc]# echo '/etc/wakame-init' >>rc.local

##### Clear shell history:

Note: This step is optional.

    rm /home/*/.bash_history /root/.bash_history

##### Remove ssh host keys:

Note: This step is optional but recommended so that different
instances appear as different ssh hosts.

    rm /etc/ssh/ssh_host*

##### Remove net rules file so eth0 doesn't become eth1 at start:

Note: This step is not necessary for OpenVZ, but will not cause any
problems.  In fact, most of the OpenVZ precreated template caches do
not have this file.

    rm /etc/udev/rules.d/70-persistent-net.rules

#### Step 4: Package it all into one file

Exit the OpenVZ container.

    [root@localhost etc]# exit

Now we are back at the demo box prompt. The following instructions are adapted from
http://wiki.openvz.org/Ubuntu_template_update:

    [root@wakame-vdc-1box cache]# vzctl stop 101
    [root@wakame-vdc-1box cache]# vzctl set 101 --ipdel all --save
    [root@wakame-vdc-1box cache]# cd /vz/private/101
    [root@wakame-vdc-1box 111]# tar  --numeric-owner -czf /vz/template/cache/new-wakame-image-name.tar.gz . ## ((TODO: check this))
    [root@wakame-vdc-1box 111]# cd ..
    [root@wakame-vdc-1box private]# vzctl destroy 101

#### Step 5: Register this file with Wakame-vdc

This step follows a slightly modified version of related instructions
in the [[Wakame-vdc install guide|install-guide]], and assumes that
the directory and Wakame-vdc objects from those instructions have
already been created.

First, move the new image to Wakame-vdc's directory for keeping images.

    mv /vz/template/cache/new-wakame-image-name.tar.gz /var/lib/wakame-vdc/images

Compute and remember md5 sum. We will need it when registering it in the database.

    md5sum /var/lib/wakame-vdc/images/new-wakame-image-name.tar.gz | tee /tmp/remember.md5

Now we need to let Wakame-vdc know that it has a machine image to start instances from. First of all here's a brief explanation of how Wakame-vdc treats machine images. There are two terms we'll need to understand here. **Backup objects** and **machine images**. A *backup object* is basically a hard drive image. A *machine image* is a backup object that's bootable. In case of a Linux instance, the *machine image* would hold the root partition.

To register both the *backup object* and the related *machine image*, we will again use the `vdc-manage` cli but since we are going to run more than one operation now, it's more efficient to call it without arguments. This will result in a special shell where we can run `vdc-manage` commands. This is more efficient because we only need to establish a connection to the database once and can then feed many commands through it.

    /opt/axsh/wakame-vdc/dcmgr/bin/vdc-manage

Now register the backup object and assign it to the local storage made in the [[Wakame-vdc install guide|install-guide]].

This image is compressed with gzip to save space. In order to properly manage its disk space usage, Wakame-vdc needs to know both the compressed size and uncompressed size of the image. These translate to the *size* and *allocation-size* options respectively.

((question...what does the uncompressed size mean for an openvz directory))
((TODO: compute size and AAA

    backupobject add \
      --uuid bo-newimage \
      --display-name "New image with web server and one static page" \
      --storage-id bkst-local \
      --object-key new-wakame-image-name.tar.gz \
      --size SSSSSS \
      --allocation-size AAAAAA \
      --container-format gz \
      --checksum $(head -c 32 /tmp/remember.md5)

Next we tell Wakame-vdc that this backup object is a machine image that we can start instances of.

((what is root device for OpenVZ???))

    image add local bo-newimage \
      --account-id a-shpoolxx \
      --uuid wmi-newimage \
      --root-device uuid:148bc5df-3fc5-4e93-8a16-7328907cb1c0 \
      --display-name "New image with web server and one static page"


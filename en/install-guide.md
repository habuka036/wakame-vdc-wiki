# Wakame-vdc install guide

### What are we installing?

This guide will set up a basic Wakame-vdc environment on a single host. When we are done with this guide we will have the following features available:

  * We will have a simple *machine image* running Ubuntu 10.04 (Lucid Lynx). We will be able to start instances of this image.

  * We will be able to create dynamic firewalls using security groups.

  * We will be able to use either password or rsa key authentication when logging into instances.

### Installation requirements

  * A machine running [Centos](http://www.centos.org) 6.4 with x86 64 bit processor architecture. This can be either bare metal or a virtual machine. Instances are going to run as
[OpenVZ](http://openvz.org/Main_Page) containers so you don't need to worry about nested virtualization.

  * About two gigabytes of disk space available in the `/opt` directory. Wakame-vdc itself and its demo images are going to be placed there.

  * One gigabyte of RAM memory should be more than enough for Wakame-vdc to run in this simple demo environment.

  * Some free disk space in the `/var/lib` directory. How much you need depends on how many instances you want to start. Wakame-vdc is going to place its instances data in
`/var/lib/wakame-vdc`. One instance of the Ubuntu Lucid image used in this guide takes up about 350 MB.

  * Internet access. (to download rpm packages and machine images)

### What will this guide do to my machine?

  * Since we are going to use [OpenVZ](http://openvz.org/Main_Page), we will install OpenVZ's modified Linux kernel.

  * We are going to set up a [Linux Bridge](http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge) and connect the host's `eth0` interface to it.

### Let's get started

#### Yum repository setup

Add the official Wakame-vdc yum repository to `/etc/yum.repos.d`.

    sudo curl -o /etc/yum.repos.d/wakame-vdc.repo -R https://raw.githubusercontent.com/axsh/wakame-vdc/master/rpmbuild/wakame-vdc.repo

Add the Axsh OpenVZ yum repository to `/etc/yum.repos.d`. We are hosting an older version of OpenVZ on which Wakame-vdc is confirmed to be working.

    sudo curl -o /etc/yum.repos.d/openvz.repo -R https://raw.githubusercontent.com/axsh/wakame-vdc/master/rpmbuild/openvz.repo

Install [EPEL](https://fedoraproject.org/wiki/EPEL). We need to pull some OpenVZ dependencies from here. This url will just redirect to the official EPEL site.

    sudo rpm -Uvh http://dlc.wakame.axsh.jp.s3-website-us-east-1.amazonaws.com/epel-release

#### Install Dcmgr

The dcmgr package contains two things.

* The Wakame-vdc web API. This is Wakame-vdc's user interface. You tell Wakame-vdc to do stuff by making http requests to this API.

* The Wakame-vdc collector. This is Wakame-vdc's decision making organ. When you start an instance it decides which HVA (We'll tell you what a HVA is below) will host it, which IP address it
will get, etc.

Install it with the following command.

    sudo yum install -y wakame-vdc-dcmgr-vmapp-config

#### Install HVA

The HVA (HyperVisor Agent) is the part of Wakame-vdc that actually starts instances. On a production environment, you would likely have a dedicated bare metal host for this. Right now we are
just going to install it on the same machine as dcmgr.

    sudo yum install -y wakame-vdc-hva-full-vmapp-config

#### Install webui

This is Wakame-vdc's GUI. It's actually a rails application that sits in front to the dcmgr web API.

    sudo yum install -y wakame-vdc-webui-vmapp-config

#### Reboot to load OpenVZ kernel

These Wakame-vdc packages have installed OpenVZ as a dependency. OpenVZ runs on a custom kernel. Reboot your machine so that kernel gets loaded.

#### Configuration

By default Wakame-vdc's [upstart jobs](http://upstart.ubuntu.com) require an environment variable `RUN=yes` to be set. We can set it right now in the `/etc/default/vdc-*` scripts so we don't
have to worry about it when starting services any more.

    sudo sed -i -e 's/^#\(RUN=yes\)/\1/' /etc/default/vdc-*

The different Wakame-vdc services require their own config files. Unfortunately they aren't automatically installed with the rpm packages. There are examples included in the Wakame-vdc source
tree though. Copy those over manually.

    sudo cp /opt/axsh/wakame-vdc/dcmgr/config/dcmgr.conf.example /etc/wakame-vdc/dcmgr.conf

    sudo cp /opt/axsh/wakame-vdc/dcmgr/config/hva.conf.example /etc/wakame-vdc/hva.conf

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/database.yml.example /etc/wakame-vdc/dcmgr_gui/database.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/dcmgr_gui.yml.example /etc/wakame-vdc/dcmgr_gui/dcmgr_gui.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/instance_spec.yml.example /etc/wakame-vdc/dcmgr_gui/instance_spec.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/load_balancer_spec.yml.example /etc/wakame-vdc/dcmgr_gui/load_balancer_spec.yml

All Wakame-vdc services have a `node id`. This is a unique id that [AMQP](http://www.amqp.org) uses to identify each service.

In the next step we are going to prepare demo data. The script we will run is expecting the HVA's node id to be `demo1`. By default that node id is set to the host machine's hostname but
let's manually set it to `demo1`.

Edit the file `/etc/default/vdc-hva` and uncomment the following line:

    NODE_ID=demo1

#### Prepare demo data

We can't do much with Wakame-vdc without some initial data in the database and some machine images to start instances from. Let's put those things in place.

##### Create the Wakame-vdc database

Wakame-vdc uses a mysql database. Start mysql and create the database.

    sudo /etc/init.d/mysqld start
    mysqladmin -uroot create wakame_dcmgr

We can use rake to create the database tables. Wakame-vdc comes with its own ruby binary that includes rake. It needs to be in your PATH. If you already have rake in your PATH, you can skip this step.

    cd /opt/axsh/wakame-vdc/ruby/bin
    PATH=$PWD:$PATH

Now use rake to create the database tables.

    rake db:up

##### Download machine images

For this guide we are going to install two machine images:

* Load balancer

  This is actually a Wakame-vdc system image with [HAProxy](http://www.haproxy.org) and [stud](https://github.com/bumptech/stud) installed. It's not going to show up as an image that a user
can start instances of. Instead when a user creates a *load balancer*, Wakame-vdc will start an instance of this image and configure it.

* Lucid5d

  This is just a simple image containing Ubuntu 10.04 (Lucid Lynx). It's not really meant to do anything more than allow users to start a few instances and play around with Wakame-vdc

Wakame-vdc's default directory for keeping images is `/var/lib/wakame-vdc/images`. Unfortunately the rpm packages don't create that directory automatically for us yet. Create it manually.

    sudo mkdir -p /var/lib/wakame-vdc/images

Now download both images in that directory.

    cd /var/lib/wakame-vdc/images
    sudo curl -O http://dlc.wakame.axsh.jp.s3.amazonaws.com/demo/vmimage/ubuntu-lucid-kvm-md-32.raw.gz
    sudo curl -O http://dlc.wakame.axsh.jp.s3.amazonaws.com/demo/vmimage/lb-centos-openvz-md-64-stud.raw.gz

The images should have the following md5 sums

    ad5904e9cf4213ce441fe5e12cd14b41  lb-centos-openvz-md-64-stud.raw.gz
    55dcc87838af4aa14eb3eb986ea756d3  ubuntu-lucid-kvm-md-32.raw.gz

#### Create the network bridge

Wakame-vdc uses bridged networking to allow users to connect to instances. We are going to set up a [Linux Bridge](http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge) to
attach instances to.

If you want to connect to instances from somewhere else than the host, we will need a network interface on the host that attaches an outside network to the bridge.

For the sake of this guide, we are going to assume that we will start instances in network `192.168.3.0/24`. The host has a network interface `eth0` with static ip address `192.168.3.100`.
Change these values to match your environment.

Create the file `/etc/sysconfig/network-scripts/ifcfg-br0` with the following contents

    DEVICE=br0
    TYPE=Bridge
    BOOTPROTO=static
    ONBOOT=yes
    NM_CONTROLLED=no
    IPADDR=192.168.3.100
    NETMASK=255.255.255.0
    GATEWAY=192.168.3.1
    DNS1=8.8.8.8
    DELAY=0

Next we need to attach `eth0` to the bridge. Create the file `/etc/sysconfig/network-scripts/ifcfg-eth0` with the following contents.

    DEVICE="eth0"
    ONBOOT="yes"
    BRIDGE=br0
    NM_CONTROLLED=no

Restart the network.

**Be careful!** If you have made any mistakes setting up these files for your environment, this next command will cause networking to go down on your machine. Triple check these values if
you're running this guide on a remote machine!

    sudo  /etc/init.d/network restart

#### Start Wakame-vdc

Start the rabbitmq server. Wakame-vdc's different processes use AMQP to communicate. Rabbitmq-server is the AMQP exchange managing all that traffic.

    sudo /etc/init.d/rabbitmq-server start

After all this hard work we should be able to get Wakame-vdc up and running. Start the upstart jobs.

    sudo start vdc-dcmgr
    sudo start vdc-collector
    sudo start vdc-hva
    sudo start vdc-webui

If everything went right, Wakame-vdc is now up and running. Start a web browser and surf to `192.168.3.100:9000`. Log in with user `demo` and password `demo`.

The `lucid5d` image has password login through ssh enabled. After starting instances you are able to log in using username `ubuntu` and password `ubuntu`. You are of course also able to log in using username `ubuntu` and a key pair registered with Wakame-vdc.

Check out the [[basic usage guide|Basic-usage]] if you're not sure were to go from here.

# Wakame-vdc install guide

### What are we installing?

This guide will set up a basic Wakame-vdc environment on a single host. When we are done with this guide we will have the following features available:

  * We will have a simple machine image ubuntu lucid. We will be able to start instances of this image.

  * We will be able to create dynamic firewalls using security groups

  * We will be able to use either password or rsa key authentication when logging into instances.

### Installation requirements

TODO: Memory requirement

  * A machine running Centos 6.4. This can be either bare metal or a virtual machine. Instances are going to run as [OpenVZ](http://openvz.org/Main_Page) containers so you don't need to worry about nested virtualization.

  * About 2 gigabytes of disk space available in the `/opt` directory.

  * Some free disk space in the `/var/lib` directory. How much you need depends on how many instances you want to start. Wakame-vdc is going to place its instances data in `/var/lib/wakame-vdc`. One instance of the Ubuntu lucid image used in this guide takes up about 350 MB.

### What will this guide do to my machine?

  * Since we are going to use OpenVZ, we will install OpenVZ's modified Linux kernel.

  * We are going to set up a [Linux Bridge](http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge) and connect the host's eth0 interface to it.

### Guide

#### Yum repository setup

Add the official Wakame-vdc yum repository to `/etc/yum.repos.d`.

    sudo curl -o /etc/yum.repos.d/wakame-vdc.repo -R https://raw.githubusercontent.com/axsh/wakame-vdc/master/rpmbuild/wakame-vdc.repo

Add the Axsh OpenVZ yum repository to `/etc/yum.repos.d`.

TODO: Figure out why we are mainting our own repository at Axsh and explain here.

    sudo curl -o /etc/yum.repos.d/openvz.repo -R https://raw.githubusercontent.com/axsh/wakame-vdc/master/rpmbuild/openvz.repo

Install the Axsh epel release. We need to pull some OpenVZ dependencies from here.

TODO: Figure out why we are mainting our own repository at Axsh and explain here.

    sudo rpm -Uvh http://dlc.wakame.axsh.jp.s3-website-us-east-1.amazonaws.com/epel-release

#### Install Dcmgr

The dcmgr package contains two things.

* The Wakame-vdc web API. This is Wakame-vdc's user interface. You tell Wakame-vdc to do stuff by making http requests to this API.

* The Wakame-vdc collector. This is Wakame-vdc's decision making organ. When you start an instance it decides which hva will start it, which IP address it will get, etc.

Install it with the following command.

    sudo yum install -y wakame-vdc-dcmgr-vmapp-config

#### Install HVA

The HVA (Hypervisor agent) is the part of Wakame-vdc that actually starts instances. On a production environment, you would likely have a dedicated bare metal host for this. Right now we are just going to install it on the same machine as dcmgr.

    sudo yum install -y wakame-vdc-hva-full-vmapp-config

#### Install webui

This is Wakame-vdc's GUI. It's actually a rails application that sits in front to the dcmgr web API.

    sudo yum install -y wakame-vdc-webui-vmapp-config


#### Configuration

By default Wakame-vdc's upstart jobs require an environment variable `RUN=yes` to be set. We can set it right now in the `/etc/default/vdc-*` scripts so we don't have to worry about it when starting services any more. 

    sudo sed -i -e 's/^#\(RUN=yes\)/\1/' /etc/default/vdc-*

The different Wakame-vdc services require their own config files. Unfortunately they aren't automatically installed with the rpm packages. There are examples included in the Wakame-vdc source tree though. Copy those over manually.

    sudo cp /opt/axsh/wakame-vdc/dcmgr/config/dcmgr.conf.example /etc/wakame-vdc/dcmgr.conf

    sudo cp /opt/axsh/wakame-vdc/dcmgr/config/hva.conf.example /etc/wakame-vdc/hva.conf

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/database.yml.example /etc/wakame-vdc/dcmgr_gui/database.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/dcmgr_gui.yml.example /etc/wakame-vdc/dcmgr_gui/dcmgr_gui.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/instance_spec.yml.example /etc/wakame-vdc/dcmgr_gui/instance_spec.yml

    sudo cp /opt/axsh/wakame-vdc/frontend/dcmgr_gui/config/load_balancer_spec.yml.example /etc/wakame-vdc/dcmgr_gui/load_balancer_spec.yml

All Wakame-vdc services have a `node id`. This is a unique id that AMQP uses to identify each service.

In the next step we are going to prepare demo data. The script we will run is expecting the HVA's node id to be `demo1`. By default that node id is set to the host machine's hostname but let's manually set it to `demo1`.

Edit the file `/etc/default/vdc-hva` and uncomment the following line:

    NODE_ID=demo1

#### Prepare demo data

We can't do much with Wakame-vdc without some initial data in the database and some machine images to start instances from. Let's put those things in place.

Install the vdc.sh script

    sudo yum install -y wakame-vdc-vdcsh

Unfortunately there is a bug in the vdc.sh rpm package. It fails to create a requires *Modulesfile*. Create it manually.

    echo "hva hva_id=demo1 host=localhost" | sudo tee /opt/axsh/wakame-vdc/tests/Modulesfile

The vdc.sh script comes with a few machine images but they need to be enabled manually. We are going to enable two:

* Load balancer

  This is actually a Wakame-vdc system image with [HAProxy](http://www.haproxy.org) and [stud](https://github.com/bumptech/stud) installed. It's not going to show up as an image that a user can start instances of. Instead when a user creates a *load balancer*, Wakame-vdc will start an instance of this image and configure it.

* Lucid5d

  This is just a simple image containing Ubuntu 10.04 (Lucid Lynx). It's not really meant to do anything more than start a few instances and play around with Wakame-vdc

Enable these two images with the following commands.

    sudo ln -s /opt/axsh/wakame-vdc/tests/vdc.sh.d/image.available/image-lb.meta /opt/axsh/wakame-vdc/tests/vdc.sh.d/image.enabled/

    sudo ln -s /opt/axsh/wakame-vdc/tests/vdc.sh.d/image.available/image-lucid5d.meta /opt/axsh/wakame-vdc/tests/vdc.sh.d/image.enabled/

The script will want to place its images in `/opt/axsh/wakame-vdc/tmp/images`. Create that directory.

    sudo mkdir -p /opt/axsh/wakame-vdc/tmp/images

Run it.

    sudo /opt/axsh/wakame-vdc/tests/vdc.sh init

The script has now created the database and filled it up. Unfortunately it also expects the images to be accessible through a web server. We are not going to set up such a server in this guide. We are just going to keep the images on the local file system.

Using the vdc-manage cli, we can tell Wakame-vdc about that.

    cd /opt/axsh/wakame-vdc/dcmgr/bin
    ./vdc-manage backupobject modify bo-demolb --storage-id bkst-demo1
    ./vdc-manage backupobject modify bo-lucid5d --storage-id bkst-demo1

The lucid5d image has a 32 bit architecture but our host is 64 bit. A 64 bit hypervisor is technically able to run 32 bit instances but unfortunately Wakame-vdc's implementation currently prevents this. We can work around it by setting the lucid5d image to 64bit in Wakame-vdc's database.

      cd /opt/axsh/wakame-vdc/dcmgr/bin
      ./vdc-manage image modify wmi-lucid5d --arch x86_64

* Set up the bridge

Wakame-vdc uses bridged networking to allow users to connect to instances. You'll want to prepare an interface with a static ip address to connect the bridge to. For the sake of this guide, we are going to assume it is eth0. We will also assume that the static ip address we chose is 192.168.3.100. Please ajust these values for your environment.

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

Next we need to attach eth0 to the bridge. Create the file `/etc/sysconfig/network-scripts` with the following contents.

      DEVICE="eth0"
      ONBOOT="yes"
      BRIDGE=br0
      NM_CONTROLLED=no

Start the rabbitmq server. Wakame-vdc's different processes use AMQP to communicate. Rabbitmq-server is the AMQP exchange managing all that traffic.

      sudo /etc/init.d/rabbitmq-server start

After all this hard work we should be able to get Wakame-vdc up and running. Start the upstart jobs.

      sudo start vdc-dcmgr
      sudo start vdc-collector
      sudo start vdc-hva
      sudo start vdc-webui

If everything went right, Wakame-vdc is now up and running. Start a web browser and surf to 192.168.3.100:9000. Log in with user 'demo' and password 'demo'.
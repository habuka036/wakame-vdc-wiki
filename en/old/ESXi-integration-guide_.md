 Infrastructure overview

Below is the infrastructure we will use for this guide. You can add ESXi hosts to any Wakame infrastructure you have but to keep it simple, we will assume that all other Wakame-vdc services are running on the same host.

Network: 192.168.2.0/24 

192.168.2.25: The ESXi host: This is a standard ESXi installation
Datastore name: datastore1
Datacenter name: ha-datacenter
username: root
password: ESXiPassword 

192.168.2.98: Wakame-vdc host: A physical or virtual host with the following configuration.
username: wakame
Wakame-vdc directory: /home/wakame/wakame-vdc
Running Wakame-vdc services
AMQP server
Collector
NSA
Web API
Web GUI
Mysql 

192.168.2.99: A virtual appliance running Wakame-vdc's ESXi HVA service. This appliance is what we'll create in this guide. 

Install the Ruby vSphere Console

We will use the Ruby vSphere Console interact with ESXi. Enter the following commands in a shell. Rubygems needs to be installed.

Remark: The Ruby vSphere Console is not used by Wakame-vdc and can be installed on any machine that has network access to the ESXi host. We will only use it for manual interaction with the ESXi host.

gem install rvc

Make sure that the rubygems bin directory is in your PATH. Substitute the below path for the one where your rvc gem binary is installed.

PATH=$PATH:/home/username/.gem/ruby/1.9.1/bin

Connect to the ESXi host.

rvc 192.168.2.25

Create the virtual appliance

Remark: As mentioned at the top of this article, Wakame's HVA service can be installed on any machine that has network access to the ESXi host. If you will not install it as a virtual appliance on the ESXi host, jump toInstall Wakame-vdc's HVA service.

Execute the following commands inside the rvc shell.

Create a new virtual machine. A memory size of 1024 megabytes will be enough.

/localhost/ha-datacenter/vms> vm.create virtual_appliance -m 1024 -d ../datastores/datastore1/ -p ../computers/localhost./resourcePool/

Add a hard drive of about 3 Gigabytes in size.

/localhost/ha-datacenter/vms> device.add_disk virtual_appliance -s 3GB

Upload an Ubuntu installer CD image to the ESXi datastore. You can download it here: http://www.ubuntu.com/download/server/download

/localhost/ha-datacenter/vms> datastore.upload /home/username/downloads/ubuntu-10.04.2-server-amd64.iso ../datastores/datastore1/files/ubuntu-10.04.2-server-amd64.iso

Insert the Ubuntu installer into the virtual machine's CD drive.

/localhost/ha-datacenter/vms> device.insert_cdrom virtual_appliance/devices/cdrom-3000/ ../datastores/datastore1/files/ubuntu-10.04.2-server-amd64.iso/

Turn on the virtual machine

/localhost/ha-datacenter/vm> on virtual_appliance

Log into the virtual machine using the VMware Remote Console.

/localhost/ha-datacenter/vm> vmrc.install
/localhost/ha-datacenter/vm> view virtual_appliance

Install the Ubuntu OS

Ubuntu OS installation is beyond the scope of this guide. Please follow Ubuntu's guide here: https://help.ubuntu.com/10.04/serverguide/C/installation.html

This guide assumes that you have a user named wakame with sudo powers set up in Ubuntu.
Install Wakame-vdc's HVA service
Download the Wakame-vdc source code

Copy the Wakame-vdc source code onto the virtual appliance. You can download it from Github. https://github.com/axsh/wakame-vdc/downloads

scp axsh-wakame-vdc-v11.12.0-379-ga35c233.tar.gz wakame@192.168.2.99:

Log into the virtual appliance through ssh

ssh wakame@192.168.2.99

Run the following commands on the virtual appliance

Unpack the Wakame-vdc source tarball.

tar -xzf axsh-wakame-vdc-v11.12.0-379-ga35c233.tar.gz

Rename the resulting folder for convenience sake.

mv axsh-wakame-vdc-a35c233 wakame-vdc

Now we use the vdc.sh script to install all of Wakame-vdc's dependencies. This will require internet access from the virtual appliance.

First of all, we need to make some slight alterations to it. Usually vdc.sh will generate a couple of demo images. Since our virtual appliance only has 3GB of disk space, we don't want those images. We remove their .meta files so they don't get generated.

cd /home/wakame/wakame-vdc/tests/vdc.sh.d
rm image-lucid*.meta

Now run the install script

cd /home/wakame/wakame-vdc/tests/vdc.sh.d
sudo ./vdc.sh install

Set up hva.conf

Overwrite /home/wakame/wakame-vdc/dcmgr/config/hva.conf with the following contents, substituting the config/esxi_* values with those of your system. Create the file if it doesn't exist.

------------------------
Configuration file for hva.
------------------------

directory to store VM local data.
config.vm_data_dir = "/home/wakame/wakame-vdc/tmp/instances"

Decides what kind of edge networking will be used. If omitted, the default 'netfilter' option will be used
* 'netfilter'
* 'legacy_netfilter'no longer supported, has issues with multiple vnic vm isolation
* 'openflow'experimental, requires additional setup
* 'off'
config.edge_networking = 'off'

ESXi
config.esxi_ipaddress  = "192.168.2.25"
config.esxi_datacenter = "ha-datacenter"
config.esxi_datastore  = "datastore1"
config.esxi_username= "root"
config.esxi_password= "ESXiPassword"

Create an upstart script

We will use upstart to start and stop our HVA service. You can learn more about upstart here: http://upstart.ubuntu.com/

Create the file /etc/init/vdc-hva.conf with the following contents.

description "Wakame-VDC: hva agent"
author "axsh Co."

start on runlevel [2345] 
stop on runlevel [016] 

respawn
respawn limit 5 60

pre-start script
logger "wakame-vdc hva agent start"
end script

chdir /home/wakame/wakame-vdc/dcmgr
script
. /etc/default/wakame-vdc
exec bundle exec ./bin/hva -i ${HVA_ID} -s amqp://${AMQP_SERVER}:${AMQP_PORT}/ 2>&1 | /usr/bin/flog -p /var/run/flog-vdc-hva.pid /var/log/vdc-hva.log
end script

Create the file /etc/default/wakame-vdc with the following contents.

VDC_ROOT=/home/wakame/wakame-vdc
AMQP_SERVER=192.168.2.98
AMQP_PORT=5672
HVA_ID=esxi1

Start the service

Our HVA service is all done. We can now start it with the following command.

sudo start vdc-hva

Likewise, we can stop it with this command.

sudo stop vdc-hva

If there are errors, you can check the log with the following command.

cat /var/log/vdc-hva.log

Register the ESXi HVA

In the previous step we have created our ESXi HVA service, now we have to make Wakame-vdc aware of it. We can use the vdc-manage CLI for this.

Execute these commands on the Wakame-vdc host. (192.168.2.98)

cd /home/wakame/wakame-vdc/dcmgr/bin
./vdc-manage host add hva.esxi1 --uuid hn-esxi1 --name "esxi host 1" --cpu-cores 100 --memory-size 400000 --hypervisor esxi

Remark: If this command fails, go back and check if your HVA service is currently started. It could take a few minutes for wakame to notice that it's started. To register it while it's off, add the --force option to the above command.

The following command should now show your new host as online.

./vdc-manage host show

Providing ESXi images

One thing about ESXi is that it can't just use the same images that KVM does. You need to use the proprietary VMware format. At the time of writing, it is not possible to use STA with ESXi images. Instead you can either put these images directly on the HVA hosts, or you can run a web server that serves the images over HTTP. This guide will show you how to do the latter.

Keeping the above infrastructure in mind, we will use the Wakame-vdc host (192.168.2.98) for this. It's an Ubuntu host so we will be able to use apt-get.
Setting up the webserver

Install Nginx.

sudo apt-get install nginx

Start Nginx

sudo /etc/init.d/nginx start

The standard directory for Nginx is /var/www/nginx-default/. We can place our images in there.

Remark: VMWare ESXi images consist of 2 files. One *.vmdk file that contains metadata and one *-flat.vmdk file that contains the disk itself. Wakame-vdc requires these to have the same name. For example:

name_of_image.vmdk
name_of_image-flat.vmdk

If ESXi images don't follow this format, Wakame-vdc will not be able to work with them.
Registering the images

When we have our webserver up serving the images, we have to make Wakame-vdc aware of them. Let's image we have the following image set up on our webserver.

ubuntu-lucid-esxi-64-flat.vmdk
ubuntu-lucid-esxi-64.vmdk

MD5sum of ubuntu-lucid-esxi-64-flat.vmdk: 293bec7563280fe2934a3611a3e1dab2

It should be possible to download those images by executing the following command on the virtual appliance.

Remark: You don't actually have to download these images. Just verify that it's possible to do so.

wget http://192.168.2.98/ubuntu-lucid-esxi-64-flat.vmdk

SSH into the Wakame-vdc host and execute the following commands.

cd /home/wakame/wakame-vdc/dcmgr/bin
./vdc-manage image add local http://192.168.2.98/ubuntu-lucid-esxi-64-flat.vmdk \
--account-id a-shpoolxx \
--is-public 1 \
--description "esxi test image" \
--md5sum 293bec7563280fe2934a3611a3e1dab2

Remark: Note that we are registering the *-flat.vmdk file. Wakame-vdc will be able to locate the vmdk file on its own as long as it is in the same directory as the flat file and has been properly named.

If the vdc-manage command was successful, you should be able to instantiate your new image through the Wakame-vdc GUI.
Creating images
Creating the temporary VM

The way to make a machine image for Wakame-vdc to use with ESXi, we will manually make a virtual machine, install the OS, do some quick configuration and then download its hard drive image.

Open rvc shell.

rvc 192.168.2.25

Execute the following commands in the rvc shell.

Create a new virtual machine.

vm.create -d ../datastores/datastore1 -p ../computers/localhost./resourcePool/ -m 1024 esxi-1G-image

Add a hard drive to it. For this example we give it 1 gigabyte of disk space.

device.add_disk -s 1G esxi-1G-image/

Insert the Ubuntu install CD.

device.insert_cdrom esxi-1G-image/devices/cdrom-3000  ../datastores/datastore1/files/ubuntu-10.04.2-server-amd64.iso

Turn on the virtual machine and use the VMWare remote console to install Ubuntu on it.

on esxi-1G-image
view esxi-1G-image

Post install configuration

Execute the following commands on the new Ubuntu system.

cd /etc/udev/rules.d/
sudo mv 70-persistent-net.rules 70-persistent-net.rules.original
sudo ln -s /dev/null 70-persistent-net.rules
sudo mkdir -p /etc/sysconfig/network-scripts
sudo bash -c "echo "#HWADDR=xx:xx:xx:xx:xx:xx" >> /etc/sysconfig/network-scripts/ifcfg-eth0"
cd /etc/ssh/
sudo rm -f *host*

Copy the Wakame-vdc init script into /etc/wakame-init. You can find the script in the Wakame-vdc source or here on github.https://github.com/axsh/wakame-vdc/blob/master/tests/image_builder/ubuntu/10.04/wakame-init


To make sure the script it executed at boot, overwrite /etc/rc.local on the Ubuntu VM with the following contents.

!/bin/sh -e
/etc/wakame-init metadata-cd
exit 0

Make sure that the wakame-init script is executable

sudo chmod +x /etc/wakame-init


Clear the shell history and power off the VM

history -c
sudo poweroff

Download Disk image (in rvc shell)

All done. Now we can download the VM's hard drive image and save it to any location we want. In this case /home/username/esxi_image/.

cd /192.168.2.25/ha-datacenter/datastores/datastore1/files/esxi-1G-image
datastore.download disk-200-1-flat.vmdk /home/username/esxi_image/disk-200-1-flat.vmdk
datastore.download disk-200-1.vmdk /home/username/esxi_image/disk-200-1.vmdk

Destroy temp VM (in rvc shell)

We no longer need the temporary VM. We can destroy it.

cd /192.168.2.25/ha-datacenter/vms/
vm.kill esxi-1G-image/

Creating instance specs

To start ESXi images you need an instance spec that uses the ESXi hypervisor. You can make one with the following command on the Wakame-vdc host.

cd /home/wakame/wakame-vdc/dcmgr/bin
./vdc-manage spec add --account-id a-shpoolxx \
--hypervisor esxi \
--arch x86_64 \
--cpu-cores 1 \
--memory-size=256


Support for OpenFlow in Wakame-vdc should be considered experimental.

Quick start
===========

The quickest way to get started with OpenFlow is to use the setup
scripts in “wakame-vdc/tests/openflow/”;

export work_dir=/usr/share/axsh/wakame-vdc/

sudo ./vdc.sh install
sudo -E ./openflow/setup-openflow.sh
sudo -E ./openflow/enable-ovs.sh
sudo ./vdc.sh openflow

Verify each step with the following;

# There should be no flows immediately after running enable-ovs.sh.
#
# Once wakame-vdc is up and running this should display about a dozen flows.
&gt; sudo ../ovs/bin/ovs-ofctl dump-flows br0
NXST_FLOW reply (xid=0x4):

# Returns the unix socket the switch will attempt to connect to.
&gt; sudo ../ovs/bin/ovs-vsctl get-controller br0 
unix:/usr/share/axsh/wakame-vdc//ovs/var/run/openvswitch/br0.controller

Open vSwitch kernel modules can fail to load if there is an active
bridge module, so it may be necessary to disable the *ebtables* service
and restart.

Startup script for Open vSwitch will be installed to */etc/init.d/* by
*setup-openflow.sh*, however it is disabled by default. It should be
noted that *enable-ovs.sh* contains some required steps to be executed
before launching *vdc.sh*.

Open vSwitch
============

Install
-------

See <http://openvswitch.org/support/> for official build instructions.

export OVS_PREFIX=/usr/share/axsh/ovs

git clone git://openvswitch.org/openvswitch

cd openvswitch/
./boot.sh
./configure --prefix=$OVS_PREFIX --with-linux=/lib/modules/`uname -r`/build/
make &amp;&amp; sudo make install

sudo install --mode=0644 ./datapath/linux/*_mod.ko /lib/modules/`uname -r`/kernel/drivers/net
sudo depmod

cat ./debian/openvswitch-switch.init | sed -e &quot;s:/usr/:$OVS_PREFIX:g&quot; &gt; ./ovs-switch.tmp
sudo install --mode=0755 ./ovs-switch.tmp /etc/init.d/ovs-switch

Current git master is required as certain features not available in any
release are required.

Note that the kernel module *bridge.ko* conflict with
*openvswitch\_mod.ko*, thus loading the Open vSwitch module will not
work with an active *bridge* module. The *ovs-switch* script should
automatically handle this conflict assuming all bridges are deleted.

To include legacy support for *brctl* by default, add *BRCOMPAT=yes* to
the *“openvswitch/debian/openvswitch-switch.init”* script. This is
needed in order for wakame-vdc add network interfaces to the OpenFlow
switch.

ovsdb-tool create $OVS_PREFIX/etc/openvswitch/conf.db ./vswitchd/vswitch.ovsschema
$OVS_PREFIX/sbin/ovsdb-server --pidfile --detach --remote=punix:$OVS_PREFIX/var/run/openvswitch/db.sock $OVS_PREFIX/etc/openvswitch/conf.db
ovs-vsctl --no-wait init

Initialize the database before running Open vSwitch.

Verify
------

# If remotely connected, use a script to ensure the
# network gets restarted.
sudo brctl delif br0 eth0
sudo ip link set br0 down
sudo brctl delbr br0

# export BRCOMPAT=yes
sudo /etc/init.d/ovs-switch restart
sudo /etc/init.d/networking restart

Check that *bridge* module got unloaded and *ovs-vswitchd* is
up-and-running. When the network got restarted *br0* should have been
recreated automatically assuming it was defined in
*“/etc/network/interfaces”*.

&gt; lsmod | grep bridge
&gt; sudo ovs-vsctl list-ports br0
eth0
&gt; sudo ovs-ofctl dump-flows br0
NXST_FLOW reply (xid=0x4):
cookie=0x0, duration=11601.804s, table=0, n_packets=0, n_bytes=0, priority=0 actions=NORMAL

Trema
=====

Setup
-----

![](rant-0.5.9.gem.dummy.jpg "image") would be needed by compiler.

git clone git://github.com/rakshasa/trema
cd trema &amp;&amp; ./build.sh

# Verify Trema runs.
LOGGING_LEVEL=debug ./trema run -v ./src/examples/learning_switch/learning-switch.rb

sudo /usr/share/axsh/ovs-switch/bin/ovs-vsctl set-controller br0 tcp:127.0.0.1

Configure dcmgr
===============

# wakame-vdc/dcmgr/config/hva.conf

config.enable_ebtables = false
config.enable_iptables = false
config.enable_openflow = true

# Directory used by Open vSwitch daemon for run files
config.ovs_run_dir = '/usr/var/run/openvswitch'

# Path for ovs-ofctl
config.ovs_ofctl_path = '/usr/bin/ovs-ofctl'

# Trema base directory
config.trema_dir = '/home/demo/trema'

# Clear the flows and add default one in order to ensure we can
# connect even if there's some bad flows cached.
ovs-ofctl del-flows br0 &amp;&amp; ovs-ofctl add-flow br0 priority=0,action=normal

# To disable use of in-band communication with controller, execute;
ovs-vsctl set bridge br0 other_config:disable-in-band=true

# Tell the switch where to connect to the controller.
ovs-vsctl set-controller br0 unix:$OVS_PREFIX/ovs/var/run/openvswitch/br0.controller

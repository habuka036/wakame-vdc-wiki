# Security Groups

Security Groups make up Wakame-vdc's dynamic firewall. By putting instances in groups, you can create a firewall that dynamically updates as the virtual datacenter changes. That basically means that when new instances are started, they will automatically be taken into account by the firewall.

### Contents

* [Features](#Features)

### Features

Security groups come with three distinct features.

* Isolation
* Rules
* Reference

**Remark:** Technically we don't put instances in security groups. We put their virtual network interfaces (vnics) in security groups. An instance with multiple vnics is able to have different security groups for each vnic.

#### Isolation

By default all instances are isolated from each other. That means that all L2 traffic including ARP and IPv4 between them is blocked.

Why do we block ARP? Because Wakame-vdc supports multi-tenancy. Imagine two users managing their own instances on the same Wakame-vdc installation. In reality those instances are probably started in the same network. We don't want user A's instances to be able to see user B's instances and vice versa. That would be an obvious security issue. That is why all ARP is blocked in addition to IPv4.

By putting two vnics in the same Security Group, they will get **full ARP and IPv4 access** to each other.

The following image shows a couple of instances with vnics in different security groups and isolation between them works.

[[security-groups-images/isolation.png]]

#### Rules

By default all incoming traffic to instances is blocked. Security Group rules allow you to open specific tcp ports, udp ports, or icmp traffic.

The following image shows an example of a security group that opens tcp port 22 with 3 vnics in it.

[[security-groups-images/rules.png]]

##### Syntax

    <protocol>:<start-port>,<end-port>,ip4:<ip-address>

**Examples**

A rule that opens tcp port 22 for all incoming traffic.

    tcp:22,22,ip4:0.0.0.0

A rule that opens tcp ports 1024 to 2048 to all ip addresses from local network 192.168.0.0/24.

    tcp:1024,2048,ip4:192.168.0.0/24

A rule that opens udp port 53 to google's dns server located at 8.8.8.8.

    udp:53,53,ip4:8.8.8.8

A rule that allows all incoming icmp traffic (like ping).

**TODO:** Explain what the -1 means.

    icmp:-1,-1,ip4:0.0.0.0

#### Reference

A reference rule is a special type of rule. Instead of opening up a port to an ip range, you can open up a port to another security group. Take the following example.

Imagine you have a database server instance and a bunch of other instances that run database clients. You could put them all in one security group together. The clients would get access to the server but they'd have full access rather than just the port that the database server is listening on. You could put the database server in one security group and add a rule for each client instance that opens just the database port. This time the instances don't have unneeded full access but you will have to go add a new rule manually every time a new client instance is started. Neither solutions are ideal.

This is where reference comes in. Reference allows you to put the database server in one security group and all clients together in another. You can add a *reference rule* to the server's group that will open only the listening database port **to all vnics in the clients' group**. When vnics are added to or removed from the clients' group, the firewall is updated automatically to take them into account.

[[security-groups-images/reference.png]]

##### Syntax

The instances is the same as regular rules, except you write another security group's uuid insetad of an IP address.

**Example**

The database rule described above would look like this:

For this example two security groups exist. *sg-dbsrv* which has the database server in it and sg-dbclnts which has the clients in it. *sg-dbsrv* would contain the following rule that opens MySQL's listening port 3306 to all vnics in the client group.

    tcp:3306,3306,sg-dbclnts

### Creating security groups through the Wakame-vdc GUI

After logging into the GUI, click on `Security Groups` in the menu on the left. Next click on `Create Security Group`.

[[/en/usage_guide/basics_images/06_security_groups_create.png]]

The following dialog will pop up. In here you will be able to write rules for your security group.

[[/en/usage_guide/basics_images/07_security_groups_dialog.png]]

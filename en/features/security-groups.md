# Security Groups

Security Groups make up Wakame-vdc's dynamic firewall. By putting instances in groups, you can create a firewall that dynamically updates as the virtual datacenter changes. That basically means that when new instances are started, they will automatically be taken into account by the firewall.

### Features

Security groups come with three distinct features.

* Isolation
* Rules
* Reference

#### Isolation

By default all instances are isolated from each other. That means that all L2 traffic including ARP and IPv4 between them is blocked.

Why do we block ARP? Because Wakame-vdc supports multi-tenancy. Imagine two users managing their own instances on the same Wakame-vdc installation. In reality those instances are probably started in the same network. We don't want user A's instances to be able to see user B's instances and vice versa. That would be an obvious security issue. That is why all ARP is blocked in addition to IPv4.

By putting two instances in the same Security Group, they will get ***full*** ARP and IPv4 access to each other.

<iframe src="//www.slideshare.net/slideshow/embed_code/39685141?startSlide=12" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/axshco/wug-005-building-dynamic-firewalls-using-security-groups" title="WUG #005 - Building dynamic firewalls using Security Groups" target="_blank">WUG #005 - Building dynamic firewalls using Security Groups</a> </strong> from <strong><a href="http://www.slideshare.net/axshco" target="_blank">Axsh Co. LTD</a></strong> </div>

#### Rules

By default all incoming traffic to instances is blocked. Security Group rules allow you to open specific tcp ports, udp ports, or icmp traffic. Jump to ahead to Security Group rule syntax to learn more about rules.

#### Reference

A reference rule is a special type of rule. Instead of opening up a port to an ip range, you can open up a port to another security group. Take the following example.

Imagine you have a database server instance and a bunch of other instances that run database clients. You could put them all in one security group together. The clients would get access to the server but they'd have full access rather than just the port that the database server is listening on. You could put the database server in one security group and add a rule for each client instance that opens just the database port. This time the instances don't have unneeded full access but you will have to go add a new rule manually every time a new client instance is started. Neither solutions are ideal.

This is where reference comes in. Reference allows you to put the database server in one security group and all clients together in another. You can add a *reference rule* to the server's group that will open only the listening database port **to all vnics in the clients' group**. When vnics are added to or removed from the clients' group, the firewall is updated automatically to take them into account.

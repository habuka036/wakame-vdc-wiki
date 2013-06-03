# Netfilter redesign

## Summary

A fundamental problem with the previous implementation is the dynamic subscription to several amqp queues. It could happen that security groups were changed around faster than service netfilter could subscribe to their queues. This resulted in a broken firewall.

I would like to make the new service netfilter as dumb as possible. Changing security groups should be handled in collector and only there. Collector should then compile a bunch of firewall tasks and send those to service netfilter. Finally service netfilter will convert those tasks to iptables and ebtables commands which are then applied. The tasks should be sufficiently abstract so the exact same tasks can be sent to a another firewall service (such as openflow) instead.

## Service netfilter amqp queues

I imagine there should be only 2 queues to subscribe to for chaning rules

* :host_id/apply_tasks Tasks[]
* :host_id/remove_tasks Tasks[]

There should also be a 2 queues for creating and destroying vnics. These will create and remove the necessary chains. I imagine the vnic created part will come with tasks since the set of Tasks to build will differ depending on security groups and network mode.

* :host_id/vnic_created Tasks[]
* :host_id/vnic_destroyed uuid

There will be no more dynamic subscription. Service netfilter will constantly be subscribed to these 4 queues.

## No cache

There will be no more cache. Since Collector is deciding what tasks to apply, service netfilter no longer needs to be aware of what vnics it has or what security groups they are in. Service netfilter will only apply tasks. It will not question why.

## Tasks

I want to keep the tasks that are in https://github.com/axsh/wakame-vdc/tree/master/dcmgr/lib/dcmgr/vnet/tasks. I just want to change the rules in them to a more abstract format. The idea is that the same tasks can be used for any firewall implementation. I imagine the format being something like this.

```
{:vnic => "vif-xxxxxxxx", :layer => 2, :protocol => "arp", :direction => "incoming", :destination => "not 2a:8a:df:ec:18:13", :action => "drop"}
{:vnic => "vif-xxxxxxxx", :layer => 3, :protocol => "tcp", :direction => "incoming", :source => "192.168.2.22", :d_port => 22, :action => "accept"}
```

The rules should also be able to define anti spoofing to the host and such. I will write the exact format specification later.

----
Currently, hva local iptable/ebtable rule management system has several weak points:

* Work with OS wide iptable rules. i.e. Rules form /etc/sysconfig/iptables.
* Packet block action can be choosable. DROP or REJECT.
* Differential update causes rule's inconsistency when it got install/uninstall times failed.

My idea is that iptable/ebtable rules should be flushed at every rule update. This makes the operation simpler because the task system is just needed to have installing operation not to have uninstall operation. The iptables & ebtables commands can flush the rules in a particular custom chain name. It allows to install small part of rules for the flushed custom chain if the chains are sectioned in small parts and organized following the timing of rule refresh operations.

In detail, Security Group has two major sections, friends (isolation) and firewall (text rule + referencers). If friends group the 

iptables chains for inbound rules can be changed followings:

```
-A FORWARD -m physdev --physdev-out vif-kse09gd7 --physdev-is-bridged -j d_vif-kse09gd7
# Allow established packets/connections for any protocols.
-A d_vif-kse09gd7 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A d_vif-kse09gd7 -m state --state NEW -j d_vif-kse09gd7_fw
-A d_vif-kse09gd7 -m state --state NEW -j d_vif-kse09gd7_friends
-A d_vif-kse09gd7 -j DROP
# Start accept rules for NEW state connections.
## Rules from firewall part.
-A d_vif-kse09gd7_fw -s 124.215.250.100/32 -p tcp -m tcp --dport 22 -j ACCEPT # Text Rule
-A d_vif-kse09gd7_fw -p icmp -j ACCEPT                                    # Text Rule
-A d_vif-kse09gd7_fw -s 10.112.9.35/32 -p tcp -m tcp --dport 22 -j ACCEPT # Referencer
-A d_vif-kse09gd7_fw -s 10.112.9.42/32 -p tcp -m tcp --dport 22 -j ACCEPT # Referencer
-A d_vif-kse09gd7_fw -j RETURN
## Rules for friend part.
-A d_vif-kse09gd7_friends -s 10.112.9.81/32 -j ACCEPT
-A d_vif-kse09gd7_friends -s 10.112.9.80/32 -j ACCEPT
-A d_vif-kse09gd7_friends -j RETURN
```

For updating friends rule (10.112.9.80/32 is removed from the group):

```
iptables -F d_vif-kse09gd7_friends
iptables -A d_vif-kse09gd7_friends -s 10.112.9.81/32 -j ACCEPT
iptables -A d_vif-kse09gd7_friends -j RETURN
```


## The collector

As I said in the summary, collector will be in full control of security group related operations. When a change in security groups occurs, the api shouldn't modify the database directly. It should rather send a request to the collector that will then in turn send commands to netfilter. Here's an example.

1.  vif-xxx is in sg-aaa and sg-bbb
2.  A request is sent to the webapi to remove sg-aaa and sg-bbb from vif-xxx and assign sg-ccc instead.
3.  Webapi sends a request to collector to make it happen.

4.  collector reads the database and compiles a list of all of vif-xxx's "friend" vnics in sg-aaa and sg-bbb and their host nodes.
5.  collector sends remove_tasks to all host nodes containing vif-xxx's "friend" vnics to remove their isolation rules related to vif-xxx.
6.  collector sends remove_tasks to vif-xxx's host node to remove its isolation rules and the rules that were in sg-aaa and sg-bbb.

7.  collector updates the security group settings in the database.

8.  collector compiles a new list of vif-xxx's friends and their host nodes based on the updated information in the database.
9.  collector sends apply_tasks to all host nodes containing vif-xxx's new friends to apply their isolation rules related to vif-xxx.
10. collector send apply_tasks to vif-xxx's host node to add its new isolation rules and the user defined rules in sg-ccc.
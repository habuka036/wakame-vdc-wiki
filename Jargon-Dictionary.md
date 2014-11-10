# Jargon Dictionary

## A
## B
## C
## D
## E

### Endpoint

The logical endpoint of separate protocol traffic of a specific protocol layer. 

## F
## G

See [WebUI|#WebUI].

## H

### HVA

The HVA (HyperVisor Agent) is the part of Wakame-vdc that actually starts instances. On a production environment, you would likely have several dedicated bare metal hosts for this.

## I

### Instance

The virtual machine managed by wakame-vdc.

## J
## K
## L
## M
## N
## O
## P
## Q
## R
## S

### Security Group

Wakame-vdc's dynamically updating firewall. You can put [vnics|vnic] into groups that determine which network traffic is blocked and which is accepted. These firewalls are updated dynamically as the layout of the virtual data center changes. Read the [security groups guide](en/features/security-groups) for more details.

## T
## U
## V

### Vnic / Vif

A virtual network interface. Basically an instance's network card is referred to as a vnic or vif.

## W

### WebAPI

This is Wakame-vdc's user interface. You tell Wakame-vdc to do stuff by making http requests to this API.

### WebUI

Wakame-vdc's GUI. It's actually a Rails application that sits in front of the [WebAPI|#WebAPI].

## X
## Y
## Z

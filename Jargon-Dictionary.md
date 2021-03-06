# Jargon Dictionary

## A
## B

### Backup Storage

Backup storage is a means of storing [[backup objects|Jargon-Dictionary#Backup-Object]]. Backup objects can be stored on a local file system, served through http or using [Indelible FS](http://www.igeekinc.com/indeliblefs/en/indeliblefs.html) (experimental).

### Backup Object

A backup object is basically a hard drive image. Backup objects that hold bootable partitions are called [[machine images|Jargon-Dictionary#Machine-Image]].

## C

### Collector

The collector is one of Wakame-vdc's processes. It's in charge of making [[scheduling decisions|Jargon-Dictionary#Scheduling]] and database access.

## D
## E

### Endpoint

An endpoint is a single part of the [[WebAPI|Jargon-Dictionary#WebAPI]] that the user can call to control Wakame-vdc. For example `GET http://<webapi ip>:<webapi port>/api/instances` is an endpoint. `POST http://<webapi ip>:<webapi port>/api/images` is another endpoint and so on.

## F
## G

### GUI

See [[WebUI|Jargon-Dictionary#WebUI]].

## H

### Host/Host Node

See [[HVA|Jargon-Dictionary#HVA]].

### HVA

The HVA (HyperVisor Agent) is the part of Wakame-vdc that actually starts [[instances|Jargon-Dictionary#Instance]]. On a production environment, you would likely have several dedicated bare metal hosts for this.

Also known as host or host node.

## I

### Instance

A virtual machine managed by wakame-vdc.

## J
## K
## L
## M

### Machine Image

A [[backup object|Jargon-Dictionary#Backup Object]] that holds a bootable partition. You are able to start [[instances|Jargon-Dictionary#Instance]] of machine images.

### Meta-data

In Wakame-vdc's context, meta-data usually refers to information that is passed to [[instances|Jargon-Dictionary#Instance]] when they start. It includes for example the instance's IP addresses, network host name and thrusted public keys. Meta-data is usually delivered as files on an extra (tiny) hard drive.

## N

### NATbox

The NATbox is an optional Wakame-vdc node that provides one to one [network address translation](http://en.wikipedia.org/wiki/Network_address_translation) for [[instances|Jargon-Dictionary#Instance]].

### Node

Refers to a server that a Wakame-vdc process runs on. Can be physical or a VM but not an [[instance|Jargon-Dictionary#Instance]].

## O
## P
## Q
## R
## S

### Scheduling

The decision making process when starting a new instance. Deciding things like the network to join, the MAC and IP address to be assigned, which [[HVA|Jargon-Dictionary#HVA]] to use, etc. are referred to as scheduling. Scheduling takes place in Wakame-vdc's [[collector|Jargon-Dictionary#Collector]].

### Security Group

Wakame-vdc's dynamically updating firewall. You can put [[vnics|Jargon-Dictionary#Vnic-/-Vif]] into groups that determine which network traffic is blocked and which is accepted. These firewalls are updated dynamically as the layout of the virtual data center changes. Read the [[security groups guide|security-groups]] for more details.

## T
## U

### User data

User data is an arbitrary field that users can set when starting an [[instance|Jargon-Dictionary#Instance]]. The user data will be delivered along with [[meta-data|Jargon-Dictionary#Meta-data]] and will thus be accessible from inside the instance. For example users can create [[custom images|custom-images]] with scripts in them that react to user data.

## V

### Vnic / Vif

Stands for Virtual Network Interface Card or Virtual Interface. In either case, the term refers to an [[instance's|Jargon-Dictionary#Instance]] simulated network card.

## W

### WebAPI

This is Wakame-vdc's user interface. You tell Wakame-vdc to do stuff by making http requests to this API.

### WebUI

Wakame-vdc's GUI. It's actually a Rails application that sits in front of the [[WebAPI|Jargon-Dictionary#WebAPI]].

## X
## Y
## Z

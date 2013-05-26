**Register a new storage node**
-------------------------------

SYNOPSIS  
vdc-manage storage add *NODE\_ID* [options] --base-path=BASE\_PATH
--disk-space=N --ipaddr=IPADDR --snapshot-base-path=SNAPSHOT\_BASE\_PATH

DESCRIPTION  
Register a new storage node by *NODE\_ID*.

It's necessary that prefix is 'sta-' or 'sta.'.

In addition, the string after the prefix will be within 80
characters.(any string)

'--base-path', '--disk-space', '--ipaddr' and '--snapshot-base-path'
options are required.

OPTIONS  
--base-path=BASE\_PATH


Base path to store volume files. required.

--disk-space=N


Amount of disk size to be exported (in MB). required.

--ipaddr=IPADDR


IP address of transport target. required.

--snapshot-base-path=SNAPSHOT\_BASE\_PATH


Base path to store snapshot files. required.

--account-id=ACCOUNT\_ID


The account ID to own this. Default: a-shpoolxx

--transport-type=TRANSPORT\_TYPE


Transport type [iscsi]. Default: iscsi

--uuid=UUID


The uuid for the new storage node. It's necessary that prefix is 'sn-'.

--storage-type=STORAGE\_TYPE


Storage type [zfs, raw]. Default: zfs

--force


Force new entry creation.

**Deregister a storage node**
-----------------------------

SYNOPSIS  
vdc-manage storage del *UUID*

DESCRIPTION  
Unregister a storage node specified by *UUID*.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage storage help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del, help,
modify, show, shownodes].

If omitted, returns the simple use of all of the subcommands.

**Show list of STA storage nodes**
----------------------------------

SYNOPSIS  
vdc-manage storage show [*UUID*]

DESCRIPTION  
Show list of STA strage nodes and details.

*UUID* is UUID of the target storage node.

If *UUID* is specified, returns the details of the storage node.

If omitted, returns the list of the STA storage nodes.

**Show list of nodes (agents)**
-------------------------------

SYNOPSIS  
vdc-manage storage shownodes

DESCRIPTION  
Show list of agent nodes not the node of STA.



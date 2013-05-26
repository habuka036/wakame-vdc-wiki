**Register a new instance spec**
--------------------------------

SYNOPSIS  
vdc-manage spec add [options] --account-id=ACCOUNT\_ID

DESCRIPTION  
Register a new instance spec.

'--account-id' option is required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this machine spec belongs to. required.

--cpu-cores=N


The initial cpu cores for the new instance. Default: 1

--memory-size=N


The size of memory for the new instance (in MB). Default: 1024

--arch=ARCH


The CPU architecture type for the new instance, [x86, x86\_64]. Default:
x86\_64

--hypervisor=HYPERVISOR


The hypervisor name for the new instance, [kvm, lxc]. Default: kvm

--uuid=UUID


The UUID for the new instance spec. It's necessary that prefix is 'is-'.

In addition, the string after the prefix will be within 8
characters.(any string)

--quota-weight=N


The cost weight factor for the new instance. Default: 1.0

**Add drive to instance spec**
------------------------------

SYNOPSIS  
vdc-manage spec adddrive *UUID* *TYPE* *NAME*

DESCRIPTION  
Add drive to instance spec specified by *UUID*.

*TYPE* is device type, [local, volume], and *NAME* is device name of any
string.

OPTIONS  
--size=N


Size of the drive(MB). Default: 100

--index=N


The index value for the interface. (\>=0)

**Add interface**
-----------------

SYNOPSIS  
vdc-manage spec addvif *UUID* *NAME*

DESCRIPTION  
Add interface to instance spec specified by *UUID*.

*NAME* is the interface name of any string.

OPTIONS  
--bandwidth=N


The bandwidth (kbps) of the interface. Default: 100000

--index=N


The index value for the interface. (\>=0)

**Delete registered instance spec**
-----------------------------------

SYNOPSIS  
vdc-manage spec del *UUID*

DESCRIPTION  
To unregister the instance spec specified by *UUID*.

**Delete drive**
----------------

SYNOPSIS  
vdc-manage deldrive *UUID* *NAME*

DESCRIPTION  
Delete the device specified by *NAME* from instance spec specified by
*UUID*.

**Delete interfance**
---------------------

SYNOPSIS  
vdc-manage delvif *UUID* *NAME*

DESCRIPTION  
Delete the interface specified by *NAME* from instance spec specified by
*UUID*.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage spec help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, adddrive,
addvif, del, deldrive, delvif, modify, modifydrive, modifyvif, help,
show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing instance spec**
------------------------------------

SYNOPSIS  
vdc-manage spec modify *UUID* [options]

DESCRIPTION  
Modify a registered instance spec specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--cpu-cores=N


The initial cpu cores for the new instance.

--memory-size=N]


The memory size for the instance.

--account-id=ACCOUNT\_ID


The UUID of the account that this instance spec belongs to.

--quota-weight=N


The cost weight factor for the instance.

--arch=ARCH]


The architecture for the instance. [x86, x86\_64].

--hypervisor=HYPERVISOR


The hypervisor type for the instance. [kvm, lxc].

**Modify drive parameters**
---------------------------

SYNOPSIS  
vdc-manage spec modifydrive *UUID* *NAME* [options]

DESCRIPTION  
Modify a drive parameters of registered instance spec specified by
*UUID*.

*NAME* is naem of target drive.

OPTIONS  
--snapshot-id=SNAPSHOT\_ID


Snapshot ID to copy the content for new drive. Only for.

--size=N


Size of the drive (MB).

--index=N


The index value for the interface.

**Modify interfance parameters**
--------------------------------

SYNOPSIS  
vdc-manage spec modifyvif *UUID* *NAME* [options]

DESCRIPTION  
Modify a interface parameters of registered instance spec specified by
*UUID*.

*NAME* is naem of target interface.

OPTIONS  
--bandwidth=N


The bandwidth (kbps) of the interface.

--index=N


The index value for the interface.

**Show list of instance specs**
-------------------------------

SYNOPSIS  
vdc-manage spec show [*UUID*]

DESCRIPTION  
Show list of instance specs and details.

*UUID* is UUID of the target instance spec.

If *UUID* is specified, returns the details of the instance spec.

If omitted, returns the list of the instance specs.



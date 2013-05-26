**Create a new vlan lease**
---------------------------

SYNOPSIS  
vdc-manage vlan add [options]

DESCRIPTION  
Create a new vlan lease'.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this machine image belongs to.

--tag-id=N


The ethernet tag for this vlan lease.

--uuid=UUID


The UUID for the new vlan lease. It's necessary that prefix is 'vlan-'.

In addition, the string after the prefix will be within 255
characters.(any string)

**Delete an existing vlan lease**
---------------------------------

SYNOPSIS  
vdc-manage vlan del *UUID*

DESCRIPTION  
Delete a vlan lease specified by *UUID*. *UUID* is the UUID of the vlan
lease.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage vlan help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del, help,
modify, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing vlan lease**
---------------------------------

SYNOPSIS  
vdc-manage vlan modify *UUID* [options]

DESCRIPTION  
Modify an existing vlan lease specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this tag belongs to.

--tag-id=N


The ethernet tag for this vlan lease.

**Show list of vlan leases**
----------------------------

SYNOPSIS  
vdc-manage vlan show [*UUID*]

DESCRIPTION  
Show list of vlan leases and details.

*UUID* is UUID of the target vlan lease.

If *UUID* is specified, returns the details of the vlan lease.

If omitted, returns the list of the vlan leases.



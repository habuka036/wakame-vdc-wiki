**Add a new security group**
----------------------------

SYNOPSIS  
vdc-manage securitygroup add [options] --account-id=ACCOUNT\_ID

DESCRIPTION  
Add a new security group of account specified by '--acount-id' option.

'--account-id' option is required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this security group belongs to. required.

--description=DESCRIPTION


The description for this new security group.

--uuid=UUID


The UUID for the new security group. It's necessary that prefix is
'sg-'.

In addition, the string after the prefix will be within 255
characters.(any string)

--rule=RULE


Path to the rule text file. ("-" is from STDIN)

**Apply a security group to an instance**
-----------------------------------------

SYNOPSIS  
vdc-manage securitygroup apply *UUID* [options] --instance=INSTANCE

DESCRIPTION  
Apply a security group to an instance specified by '--instance' option.

'--instance' option is required.

OPTIONS  
--instance=INSTANCE


The UUID of instance to apply the group to. required.

**Delete a security group**
---------------------------

SYNOPSIS  
vdc-manage securitygroup del *UUID*

DESCRIPTION  
Delete a security group specified by *UUID*.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage securitygroup help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, apply,
del, help, modify, remove, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing security group**
-------------------------------------

SYNOPSIS  
vdc-manage securitygroup modify *UUID* [options]

DESCRIPTION  
Modify a registered security group specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this key pair belongs to.

--description=DESCRIPTION


The description for this new security group.

--rule=RULE


Path to the rule text file. ("-" is from STDIN)

**Remove a security group from an instance**
--------------------------------------------

SYNOPSIS  
vdc-manage securitygroup remove *UUID* [options] --instance=INSTANCE

DESCRIPTION  
Remove a security group from an instance specified by '--instance'
option.

'--instance' option is required.

OPTIONS  
--instance=INSTANCE


The UUID of instance to remove the group from. required.

**Show list of security groups**
--------------------------------

SYNOPSIS  
vdc-manage securitygroup show [*UUID*]

DESCRIPTION  
Show list of security groups and details.

*UUID* is UUID of the target security group.

If *UUID* is specified, returns the details of the security group.

If omitted, returns the list of the security groups.



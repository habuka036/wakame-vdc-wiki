**Register a new key pair**
---------------------------

SYNOPSIS  
vdc-manage keypair add [options] --account-id=ACCOUNT\_ID
--public-key=PUBLIC\_KEY

DESCRIPTION  
Register a new key pair.

'--account-id' and '--public-key' options are required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this key pair belongs to. required.

--public-key=PUBLIC\_KEY


The path to the public key. required.

--uuid=UUID


The UUID for the new key pair. It's necessary that prefix is 'ssh-'.

In addition, the string after the prefix will be within 255
characters.(any string)

--privatekey=PRIVATE\_KEY


The path to the private key.

**Delete registered key pair**
------------------------------

SYNOPSIS  
vdc-manage keypair del *UUID*

DESCRIPTION  
To unregister the key pair specified by *UUID*.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage keypair help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del, help,
modify, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing key pair**
-------------------------------

SYNOPSIS  
vdc-manage keypair modify *UUID* [options]

DESCRIPTION  
Modify a registered key pair specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this key pair belongs to.

**Show list of key pairs**
--------------------------

SYNOPSIS  
vdc-manage keypair show [*UUID*]

DESCRIPTION  
Show list of key pairs and details.

*UUID* is UUID of the target key pair.

If *UUID* is specified, returns the details of the key pair.

If omitted, returns the list of the key pairs.



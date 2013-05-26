**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage quota help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [ help, modify,
show].

If omitted, returns the simple use of all of the subcommands.

**Modify the quota settings for an account**
--------------------------------------------

SYNOPSIS  
vdc-manage quota modify *ACCOUNT\_UUID* [options]

DESCRIPTION  
Modify the quota settings for an account specified by *ACCOUNT\_UUID*.

The updated value of the options specified.

OPTIONS  
--weight=N


The instance total weight for this account's quota. This weight value is
specified as maximum number of total of quota weight which is defined in
[instance
specification](Operations_for_instance_specifications "wikilink").

--size=N


The volume total size for this account's quota.

**Show the quota settings for an account**
------------------------------------------

SYNOPSIS  
vdc-manage quota show *ACCOUNT\_UUID*

DESCRIPTION  
Show the quota settings for an account specified by *ACCOUNT\_UUID*.



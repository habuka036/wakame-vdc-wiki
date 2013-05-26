**Create a new tag**
--------------------

SYNOPSIS  
vdc-manage tag add [options] --account-id=ACCOUNT\_ID --name=NAME
--type-id=N

DESCRIPTION  
Create a new tag.

'--account-id', '--name' and '--type-id' options are required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this machine image belongs to. required.

--name=NAME


The name for the new tag. required.

--type-id=N


The type for the new tag. Valid types are '11, 12, 10'. required.

--attributes=ATTRIBUTES


The attributes for the new tag.

--uuid=UUID


The UUID for the new tag. It's necessary that prefix is 'tag-'.

In addition, the string after the prefix will be within 255
characters.(any string)

**Delete an existing tag**
--------------------------

SYNOPSIS  
vdc-manage tag del *UUID*

DESCRIPTION  
Delete a tag specified by *UUID*. *UUID* is the UUID of the tag.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage tag help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, del, help,
map, modify, show].

If omitted, returns the simple use of all of the subcommands.

**Map a tag to a taggable object**
----------------------------------

SYNOPSIS  
vdc-manage tag map *UUID* *OBJECT\_UUID*

DESCRIPTION  
Map a tag to a taggable object.

*UUID* is the canonical UUID of the tag.

*OBJECT\_UUID* is the canonical UUID represents the object to label this
tag.

**Modify an existing tag**
--------------------------

SYNOPSIS  
vdc-manage tag modify *UUID* [options]

DESCRIPTION  
Modify an existing tag specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this tag belongs to.

--attributes=ATTRIBUTES


The attributes for the new tag.

--type-id=N


The type for the new tag. Valid types are '11, 12, 10'.

--name=NAME


The name for the new tag.

**Show list of tags**
---------------------

SYNOPSIS  
vdc-manage tag show [*UUID*]

DESCRIPTION  
Show list of tags and details.

*UUID* is UUID of the target tag.

If *UUID* is specified, returns the details of the tag.

If omitted, returns the list of the tags.



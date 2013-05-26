**Create a new account**
------------------------

SYNOPSIS  
gui-manage account add [options] --name=NAME

DESCRIPTION  
Create a new account specified by '--name' option.

'--name' option is required.

OPTIONS  
--name=NAME


The name for the new account.

--description=DESCRIPTION


The description for the new account.

--uuid=UUID


The UUID for the new account. It's necessary that prefix is 'a-'.

In addition, the string after the prefix will be within 255
characters.(any string)

*' Associate an account with a user*'
-------------------------------------

SYNOPSIS  
gui-manage account associate *UUID* [options] --users=one two three ...

DESCRIPTION  
Associate an account with a user or multiple users specified by
'--users' option.

'--users' option is required.

OPTIONS  
--users=one two three ...


The uuid of the users to associate with the account. required.

Any non-existing uuid will be ignored.

--verbose


Print feedback on what is happening.

**Deletes an existing account**
-------------------------------

SYNOPSIS  
gui-manage account del *UUID* [options]

DESCRIPTION  
Deletes an existing account specified by *UUID*.

OPTIONS  
--verbose


Print feedback on what is happening.

**Disable an account**
----------------------

SYNOPSIS  
gui-manage account disable *UUID* [options]

DESCRIPTION  
Disable an account specified by *UUID*.

OPTIONS  
--verbose


Print feedback on what is happening.

**Dissociate an account from a user**
-------------------------------------

SYNOPSIS  
gui-manage account dissocate *UUID* [options] --users=one two three ...

DESCRIPTION  
Dissociate an account from a user or multiple users specified by
'--users' option.

'--users' option is required.

OPTIONS  
--users=one two three ...


The uuid of the users to dissociate from the account. required.

Any non-existing or non numeral id will be ignored.

--verbose


Print feedback on what is happening.

**Enable an account**
---------------------

SYNOPSIS  
gui-manage account enable *UUID* [options]

DESCRIPTION  
Enable an account specified by *UUID*.

OPTIONS  
--verbose


Print feedback on what is happening.

**Describe subcommands**
------------------------

SYNOPSIS  
gui-manage account help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, associate,
del, disable, dissociate, enable, help, modify, oauth, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing account**
------------------------------

SYNOPSIS  
gui-manage account modify *UUID* [options]

DESCRIPTION  
Modify a registered account specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--name=NAME


The name for the account.

--description=DESCRIPTION


The description for the account.

**Generate or show OAuth key and secret**
-----------------------------------------

SYNOPSIS  
gui-manage account oauth *UUID*

DESCRIPTION  
Generate or show OAuth key and secret specified by *UUID*.

**Show list of accounts**
-------------------------

SYNOPSIS  
gui-manage account show [*UUID*]

DESCRIPTION  
Show list of accounts and details.

*UUID* is UUID of the target account.

If *UUID* is specified, returns the details of the account.

If omitted, returns the list of the accounts.

OPTIONS  
--deleted


Show deleted accounts.



**Create a new user**
---------------------

SYNOPSIS  
gui-manage user add [options] --name=NAME --password=PASSWORD

DESCRIPTION  
Create a new user specified by '--name' option.

'--name' annd '--password' options are required.

OPTIONS  
--name=NAME


The name for the new user. required.

--password=PASSWORD


The password for the new user. required.

--primary-account-id=PRIMARY\_ACCOUNT\_ID


The primary account to associate this user with.

--login-id=LOGIN\_ID


The login\_id for the new user.

--uuid=UUID


The UUID for the new user. It's necessary that prefix is 'u-'.

In addition, the string after the prefix will be within 255
characters.(any string)

**Associate a user with accounts**
----------------------------------

SYNOPSIS  
gui-manage account associate *UUID* [options] --account-ids=one two
three ...

DESCRIPTION  
Associate a user with one or multiple accounts specified by
'--account-ids' option.

'--users' option is required.

OPTIONS  
--account-ids=one two three ...


The id of the acounts to associate these user with. required.

Any non-existing or non numeral id will be ignored.

--verbose


Print feedback on what is happening.

**Deletes an existing user**
----------------------------

SYNOPSIS  
gui-manage user del *UUID* [options]

DESCRIPTION  
Deletes an existing user specified by *UUID*.

OPTIONS  
--verbose


Print feedback on what is happening.

**Dissociate a user from accounts**
-----------------------------------

SYNOPSIS  
gui-manage user dissocate *UUID* [options] --account-ids=one two three
...

DESCRIPTION  
Dissociate a user from one or multiple accounts specified by
'--account-ids' option.

'--account-ids' option is required.

OPTIONS  
--account-ids=one two three ...


The id of the acounts to dissociate these user from. required.

Any non-existing or non numeral id will be ignored.

--verbose


Print feedback on what is happening.

**Describe subcommands**
------------------------

SYNOPSIS  
gui-manage user help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [add, associate,
del, dissociate, help, modify, primacc, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing account**
------------------------------

SYNOPSIS  
gui-manage user modify *UUID* [options]

DESCRIPTION  
Modify a registered user specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--password=PASSWORD


The new password for the user.

--login-id=LOGIN\_ID


The new login\_id for the user.

--name=NAME


The new name for the user.

**Set or get the primary account for a user**
---------------------------------------------

SYNOPSIS  
gui-manage user primacc *UUID* [options]

DESCRIPTION  
Set or get the primary account for a user specified by *UUID*.

OPTIONS  
--account\_id=ACCOUNT\_ID


The id of the new primary account.

**Show list of userss**
-----------------------

SYNOPSIS  
gui-manage user show [*UUID*]

DESCRIPTION  
Show list of users and details.

*UUID* is UUID of the target user.

If *UUID* is specified, returns the details of the user.

If omitted, returns the list of the users.



**Describe subcommands for 'add**'
----------------------------------

SYNOPSIS  
vdc-manage image add help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand for 'add'.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [local, volume].

If omitted, returns the simple use of all of the subcommands.

**Register a local store machine image**
----------------------------------------

SYNOPSIS  
vdc-manage image add local *IMAGE\_LOCATION* [options]
--account-id=ACCOUNT\_ID --md5sum=MD5SUM

DESCRIPTION  
Register a local store machine image. Path of machine image is given by
*IMAGE\_LOCATION*.

'--account-id' option is required.

'--md5sum' option is required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this machine image belongs to. required.

--md5sum=MD5SUM


The md5 checksum of image you are registering. required.

--arch=ARCH


The architecture for the new machine image, [x86, x86\_64]. Default :
x86\_64

--is-public


A flag that determines whether the new machine image is public or not.

--description=DESCRIPTION


An arbitrary description of the new machine image.

--uuid=UUID


The UUID for the new key pair. It's necessary that prefix is 'wmi-'.

In addition, the string after the prefix will be within 255
characters.(any string)

**Register a volume store machine image**
-----------------------------------------

SYNOPSIS  
vdc-manage image add volume *SNAPSHOT\_ID* [options]
--account-id=ACCOUNT\_ID --md5sum=MD5SUM

DESCRIPTION  
Register a volume store machine image. *SNAPSHOT\_ID* is the UUID of the
volume snapshot.

'--account-id' option is required.

'--md5sum' option is required.

OPTIONS  
--account-id=ACCOUNT\_ID


The UUID of the account that this machine image belongs to. required.

--md5sum=MD5SUM


The md5 checksum of image you are registering. required.

--arch=ARCH


The architecture for the new machine image, [x86, x86\_64]. Default :
x86\_64

--is-public


A flag that determines whether the new machine image is public or not.

--description=DESCRIPTION


An arbitrary description of the new machine image.

--uuid=UUID


The UUID for the new key pair. It's necessary that prefix is 'wmi-'.

In addition, the string after the prefix will be within 255
characters.(any string)

**Delete registered machine image**
-----------------------------------

SYNOPSIS  
vdc-manage image del *UUID*

DESCRIPTION  
Unregister the image of the specified *UUID*. *UUID* is the UUID of the
machine image.

**Set features attributes to the machine image**
------------------------------------------------

SYNOPSIS  
vdc-manage image features *UUID* [options]

DESCRIPTION  
Set features attributes to the machine image. *UUID* is the UUID of the
machine image.

OPTIONS  
--virtio


The image corresponding to Virtio.

**Describe subcommands**
------------------------

SYNOPSIS  
vdc-manage image help [*SUB\_COMMAND*]

DESCRIPTION  
Describe subcommands or one specific subcommand.

Show how to use the *SUB\_COMMAND*. *SUB\_COMMAND* are: [del, features,
help, modify, show].

If omitted, returns the simple use of all of the subcommands.

**Modify an existing machine image**
------------------------------------

SYNOPSIS  
vdc-manage image modify *UUID* [options]

DESCRIPTION  
Modify a machine image specified by *UUID*.

The updated value of the options specified.

OPTIONS  
--state=STATE


The state for the machine image.

--description=DESCRIPTION


An arbitrary description of the machine image.

**Show list of images**
-----------------------

SYNOPSIS  
vdc-manage image show [*UUID*]

DESCRIPTION  
Show list of machine images and details.

*UUID* is UUID of the target machine image.

If *UUID* is specified, returns the details of the machine image.

If omitted, returns the list of the machine images.



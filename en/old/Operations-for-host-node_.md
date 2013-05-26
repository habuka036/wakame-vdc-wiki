## Register a new host node

### SYNOPSIS
vdc-manage host add NODE_ID [options]  

### DESCRIPTION
Register a new host node by NODE_ID. 
It's necessary that prefix is 'hva-' or 'hva.'.  
In addition, the string after the prefix will be within 80 characters.(any string)  

### OPTIONS
--account-id=ACCOUNT_ID  

The account ID to own this. Default: a-shpoolxx  

--cpu-cores=N  

Number of cpu cores to be offered.Default: 1  

--memory-size=N  

Amount of memory to be offered (in MB). Default: 1024   

--arch=ARCH  

The CPU architecture type, [x86, x86_64]. Default: x86_64  

--hypervisor=HYPERVISOR  

The hypervisor name, [kvm, lxc]. Default: kvm  

--uuid=UUID  

The UUID for the new host node. It's necessary that prefix is 'hn-'.  
In addition, the string after the prefix will be within 255 characters.(any string)   

--name=NAME  

The name for the new host node.  

--force  

Force new entry creation.  

## Deregister a host node

### SYNOPSIS
vdc-manage host del UUID  

### DESCRIPTION
To unregister the host node specified by UUID.  

## Describe subcommands  

### SYNOPSIS  
vdc-manage host help [SUB_COMMAND]   

## DESCRIPTION  
Describe subcommands or one specific subcommand.  
Show how to use the SUB_COMMAND. SUB_COMMAND are:   \[add, del, help, modify, show, shownodes\].   
If omitted, returns the simple use of all of the subcommands.   

## Modify a registered host node  

### SYNOPSIS
    vdc-manage host modify UUID [options] 

DESCRIPTION
    Modify a registered host node specified by UUID. 
    The updated value of the options specified. 

OPTIONS
    --account-id=ACCOUNT_ID

        The account ID to own this. 

    --hypervisor=HYPERVISOR

        The hypervisor name, [kvm, lxc]. 

    --name=NAME

        The name for the host node. 

    --cpu-cores=N

        Number of cpu cores to be offered. 

    --memory-size=N

        Amount of memory to be offered (in MB). 

Show list of HVA host nodes

SYNOPSIS
    vdc-manage host show [UUID] 

DESCRIPTION
    Show list of HVA host nodes and details. 
    UUID is UUID of the target host node. 
    If UUID is specified, returns the details of the host node. 
    If omitted, returns the list of the HVA host nodes. 

Show list of nodes (agents)

SYNOPSIS
    vdc-manage host shownodes 

DESCRIPTION
    Show list of agent nodes not the node of HVA. 
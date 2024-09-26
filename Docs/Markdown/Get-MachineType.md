---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-MachineType

## SYNOPSIS

A quick function to determine if a computer is VM or physical box.

## SYNTAX

### __AllParameterSets

```
Get-MachineType [[-ComputerName <String[]>]] [<CommonParameters>]
```

## DESCRIPTION

This function is designed to quickly determine if a local or remote computer is a physical machine or a virtual machine.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-MachineType
```

Query if the local machine is a physical or virtual machine.





### Example 2: EXAMPLE 2

```
Get-MachineType -ComputerName SERVER01
```

Query if SERVER01 is a physical or virtual machine.





### Example 3: EXAMPLE 3

```
Get-MachineType -ComputerName DEMOLAPTOP, CORPDC1
```

ComputerName Type     Manufacturer          Model
------------ ----     ------------          -----
DEMOLAPTOP   Physical Microsoft Corporation Surface Pro 6
CORPDC1      VM       VMware, Inc.
         VMware Virtual Platform





### Example 4: EXAMPLE 4

```
Get-MachineType -ComputerName (Get-Content c:\temp\computerlist.txt)
```

Query if a list of computers are physical or virtual machines.






## PARAMETERS

### -ComputerName

ComputerName

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### PSCustomObject



## NOTES

Put in error checking around Get-CimInstance to handle Kerberos errors.


## RELATED LINKS

[] (https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9)


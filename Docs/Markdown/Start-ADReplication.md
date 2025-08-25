---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gist.github.com/Nora-Ballard/11240204
schema: 2.0.0
---

# Start-ADReplication

## SYNOPSIS
Forces replication to occur between domain controllers in domain.

## SYNTAX

```
Start-ADReplication [[-Name] <String[]>] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION
Forces replication to occur between domain controllers in domain.
Invoke-Command to a DC.
Requires to be running in elevated Powershell prompt.

## EXAMPLES

### EXAMPLE 1
```
Get-ADDomainController -Filter * | Start-ADReplication
```

Will return a list of all DCs and run the replication against that list

### EXAMPLE 2
```
Get-ADDomainController -Filter "Name -like '*CORP*'" | Start-ADReplication
```

Will return a list of all DCs that have 'CORP' in their name and run the replication against that list

### EXAMPLE 3
```
Start-ADReplication -Name DC1 -Verbose
```

Assuming there are two DCs (DC1, DC2) in the contosco.com domain here is a sample return
VERBOSE: Starting \[Start-ADReplication\]
VERBOSE: $Name is \[DC1\]
VERBOSE: Processing \[DC1\]
DC1 DC2 "DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
DC1 DC2 "CN=Configuration,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
DC1 DC2 "CN=Schema,CN=Configuration,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
DC1 DC2 "DC=DomainDnsZones,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
DC1 DC2 "DC=ForestDnsZones,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
VERBOSE: Ending \[Start-ADReplication\]

## PARAMETERS

### -Name
A string array containing the name, fqdn or ipaddress of a domain controller.
If not specified will query AD for a domain controller.
Aliased to 'DomainController', 'DC', 'CN', 'ComputerName'

Optional, defaults to $env:COMPUTERNAME

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: DomainController, DC, CN, ComputerName

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Quiet
Switch will create no output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES
* Reworked logic so it just replicates the links that are defined. Previously it ran repadmin.exe with /ApeD switch
  and it was horribly slow.
* Changed parameter $DC to $Name so that it would take input from Get-ADDomainController and to accept an array and
  added aliases to it
* Changed output so that it would remove blank or commented lines from the output and to display what is being
  replicated in the output
* Changed output so that it creates CSV output
* Added '-ThrottleLimit' to the Invoke-Command so as to not saturate the local computer. Changed value to
  \[environment\]::ProcessorCount which is the number of processors on the computer.
* Changed $Name to optional and defaulting to $env:COMPUTERNAME

## RELATED LINKS

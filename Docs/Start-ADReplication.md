---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Start-ADReplication

## SYNOPSIS
Forces replication to occur between domain controllers in domain.

## SYNTAX

```
Start-ADReplication [[-DC] <String>] [<CommonParameters>]
```

## DESCRIPTION
Forces replication to occur between domain controllers in domain.
Invoke-command to a DC.
Requires to be running in elevated Powershell prompt.

## EXAMPLES

### EXAMPLE 1
```
Start-ADReplication
```

Would return
Running command \[repadmin.exe /syncall /AdeP\] on \[dcname\]

### EXAMPLE 2
```
Start-ADReplication -Verbose
```

Would return
VERBOSE: Starting \[Start-ADReplication\]
VERBOSE: $DC is \[dcname\]
Running command \[repadmin.exe /syncall /AdeP\] on \[dcname\]
VERBOSE: Ending Start-ADReplication

## PARAMETERS

### -DC
The name, fqdn or ipaddress of a domain controller.
If not specified will query AD for a domain controller.

```yaml
Type: String
Parameter Sets: (All)
Aliases: DomainController

Required: False
Position: 1
Default value: (Get-ADDomainController).HostName
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES

## RELATED LINKS

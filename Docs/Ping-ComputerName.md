---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Ping-ComputerName

## SYNOPSIS
To test whether a particular computer is reachable on the network

## SYNTAX

```
Ping-ComputerName [-ComputerName] <String> [<CommonParameters>]
```

## DESCRIPTION
To test whether a particular computer is reachable on the network

## EXAMPLES

### EXAMPLE 1
```
Ping-ComputerName $DC
```

Assuming $DC holds the name of the domain controller and it is running then would return the boolean
$True

### EXAMPLE 2
```
Ping-ComputerName "DoesNotExist"
```

Assuming "DoesNotExist" doesn't actually exist as a computer name then would return the boolean
$False

## PARAMETERS

### -ComputerName
The name or IPv4 address of the computer you are attempting to communicate with

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### A boolean indicating if ICMP communication was successful or not

## NOTES
Author:     Bill Riedy
Version:    1.0
Date:       2018/03/13
Notes:      Ping (ICMP traffic) will be limited to within a VLAN in network baseline 4.0.
ICMP traffic will NOT cross a firewall boundary in that baseline

## RELATED LINKS

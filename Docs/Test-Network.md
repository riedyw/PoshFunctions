---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-Network

## SYNOPSIS
Wrapper function for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to give summary table of ip addresses that either resolve to a host name or respond to a ping

## SYNTAX

```
Test-Network [-Subnet] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Wrapper function for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to give summary table of ip addresses that either resolve to a host name or respond to a ping

## EXAMPLES

### EXAMPLE 1
```
'10.100.40.0/29' | Test-Network
```

IpAddress   ComputerName                Result
---------   ------------                ------
10.100.40.1 UNKNOWN                    Success
10.100.40.2 UNKNOWN                    Success
10.100.40.3 server-102094.contosco.com Success
10.100.40.4 server-101811.contosco.com Success
10.100.40.5 server-102372.contosco.com TimeOut
10.100.40.6 server-101875.contosco.com Success

## PARAMETERS

### -Subnet
A string or string array of subnets listed in CIDR format (e.g.
10.100.10.0/24).
Can either be specified with -Subnet parameter or fed from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-ArpTable

## SYNOPSIS
Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress

## SYNTAX

```
Get-ArpTable [<CommonParameters>]
```

## DESCRIPTION
Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress

## EXAMPLES

### EXAMPLE 1
```
Get-ArpTable
```

IPAddress     MACAddress
---------     ----------
192.168.3.1   a0-40-a0-5f-bf-9c
192.168.3.100 94-57-a5-7a-43-6d
192.168.3.101 00-90-a9-3f-98-ef
192.168.3.2   14-59-c0-45-ca-6a
192.168.3.6   c0-b5-d7-21-33-f1

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Displaying the arp table via 'arp.exe -a' produces very wordy output that is difficult to use.
On a computer with multiple adapters and VPNs that may or may not be active can produce a lot of output.
On my computer 'arp.exe -a' produces 74 lines of output.
In the example run from the same computer it produces
an array of 5 IPAddress/MACAddress pairs.
This is useful information that can be acted against.

## RELATED LINKS

---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ArpTable

## SYNOPSIS

Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress

## SYNTAX

### __AllParameterSets

```
Get-ArpTable [<CommonParameters>]
```

## DESCRIPTION

Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ArpTable
```

IPAddress     MACAddress
---------     ----------
192.168.3.1   A0-40-A0-5F-BF-9C
192.168.3.2   14-59-C0-45-CA-6A
192.168.3.100 94-57-A5-7A-43-6D
192.168.3.101 00-90-A9-3F-98-EF






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Displaying the arp table via 'arp.exe -a' produces very wordy output that is difficult to use.
On a computer with multiple adapters and VPNs that may or may not be active can produce a lot of output.
On my computer 'arp.exe -a' produces 74 lines of output.
In the example run from the same computer it produces
an array of 4 IPAddress/MACAddress pairs.
This is useful information that can be acted against.


## RELATED LINKS

Fill Related Links Here


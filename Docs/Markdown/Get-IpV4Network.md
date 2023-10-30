---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-IpV4Network

## SYNOPSIS

Given a subnet in CIDR format, get all of the valid IP addresses in that range.

## SYNTAX

### __AllParameterSets

```
Get-IpV4Network [-IpAddress] <IPAddress[]> [-IncludeInput] [-SubnetMask <IPAddress>] [<CommonParameters>]
```

## DESCRIPTION

Given a subnet in CIDR format, get all of the valid IP addresses in that range.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-IpRange -Subnets '192.168.1.24/30'
```

192.168.1.25
192.168.1.26





### Example 2: EXAMPLE 2

```
(Get-IpRange -Subnets '10.100.10.0/24').count
```

254





### Example 3: EXAMPLE 3

```
'192.168.1.128/30' | Get-IpRange
```

192.168.1.129
192.168.1.130






## PARAMETERS

### -IncludeInput

{{ Fill IncludeInput Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IpAddress

Please enter a subnet in the form a.b.c.d/#

```yaml
Type: IPAddress[]
Parameter Sets: (All)
Aliases: Address
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -SubnetMask

{{ Fill SubnetMask Description }}

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases: Sn
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by https://gallery.technet.microsoft.com/PowerShell-Subnet-db45ec74

* Added comment help


## RELATED LINKS

Fill Related Links Here


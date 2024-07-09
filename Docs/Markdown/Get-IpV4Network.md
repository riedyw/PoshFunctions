---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-IpV4Network

## SYNOPSIS

Determine the IPv4 network given an ip address and a subnet mask

## SYNTAX

### __AllParameterSets

```
Get-IpV4Network [-IpAddress] <IPAddress[]> [-IncludeInput] [-SubnetMask <IPAddress>] [<CommonParameters>]
```

## DESCRIPTION

Determine the IPv4 network given an ip address and a subnet mask


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-IpV4Network -IpAddress 10.10.10.200 -SubnetMask 255.255.255.128
```

10.10.10.128





### Example 2: EXAMPLE 2

```
Get-IpV4Network -IpAddress 10.10.10.200, 192.168.1.32 -SubnetMask 255.255.255.0 -IncludeInput
```

IpAddress    SubnetMask    Network
---------    ----------    -------
10.10.10.200 255.255.255.0 10.10.10.0
192.168.1.32 255.255.255.0 192.168.1.0






## PARAMETERS

### -IncludeInput

Switch to determine if you want the input as part of the output

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

An IP address (or array of addresses) that you want to determine the network of

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

An IP subnet mask.
Defaults to: '255.255.255.0'

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases: Sn
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 255.255.255.0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here


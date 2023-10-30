---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SubnetMaskIPv4

## SYNOPSIS

Gets a dotted decimal subnet mask given the number of bits in the mask

## SYNTAX

### __AllParameterSets

```
Get-SubnetMaskIPv4 [-Length] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Gets a dotted decimal subnet mask given the number of bits in the mask.
Can optionally include the number of bits.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-SubnetMaskIPv4 -Length 22 -IncludeInput
```

Length SubnetMask
------ ----------
    22 255.255.252.0





### Example 2: EXAMPLE 2

```
22..25 | Get-SubnetMaskIPv4 -IncludeInput
```

Length SubnetMask
------ ----------
    22 255.255.252.0
    23 255.255.254.0
    24 255.255.255.0
    25 255.255.255.128





### Example 3: EXAMPLE 3

```
Get-SubnetMaskIPv4 23
```

Would return:
255.255.254.0






## PARAMETERS

### -IncludeInput

A switch controlling whether you want to see the CIDR length.
Aliased to 'IncludeCIDR' for backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeCIDR
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Length

A mandatory [int] or array of [int] for which you want the subnet mask.
Can be fed from the pipeline.
Aliased to both 'NetworkLength' and 'CIDR'

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases: NetworkLength,CIDR
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [psobject]  if -IncludeInput switch specified
[string]    default



## NOTES



## RELATED LINKS

[] (https://www.Google.com)


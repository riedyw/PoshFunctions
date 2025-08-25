---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Get-SubnetMaskIPv4

## SYNOPSIS
Gets a dotted decimal subnet mask given the number of bits in the mask

## SYNTAX

### Length (Default)
```
Get-SubnetMaskIPv4 [-Length] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

### All
```
Get-SubnetMaskIPv4 [-All] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Gets a dotted decimal subnet mask given the number of bits in the mask.
Can optionally include the number of bits.

## EXAMPLES

### EXAMPLE 1
```
Get-SubnetMaskIPv4 -Length 22 -IncludeInput
```

Length SubnetMask
------ ----------
    22 255.255.252.0

### EXAMPLE 2
```
22..25 | Get-SubnetMaskIPv4 -IncludeInput
```

Length SubnetMask
------ ----------
    22 255.255.252.0
    23 255.255.254.0
    24 255.255.255.0
    25 255.255.255.128

### EXAMPLE 3
```
Get-SubnetMaskIPv4 23
```

Would return:
255.255.254.0

## PARAMETERS

### -Length
A mandatory \[int\] or array of \[int\] for which you want the subnet mask.
Can be fed from the pipeline.
Aliased to both 'NetworkLength' and 'CIDR'

```yaml
Type: Int32[]
Parameter Sets: Length
Aliases: NetworkLength, CIDR

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -All
{{ Fill All Description }}

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
A switch controlling whether you want to see the CIDR length.
Aliased to 'IncludeCIDR' for backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeCIDR

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

### [psobject]  if -IncludeInput switch specified
### [string]    default
## NOTES

## RELATED LINKS

[https://www.Google.com](https://www.Google.com)


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

```
Get-SubnetMaskIPv4 [-NetworkLength] <Int32[]> [-IncludeCIDR] [<CommonParameters>]
```

## DESCRIPTION
Gets a dotted decimal subnet mask given the number of bits in the mask.
Can optionally include the number of bits.

## EXAMPLES

### EXAMPLE 1
```
Get-SubnetMaskIPv4 -NetworkLength 22 -IncludeCIDR
```

Would return something similar to the following:
VERBOSE: $MinDate specified as \[01/01/1969 00:00:00\]
VERBOSE: $MaxDate specified as \[01/01/2040 00:00:00\]
VERBOSE: $MinDate ouside valid UnixEpoch setting to \[01/01/1970 00:00:00\]
VERBOSE: $MaxDate ouside valid UnixEpoch setting to \[01/19/2038 03:14:07\]
VERBOSE: The random date calculated is \[12/26/1997 18:41:51\]
VERBOSE: The return value is \[System.DateTime\] datatype
Friday, December 26, 1997 6:41:51 PM

### EXAMPLE 2
```
11..16 | Get-SubnetMaskIPv4 -IncludeCIDR
```

Would return:
CIDR SubnetMask
---- ----------
  11 255.224.0.0
  12 255.240.0.0
  13 255.248.0.0
  14 255.252.0.0
  15 255.254.0.0
  16 255.255.0.0

### EXAMPLE 3
```
Get-SubnetMaskIPv4 23
```

Would return:
255.255.254.0

## PARAMETERS

### -NetworkLength
A mandatory \[int\] or array of \[int\] for which you want the subnet mask.
Can be fed from the pipeline.
Aliased to both 'Length' and 'CIDR'

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases: Length, CIDR

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeCIDR
A switch controlling whether you want to see the CIDR length

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

### [psobject]  if -IncludeCIDR switch specified
### [string]    default
## NOTES
Author:     Bill Riedy

## RELATED LINKS

[https://www.Google.com](https://www.Google.com)


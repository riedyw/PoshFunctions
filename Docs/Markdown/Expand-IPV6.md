---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Expand-IPV6

## SYNOPSIS

Takes an abbreviated IPv6 string and expands it fully

## SYNTAX

### __AllParameterSets

```
Expand-IPV6 [-IPv6] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Takes an abbreviated IPv6 string and expands it fully


## EXAMPLES

### Example 1: EXAMPLE 1

```
Expand-IPV6 'fe98::726d:daad:2afc:5393%18'
```

Would return:
FE98:0000:0000:0000:726D:DAAD:2AFC:0000





### Example 2: EXAMPLE 2

```
Expand-IPV6 'fe98::726d:daad:2afc:5393'
```

Would return:
FE98:0000:0000:0000:726D:DAAD:2AFC:5393





### Example 3: EXAMPLE 3

```
Expand-IPV6 -IPv6 '::1'
```

Would return:
0000:0000:0000:0000:0000:0000:0000:0001





### Example 4: EXAMPLE 4

```
'::1', 'fe98::726d:daad:2afc:5393' | Expand-IPV6  -IncludeInput
```

OriginalIPv6              ExpandedIPv6
------------              ------------
::1                       0000:0000:0000:0000:0000:0000:0000:0001
fe98::726d:daad:2afc:5393 FE98:0000:0000:0000:726D:DAAD:2AFC:5393






## PARAMETERS

### -IncludeInput

Switch that will display the input parameter along with the result

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

### -IPv6

A string parameter that represents an IPv6 address.
Aliased to 'Address'

```yaml
Type: String[]
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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Source: https://badflyer.com/powershell-ipv4-to-ipv6/

Changes:
- added comment help
- minor formatting changes
- change IPv6 to string array
- added IncludeInput parameter


## RELATED LINKS

Fill Related Links Here


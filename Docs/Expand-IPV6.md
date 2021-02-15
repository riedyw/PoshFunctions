---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.google.com
schema: 2.0.0
---

# Expand-IPV6

## SYNOPSIS
Takes an abbreviated IPv6 string and expands it fully

## SYNTAX

```
Expand-IPV6 [-IPv6] <String> [<CommonParameters>]
```

## DESCRIPTION
Takes an abbreviated IPv6 string and expands it fully

## EXAMPLES

### EXAMPLE 1
```
Expand-IPV6 'fe98::726d:daad:2afc:5393%18'
```

Would return:
FE98:0000:0000:0000:726D:DAAD:2AFC:0000

### EXAMPLE 2
```
Expand-IPV6 'fe98::726d:daad:2afc:5393'
```

Would return:
FE98:0000:0000:0000:726D:DAAD:2AFC:5393

### EXAMPLE 3
```
Expand-IPV6 -IPv6 '::1'
```

Would return:
0000:0000:0000:0000:0000:0000:0000:0001

## PARAMETERS

### -IPv6
A string parameter that represents an IPv6 address

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Source: https://badflyer.com/powershell-ipv4-to-ipv6/

Changes:
- added comment help
- minor formatting changes
TODO rework the function to accept pipeline input
TODO add -IncludeOriginal switch so that both original string and expanded string are shown in output
TODO potentially change so that an invalid IPv6 string returns $null as opposed to throwing an error

## RELATED LINKS

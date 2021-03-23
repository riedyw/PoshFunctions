---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-DottedDecimalIPv4

## SYNOPSIS
Returns a dotted decimal IP address.

## SYNTAX

```
ConvertTo-DottedDecimalIPv4 [-IPAddress] <IPAddress[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-DecimalIP takes 32 bit unsigned integer address into a dotted decimal IP address

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-DottedDecimalIP -IPAddress 16885952
```

Would return
192.168.1.1

### EXAMPLE 2
```
ConvertTo-DottedDecimalIP -IPAddress 16885952 -IncludeInput
```

Would return
IPAddress DottedDecimalIP
--------- ---------------
16885952 192.168.1.1

## PARAMETERS

### -IPAddress
An IP Address to convert.

```yaml
Type: IPAddress[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch that will display input parameters in the output

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

## NOTES

## RELATED LINKS

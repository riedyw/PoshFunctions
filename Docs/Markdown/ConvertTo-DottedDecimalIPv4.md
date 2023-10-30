---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-DottedDecimalIPv4

## SYNOPSIS

Returns a dotted decimal IP address.

## SYNTAX

### __AllParameterSets

```
ConvertTo-DottedDecimalIPv4 [-IPAddress] <IPAddress[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

ConvertTo-DecimalIPv4 takes 32 bit unsigned integer address into a dotted decimal IP address.
Function aliased to 'ConvertTo-DecimalIP'


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-DottedDecimalIPv4 -IPAddress 16885952
```

Would return
192.168.1.1





### Example 2: EXAMPLE 2

```
ConvertTo-DottedDecimalIPv4 -IPAddress 16885952 -IncludeInput
```

Would return
IPAddress DottedDecimalIP
--------- ---------------
16885952 192.168.1.1






## PARAMETERS

### -IncludeInput

Switch that will display input parameters in the output

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

### -IPAddress

An IP Address to convert.

```yaml
Type: IPAddress[]
Parameter Sets: (All)
Aliases: 
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



## RELATED LINKS

Fill Related Links Here


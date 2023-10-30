---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-DecimalIPv4

## SYNOPSIS

Converts a Dotted Decimal IP address into a 32-bit unsigned integer.

## SYNTAX

### __AllParameterSets

```
ConvertTo-DecimalIPv4 [-IPAddress] <IPAddress[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

ConvertTo-DecimalIP takes a dotted decimal IP and uses the [ipaddress] accelerator to determine 32 bit decimal value.
Function aliased to 'ConvertTo-DecimalIP'


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-DecimalIPv4 -IPAddress 10.20.30.40
```

Would return
673059850





### Example 2: EXAMPLE 2

```
ConvertTo-DecimalIPv4 -IPAddress 192.168.1.1
```

Would return
16885952





### Example 3: EXAMPLE 3

```
Would return
```

IPAddress   DecimalIP
---------   ---------
192.168.1.1  16885952
10.100.10.1  17458186






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

## OUTPUTS

### string



## NOTES



## RELATED LINKS

Fill Related Links Here


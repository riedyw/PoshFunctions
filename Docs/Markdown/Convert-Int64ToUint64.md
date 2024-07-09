---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-Int64ToUint64

## SYNOPSIS

Converts int64 values to uint64 values

## SYNTAX

### __AllParameterSets

```
Convert-Int64ToUint64 [-Number] <Int64[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts int64 values to uint64 values.
Useful for handling 32 bitmasks returned from some functions like Get-Acl


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-int64ToUint64 -Number -1610612736,-1,0x800000000000005b -IncludeInput
```

int64  Uint64
               -----  ------
         -1610612736 18446744072098938880
                  -1 18446744073709551615
-9223372036854775717  9223372036854775899





### Example 2: EXAMPLE 2

```
Convert-int64ToUint64 -Number -1610612736
```

2684354560






## PARAMETERS

### -IncludeInput

Switch to include the input in the output

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

### -Number

An array of int64 values

```yaml
Type: Int64[]
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


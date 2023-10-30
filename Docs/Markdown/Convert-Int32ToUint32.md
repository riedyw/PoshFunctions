---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-Int32ToUint32

## SYNOPSIS

Converts int32 values to uint32 values

## SYNTAX

### __AllParameterSets

```
Convert-Int32ToUint32 [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts int32 values to uint32 values.
Useful for handling 32 bitmasks returned from some functions like Get-Acl


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-Int32ToUint32 -Number -1610612736,-1 -IncludeInput
```

Int32     Uint32
      -----     ------
-1610612736 2684354560
         -1 4294967295





### Example 2: EXAMPLE 2

```
Convert-Int32ToUint32 -Number -1610612736
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

An array of int32 values

```yaml
Type: Int32[]
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


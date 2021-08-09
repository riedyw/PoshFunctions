---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Convert-Int32ToUint32

## SYNOPSIS
Converts int32 values to uint32 values

## SYNTAX

```
Convert-Int32ToUint32 [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts int32 values to uint32 values.
Useful for handling 32 bitmasks returned from some functions like Get-Acl

## EXAMPLES

### EXAMPLE 1
```
Convert-Int32ToUint32 -Number -1610612736,-1 -IncludeInput
```

Int32     Uint32
      -----     ------
-1610612736 2684354560
         -1 4294967295

### EXAMPLE 2
```
Convert-Int32ToUint32 -Number -1610612736
```

2684354560

## PARAMETERS

### -Number
An array of int32 values

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input in the output

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

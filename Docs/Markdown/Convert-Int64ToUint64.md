---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Convert-Int64ToUint64

## SYNOPSIS
Converts int64 values to uint64 values

## SYNTAX

```
Convert-Int64ToUint64 [-Number] <Int64[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts int64 values to uint64 values.
Useful for handling 32 bitmasks returned from some functions like Get-Acl

## EXAMPLES

### EXAMPLE 1
```
Convert-int64ToUint64 -Number -1610612736,-1,0x800000000000005b -IncludeInput
```

int64  Uint64
               -----  ------
         -1610612736 18446744072098938880
                  -1 18446744073709551615
-9223372036854775717  9223372036854775899

### EXAMPLE 2
```
Convert-int64ToUint64 -Number -1610612736
```

2684354560

## PARAMETERS

### -Number
An array of int64 values

```yaml
Type: Int64[]
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

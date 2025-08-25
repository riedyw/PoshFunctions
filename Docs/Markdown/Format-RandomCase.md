---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-RandomCase

## SYNOPSIS
Formats a string character by character randomly into upper or lower case.

## SYNTAX

```
Format-RandomCase [[-String] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Formats a string character by character randomly into upper or lower case.

## EXAMPLES

### EXAMPLE 1
```
Format-RandomCase -String 'HELLO WORLD IT IS ME!'
```

Example return
HelLo worlD It is me!

### EXAMPLE 2
```
Format-RandomCase -String HELLO, WORLD, IT, IS, ME -IncludeInput
```

Example return
Original Return
-------- ------
HELLO    hELLo
WORLD    wORLd
IT       It
IS       is
ME       ME

## PARAMETERS

### -String
A \[string\[\]\] that you want formatted randomly into upper or lower case

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
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

### [string[]]
## NOTES

## RELATED LINKS

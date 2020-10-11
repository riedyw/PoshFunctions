---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-RandomHexDigit

## SYNOPSIS
Gets a random hex digit, or a string of hex digits

## SYNTAX

```
Get-RandomHexDigit [[-Length] <Int16>] [-IncludePrefix] [-UpperCase] [<CommonParameters>]
```

## DESCRIPTION
Gets a random hex digit, or a string of hex digits

## EXAMPLES

### EXAMPLE 1
```
Get-RandomHexDigit -Length 4
```

f293

### EXAMPLE 2
```
Get-RandomHexDigit -Length 2 -IncludePrefix
```

0x2d

### EXAMPLE 3
```
Get-RandomHexDigit -Length 6 -UpperCase
```

92C08A

## PARAMETERS

### -Length
{{ Fill Length Description }}

```yaml
Type: Int16
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludePrefix
{{ Fill IncludePrefix Description }}

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

### -UpperCase
{{ Fill UpperCase Description }}

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

---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-IsHexString

## SYNOPSIS
Tests to determine if a string is a valid hexadecimal number.
Can optionally include a prefix of '0x' or '#'

## SYNTAX

```
Test-IsHexString [[-HexString] <String[]>] [-IncludeInput] [-AllowPrefix] [<CommonParameters>]
```

## DESCRIPTION
Tests to determine if a string is a valid hexadecimal number.
Can optionally include a prefix of '0x' or '#'.
Can accept a string, an array of strings, or pipeline input.

## EXAMPLES

### EXAMPLE 1
```
Test-IsHexString '123abc'
```

True

### EXAMPLE 2
```
Test-IsHexString 'lmnop'
```

False

### EXAMPLE 3
```
test-ishexstring @('0x1','#1abcdef','3c') -IncludeInput  -AllowPrefix
```

Input    AllowPrefix Result
-----    ----------- ------
0x1             True   True
#1abcdef        True   True
3c              True   True

### EXAMPLE 4
```
Test-IsHexString '123abc' -Verbose
```

VERBOSE: $h is \[123abc\]
True

## PARAMETERS

### -HexString
{{ Fill HexString Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Hex

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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

### -AllowPrefix
{{ Fill AllowPrefix Description }}

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

### bool
## NOTES

## RELATED LINKS

---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# Measure-Char

## SYNOPSIS
To count the number of times a character appears in a string, or an array of strings.

## SYNTAX

```
Measure-Char [-String] <String[]> [-Char] <Char> [-IgnoreCase] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To count the number of times a character appears in a string, or an array of strings.
By default the function is case sensitive, but can be controlled with the $IgnoreCase switch.
Can also optionally include the command line parameters passed to the program with the $IncludeInput switch

## EXAMPLES

### EXAMPLE 1
```
Measure-Char -String 'Password' -Char 'S' -IgnoreCase -IncludeInput
```

Would return
String   Char IgnoreCase Count
------   ---- ---------- -----
Password    S True           2

### EXAMPLE 2
```
Measure-Char -String 'Password' -Char 'S'
```

Would return
0
as the function by default is case sensitive.

## PARAMETERS

### -String
A string, or an array of strings to count character against.
Can accept pipeline input.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Char
The individual character that you wish to count occurrences of.

```yaml
Type: Char
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreCase
By default this function is case sensitive and this switch makes the function case insensitive.

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

### -IncludeInput
A switch to display the parameters specified when the function was called and the resulting count.
Aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal

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

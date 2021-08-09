---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-InvalidFileCharacter

## SYNOPSIS
Gets invalid filename characters

## SYNTAX

```
Get-InvalidFileCharacter [-IncludeValues] [-Printable] [<CommonParameters>]
```

## DESCRIPTION
Gets invalid filename characters.
Function aliased to 'Show-InvalidFileCharacter'
for backward compatibility.

## EXAMPLES

### EXAMPLE 1
```
Get-InvalidFileCharacter -Printable
```

Would return
"
\<
\>
|
:
*
?
\
/

### EXAMPLE 2
```
Get-InvalidFileCharacter -Printable -IncludeValues
```

Would return
Char Dec Hex
---- --- ---
   "  34 22
   \<  60 3c
   \>  62 3e
   | 124 7c
   :  58 3a
   *  42 2a
   ? 
63 3f
   \  92 5c
   /  47 2f

## PARAMETERS

### -IncludeValues
Switch indicating that decimal and hexadecimal representations of characters are to be included in output

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

### -Printable
Switch indicating that only printable characters are to be in the output

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

### System.Char[]
## NOTES

## RELATED LINKS

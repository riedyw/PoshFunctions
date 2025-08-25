---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-WrapText

## SYNOPSIS
Wraps text at a particular column width

## SYNTAX

### Width (Default)
```
Format-WrapText [-Text] <String[]> [-Width <Int32>] [<CommonParameters>]
```

### Screen
```
Format-WrapText [-Text] <String[]> [-Screen] [<CommonParameters>]
```

## DESCRIPTION
Wraps text at a particular column width (Default=80).
Function aliased to 'WrapText'.

## EXAMPLES

### EXAMPLE 1
```
Format-WrapText -Text "word1 word2 word3 word4 word5" -Width 12
```

Would return
word1 word2
word3 word4
word5

## PARAMETERS

### -Text
The text to be formatted

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

### -Width
Column width to wrap at.
Default = 80

```yaml
Type: Int32
Parameter Sets: Width
Aliases:

Required: False
Position: Named
Default value: 80
Accept pipeline input: False
Accept wildcard characters: False
```

### -Screen
A switch indicating that the wrap should occur at the width of the current Powershell window.

```yaml
Type: SwitchParameter
Parameter Sets: Screen
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

### [String]
## NOTES

## RELATED LINKS

[Format-Table
Format-List]()


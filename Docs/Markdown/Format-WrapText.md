---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
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

### Example 1: EXAMPLE 1

```
Format-WrapText -Text "word1 word2 word3 word4 word5" -Width 12
```

Would return
word1 word2
word3 word4
word5






## PARAMETERS

### -Screen

A switch indicating that the wrap should occur at the width of the current Powershell window.

```yaml
Type: SwitchParameter
Parameter Sets: Screen
Aliases: 
Accepted values: 

Required: True (None) False (Screen)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Text

The text to be formatted

```yaml
Type: String[]
Parameter Sets: Screen, Width
Aliases: 
Accepted values: 

Required: True (Screen, Width) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Width

Column width to wrap at.
Default = 80

```yaml
Type: Int32
Parameter Sets: Width
Aliases: 
Accepted values: 

Required: True (None) False (Width)
Position: Named
Default value: 80
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [String]



## NOTES



## RELATED LINKS

[Format-Table
Format-List] ()


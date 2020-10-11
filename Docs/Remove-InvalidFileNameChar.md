---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-InvalidFileNameChar

## SYNOPSIS
Removes characters from a string that are not valid in Windows file names.

## SYNTAX

### Normal (Default)
```
Remove-InvalidFileNameChar [-Name] <String[]> [-RemoveSpace] [<CommonParameters>]
```

### Replace
```
Remove-InvalidFileNameChar [-Name] <String[]> [-Replacement] <String> [[-RemoveOnly] <Object[]>] [-RemoveSpace]
 [<CommonParameters>]
```

## DESCRIPTION
Remove-InvalidFileNameChar accepts a string and removes characters that are invalid in Windows file names. 
It then outputs the cleaned string. 
By default the space character is ignored, but can be included using the RemoveSpace parameter.

The Replacement parameter will replace the invalid characters with the specified string.
Its companion RemoveOnly will exempt given invalid characters from being replaced, and will simply be removed.
Charcters in this list can be given as a string or their decimal or hexadecimal representation.

The Name parameter can also clean file paths.
If the string begins with "\\\\" or a drive like "C:\", it will then treat the string as a file path and clean the strings between "\". 
This has the side effect of removing the ability to actually remove the "\" character from strings since it will then be considered a divider.

## EXAMPLES

### EXAMPLE 1
```
Remove-InvalidFileNameChar -Name "<This /name \is* an :illegal ?filename>.txt"
```

Will return
This name is an illegal filename.txt

### EXAMPLE 2
```
Remove-InvalidFileNameChar -Name "<This /name \is* an :illegal ?filename>.txt" -RemoveSpace
```

Will return
Thisnameisanillegalfilename.txt

### EXAMPLE 3
```
Remove-InvalidFileNameChar -Name '\\Path/:|?*<\With:*?>\:Illegal /Characters>?*.txt"'
```

Will return
\\\\Path\With\Illegal Characters.txt

This command will strip the invalid characters from the path and output a valid path.
Note: it would not be able to remove the "\" character.

### EXAMPLE 4
```
Remove-InvalidFileNameChar -Name '\\Path/:|?*<\With:*?>\:Illegal /Characters>?*.txt"' -RemoveSpace
```

Output: \\\\Path\With\IllegalCharacters.txt

This command will strip the invalid characters from the path and output a valid path, also removing the space character (U+0020) as well.
Note: it would not be able to remove the "\" character.

### EXAMPLE 5
```
Remove-InvalidFileNameChar -Name "<This /name \is* an :illegal ?filename>.txt" -Replacement +
```

Output: +This +name +is+ an +illegal +filename+.txt

This command will strip the invalid characters from the string, replacing them with a "+", and outputting the result string.

### EXAMPLE 6
```
Remove-InvalidFileNameChar -Name "<This /name \is* an :illegal ?filename>.txt" -Replacemet + -RemoveOnly "*", 58, 0x3f
```

Output: +This +name +is an illegal filename+.txt

This command will strip the invalid characters from the string, replacing them with a "+", except the "*", the charcter with a decimal value of 58 (:), and the character with a hexidecimal value of 0x3f (?).
These will simply be removed, and the resulting string output.

## PARAMETERS

### -Name
Specifies the file name to strip of invalid characters.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Replacement
Specifies the string to use as a replacement for the invalid characters.

```yaml
Type: String
Parameter Sets: Replace
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveOnly
Specifes the list of invalid characters to remove from the string instead of being replaced by the Replacement parameter value.
This may be given as one character strings, or their decimal or hexidecimal values.

```yaml
Type: Object[]
Parameter Sets: Replace
Aliases: RO

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveSpace
The RemoveSpace parameter will include the space character (U+0020) in the removal process.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: RS

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
### Remove-InvalidFileNameChar accepts System.String objects in the pipeline.
### Remove-InvalidFileNameChar accepts System.String objects in a property Name from objects in the pipeline.
## OUTPUTS

### System.String
## NOTES
Author:  Chris Carter
Version: 1.5.1
Last Updated: August 8, 2016

## RELATED LINKS

[System.RegEx]()

[about_Join]()

[about_Operators]()


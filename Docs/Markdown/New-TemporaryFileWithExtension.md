---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-TemporaryFileWithExtension

## SYNOPSIS

Create a temporary file with a custom extension

## SYNTAX

### __AllParameterSets

```
New-TemporaryFileWithExtension [-Extension] <String> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Create a temporary file with a custom extension.
Returns an object of type [System.IO.FileInfo].


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-TemporaryFileWithExtension -Extension .png -IncludeInput
```

TempFile                                     Extension
--------                                     ---------
C:\Users\USER\AppData\Local\Temp\tmp189E.png .png






## PARAMETERS

### -Extension

The desired extension for the temporary file.
MUST begin with a '.' and NOT contain any embedded spaces.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Return a psobject with the extension specified and resulting tempfile

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.IO.FileInfo



## NOTES

Inspired by: https://david.gardiner.net.au/2018/08/create-temporary-file-with-custom.html

Extension MUST begin with a '.' and NOT contain any embedded spaces.
Forces extension to lower case.


## RELATED LINKS

Fill Related Links Here


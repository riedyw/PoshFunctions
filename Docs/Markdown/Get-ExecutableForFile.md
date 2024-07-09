---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ExecutableForFile

## SYNOPSIS

Given a file, determine what program is associated with file.

## SYNTAX

### __AllParameterSets

```
Get-ExecutableForFile [-Path] <String> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Given a file, determine what program is associated with file.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ExecutableForFile -Path .\sample.docx
```

C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE






## PARAMETERS

### -IncludeInput

Include the specified file as part of the output

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

### -Path

The path to a file

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by http://community.idera.com/powershell/powertips/b/tips/posts/finding-executable-for-file
Added logic to resolve relative path to file
Added logic to test if item is a file and not a folder
Added -IncludeInput as an option.


## RELATED LINKS

Fill Related Links Here


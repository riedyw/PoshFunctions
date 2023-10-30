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
Get-ExecutableForFile [-Path] <String> [<CommonParameters>]
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

# source http://community.idera.com/powershell/powertips/b/tips/posts/finding-executable-for-file
# requires explicit path NOT relative


## RELATED LINKS

Fill Related Links Here


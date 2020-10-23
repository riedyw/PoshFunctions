---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-ExecutableForFile

## SYNOPSIS
Given a file, determine what program is associated with file.

## SYNTAX

```
Get-ExecutableForFile [-Path] <String> [<CommonParameters>]
```

## DESCRIPTION
Given a file, determine what program is associated with file.

## EXAMPLES

### EXAMPLE 1
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

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

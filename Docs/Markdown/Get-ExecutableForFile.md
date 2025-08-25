---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-ExecutableForFile

## SYNOPSIS
Given a file, determine what program is associated with file.

## SYNTAX

```
Get-ExecutableForFile [-Path] <String> [-IncludeInput] [<CommonParameters>]
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

### -IncludeInput
Include the specified file as part of the output

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

## NOTES
Inspired by http://community.idera.com/powershell/powertips/b/tips/posts/finding-executable-for-file
Added logic to resolve relative path to file
Added logic to test if item is a file and not a folder
Added -IncludeInput as an option.

## RELATED LINKS

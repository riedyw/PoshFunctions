---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertTo-UncPath

## SYNOPSIS
A simple function to convert a local file path and a computer name to a network UNC path.

## SYNTAX

```
ConvertTo-UncPath [-Path] <String> [[-ComputerName] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-UncPath -LocalFilePath 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer'
```

\\\\SomeRemoteComputer\c$\adminTools\SomeFolder

### EXAMPLE 2
```
ConvertTo-UncPath -LocalFilePath 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer','SomeAnotherComputer'
```

\\\\SomeRemoteComputer\c$\adminTools\SomeFolder
\\\\SomeAnotherComputer\c$\adminTools\SomeFolder

## PARAMETERS

### -Path
Add help message for user

```yaml
Type: String
Parameter Sets: (All)
Aliases: LocalFilePath

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ComputerName
One or more computers in which the file path exists on

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Will create a string for remote computer path
## NOTES

## RELATED LINKS

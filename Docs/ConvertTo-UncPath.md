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
ConvertTo-UncPath [-Path] <String> [[-ComputerName] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
A simple function to convert a local file path and a computer name to a network UNC path.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer'
```

\\\\SomeRemoteComputer\c$\adminTools\SomeFolder

### EXAMPLE 2
```
ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer','SomeAnotherComputer'
```

\\\\SomeRemoteComputer\c$\adminTools\SomeFolder
\\\\SomeAnotherComputer\c$\adminTools\SomeFolder

### EXAMPLE 3
```
ConvertTo-UncPath -Path 'c:\Temp' -ComputerName DemoLaptop -IncludeInput
```

Would return
ComputerName Path    UNCPath
------------ ----    -------
DemoLaptop   c:\Temp \\\\DemoLaptop\c$\Temp

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
One or more computers in which the file path exists on.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN, Server

Required: False
Position: 2
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to include input parameters in output

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

### Will create a string for remote computer path
## NOTES
Inspired by: https://www.powershellgallery.com/packages/PPoShTools/1.0.19
* added -IncludeInput

## RELATED LINKS

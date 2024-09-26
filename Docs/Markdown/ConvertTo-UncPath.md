---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-UncPath

## SYNOPSIS

A simple function to convert a local file path and a computer name to a network UNC path.

## SYNTAX

### __AllParameterSets

```
ConvertTo-UncPath [-Path] <String> [[-ComputerName <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

A simple function to convert a local file path and a computer name to a network UNC path.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer'
```

\\SomeRemoteComputer\c$\adminTools\SomeFolder





### Example 2: EXAMPLE 2

```
ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer','SomeAnotherComputer'
```

\\SomeRemoteComputer\c$\adminTools\SomeFolder
\\SomeAnotherComputer\c$\adminTools\SomeFolder





### Example 3: EXAMPLE 3

```
ConvertTo-UncPath -Path 'c:\Temp' -ComputerName DemoLaptop -IncludeInput
```

Would return
ComputerName Path    UNCPath
------------ ----    -------
DemoLaptop   c:\Temp \\DemoLaptop\c$\Temp






## PARAMETERS

### -ComputerName

One or more computers in which the file path exists on.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to include input parameters in output

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

Add help message for user

```yaml
Type: String
Parameter Sets: (All)
Aliases: LocalFilePath
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### Will create a string for remote computer path



## NOTES

Inspired by: https://www.powershellgallery.com/packages/PPoShTools/1.0.19
* added -IncludeInput


## RELATED LINKS

Fill Related Links Here


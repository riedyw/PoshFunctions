---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ComputerSite

## SYNOPSIS

Determines the Active Directory site of a specified computername(s). Relies on nltest.exe that comes with Windows

## SYNTAX

### __AllParameterSets

```
Get-ComputerSite [[-ComputerName <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Determines the Active Directory site of a specified computername(s).
Relies on nltest.exe that comes with Windows


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ComputerSite
```

Example result
CORP





### Example 2: EXAMPLE 2

```
Get-ComputerSite -IncludeInput
```

Example result
ComputerName Site
------------ ----
DEMOLAPTOP   CORP






## PARAMETERS

### -ComputerName

The computername you want to run the command against, defaults to $env:COMPUTERNAME.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch that will display input parameter in the output.
Aliased to 'IncludeComputerName'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeComputerName
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

## NOTES



## RELATED LINKS

Fill Related Links Here


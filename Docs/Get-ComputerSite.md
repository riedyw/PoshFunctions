---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-ComputerSite

## SYNOPSIS
Determines the Active Directory site of a specified computername(s).
Relies on nltest.exe that comes with Windows

## SYNTAX

```
Get-ComputerSite [[-ComputerName] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Determines the Active Directory site of a specified computername(s).
Relies on nltest.exe that comes with Windows

## EXAMPLES

### EXAMPLE 1
```
Get-ComputerSite
```

Example result
CORP

### EXAMPLE 2
```
Get-ComputerSite -IncludeInput
```

Example result
ComputerName Site
------------ ----
DEMOLAPTOP   CORP

## PARAMETERS

### -ComputerName
The computername you want to run the command against, defaults to $env:COMPUTERNAME

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch that will display input parameter in the output.
Aliased to 'IncludeComputerName'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeComputerName

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

## RELATED LINKS

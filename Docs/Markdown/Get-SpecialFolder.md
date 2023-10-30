---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-SpecialFolder

## SYNOPSIS
Gets special folder name location

## SYNTAX

```
Get-SpecialFolder [[-Name] <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Gets special folder name location.
Function aliased to 'Show-SpecialFolder' for
backward compatibility.

## EXAMPLES

### EXAMPLE 1
```
Get-SpecialFolder -Name CommonDocuments -IncludeInput
```

Would return
SpecialFolder   Path
-------------   ----
CommonDocuments C:\Users\Public\Documents

### EXAMPLE 2
```
Get-SpecialFolder -Name MyDocuments -IncludeInput
```

Would return the following if logged in as 'SampleUser'
SpecialFolder Path
------------- ----
MyDocuments   C:\Users\SampleUser\Documents

## PARAMETERS

### -Name
The name of the special folder

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input in the output

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

## RELATED LINKS

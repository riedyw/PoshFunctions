---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-SharePermission

## SYNOPSIS
To get permission information on specified ShareName

## SYNTAX

```
Get-SharePermission [[-sharename] <String>] [<CommonParameters>]
```

## DESCRIPTION
To get permission information on specified ShareName

## EXAMPLES

### EXAMPLE 1
```
Get-SharePermission -ShareName "C$"
```

Would return:
A listing of all permissions on the "C$" share

## PARAMETERS

### -sharename
The name of the share, exact match only

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### An array of objects containing the fields ComputerName, ShareName, Domain, ID, AccessMask, AceType
## NOTES
Author:     Bill Riedy
Version:    1.0
Date:       2018/03/13
Notes:      None at this time

## RELATED LINKS
